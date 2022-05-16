import 'package:flutter/material.dart';
import 'package:pointz/Views/Screens/onboarding_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return OnBoarding();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kMainColor,
        child: Center(
          child: SizedBox(
            height: 50.h,
            width: 75.w,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
