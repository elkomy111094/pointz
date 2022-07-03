import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Screens/bottom_navbar_screen.dart';
import 'package:pointz/Views/Screens/onboarding/onboarding_screen.dart';
import 'package:pointz/Views/Screens/registeration/phone_registeration_screen.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  String next;

  SplashScreen({required this.next});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool logoAppearance = false;

  Future<void> getLoggedInUserData(BuildContext context) async {
    if (widget.next == "NavBar") {
      RegisterationCubit inst = RegisterationCubit.get(context);
      inst.getUserDetails(
          phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber!,
          UID: FirebaseAuth.instance.currentUser!.uid);
    } else {}
  }

  getNextScreen() {
    if (widget.next == "NavBar") {
      return NavBarScreen();
    } else if (widget.next == "Login") {
      return PhoneRegisterationScreen();
    } else {
      return OnBoarding();
    }
  }

  @override
  void initState() {
    RegisterationCubit inst = RegisterationCubit.get(context);
    getLoggedInUserData(context).then((value) {
      if (inst.userResponse == null) {
        Future.delayed(Duration(seconds: 5), () {
          pushToStack(context, getNextScreen());
        });
      } else {
        pushToStack(context, getNextScreen());
      }
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        logoAppearance = !logoAppearance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setEnabledSystemUIOverlays([]);*/
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: kMainColor,
          child: Center(
            child: AnimatedContainer(
              height: logoAppearance ? 50.h : 0,
              width: logoAppearance ? 75.w : 0,
              duration: Duration(seconds: 3),
              curve: Curves.easeInOut,
              child: SvgPicture.asset(
                "assets/icons/pointz.svg",
                color: Colors.white,
                height: logoAppearance ? 50.h : 0,
                width: logoAppearance ? 75.w : 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
