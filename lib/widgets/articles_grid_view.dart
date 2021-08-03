import 'package:flutter/material.dart';
import 'package:yellowcardblog/bloc/articles_bloc.dart';
import 'package:yellowcardblog/listitems/article_list_item.dart';
import 'package:yellowcardblog/models/article.dart';
import 'package:yellowcardblog/widgets/common/responsive_widget.dart';

class ArticlesGridView extends StatefulWidget {
  final ArticlesBloc articlesBloc;
  final Function(Article) articleSelected;
  final String categoryId;
  ArticlesGridView({
    required this.articlesBloc,
    required this.articleSelected,
    required this.categoryId,
  });
  createState() => _ArticlesGridViewState();
}

class _ArticlesGridViewState extends State<ArticlesGridView> {
  late ArticlesBloc _articlesBloc;
  late String _categoryId;
  @override
  void initState() {
    super.initState();
    _articlesBloc = widget.articlesBloc;
    _categoryId = widget.categoryId;
    _articlesBloc.fetchArticles(_categoryId);
  }

  @override
  void didUpdateWidget(covariant ArticlesGridView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryId != widget.categoryId) {
      _categoryId = widget.categoryId;
      _articlesBloc.fetchArticles(_categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _articlesBloc.articles,
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasError) {
          return _errorWidget();
        } else if (snapshot.hasData) {
          return _bodyWidget(snapshot.data);
        } else {
          return _loadingWidget();
        }
      },
    );
  }

  Widget _errorWidget() {
    return Container(
      color: Colors.red,
    );
  }

  Widget _loadingWidget() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _bodyWidget(List<Article>? data) {
    if (data == null || data.isEmpty) {
      return _emptyWidget();
    } else {
      return ResponsiveWidget(
        smallScreen: _contentWidget(
          data,
          columns: 1,
          height: 200.0,
          aspectRatio: 1.0,
        ),
        mediumScreen: _contentWidget(
          data,
          columns: 2,
          height: 200.0,
          aspectRatio: 0.9,
        ),
        largeScreen: _contentWidget(
          data,
          columns: 3,
          height: 200.0,
          aspectRatio: 1.0,
        ),
      );
    }
  }

  Widget _emptyWidget() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.hourglass_empty,
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentWidget(
    List<Article> data, {
    required int columns,
    required double height,
    required double aspectRatio,
  }) {
    return GridView.count(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: columns,
      childAspectRatio: aspectRatio,
      crossAxisSpacing: 16.0,
      children: data
          .map(
            (article) => ArticleListItem(
              article: article,
              articleClicked: widget.articleSelected,
              height: height,
            ),
          )
          .toList(),
    );
  }
}
