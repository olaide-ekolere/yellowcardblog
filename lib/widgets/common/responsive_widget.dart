import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  ResponsiveWidget({
    required this.smallScreen,
    required this.mediumScreen,
    required this.largeScreen,
  });
  final Widget smallScreen;
  final Widget mediumScreen;
  final Widget largeScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      //set breaking points

      //Large screen is any screen whose width is more than 1200 pixels
      if (constraints.maxWidth > 1200)
        return largeScreen;
      //Medium screen is any screen whose width is less than 1200 pixels,
      //and more than 800 pixels
      else if (constraints.maxWidth > 800)
        return mediumScreen;
      else
        //Small screen is any screen whose width is less than 800 pixels
        return smallScreen;
    });
  }
}
