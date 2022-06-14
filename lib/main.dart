import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'Views/Screens/splash_screen.dart';

void main() {
  runApp(Pointz() /*DevicePreview(builder: (_) => Pointz())*/);
}

class Pointz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Sizer(
      builder: (BuildContext context, Orientation orientation, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: SplashScreen()),
          /*builder: (context, Widget) => SafeArea(child: SplashScreen()),*/
        );
      },
    );
  }
}
