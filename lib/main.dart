import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'Views/Screens/splash_screen.dart';

void main() {
  runApp(/*Pointz()*/ DevicePreview(builder: (_) => Pointz()));
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class Pointz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
