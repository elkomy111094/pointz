import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../Views/Widgets/custom_alert_dialog.dart';
import '../constants/colors.dart';

pushToStack(context, widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

pushToStackAndReplacement(context, widget) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

pushToStackAndRemoveUntil(context, widget) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
    return widget;
  }), (route) => false);
}

pop(context) {
  Navigator.of(context).pop();
}

showToast(BuildContext context, String msg) {
  final scaffold = ScaffoldMessenger.of(context);
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black54,
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return CustomAlertDialog(
        onTapXButton: () {
          pop(context);
        },
        content: Padding(
          padding:
              EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w, bottom: 5.h),
          child: Text(
            msg,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontFamily: "Taga", fontSize: 14.sp),
          ),
        ),
        cardImgUrl: "assets/icons/info.svg",
      );
    },
  );
}

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kMainColor),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}

void showToastMessage({required String text}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: kMainColor,
      textColor: Colors.white,
      fontSize: 12.sp);
}

Uint8List convertBase64Url({
  required String base64Url,
}) {
  return Base64Decoder().convert(base64Url);
}

Widget loader() {
  return Center(
    child: CircularProgressIndicator(
      color: kMainColor,
    ),
  );
}
