import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Views/Widgets/custom_alert_dialog.dart';
import '../constants/colors.dart';

List<int> favList = [];
List<int> unFavList = [];

addToFavList(int id) {
  if (unFavList.isEmpty) {
    favList.add(id);
  } else {
    if (unFavList.contains(id)) {
      unFavList.remove(id);
    }
    favList.add(id);
  }
}

addToUnFavList(int id) {
  if (favList.isEmpty) {
    unFavList.add(id);
  } else {
    if (favList.contains(id)) {
      favList.remove(id);
    }
    unFavList.add(id);
  }
}

checkInFavList(int id) {
  if (favList.isNotEmpty) {
    if (favList.contains(id)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

checkInUnFavList(int id) {
  if (unFavList.isNotEmpty) {
    if (unFavList.contains(id)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

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
                color: Colors.black,
                fontFamily: "Taga",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
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
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: kMainColor, width: 2),
          ),
          child: Padding(
            padding: EdgeInsets.all(0.h),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              radius: 2.h,
              foregroundImage: AssetImage("assets/images/loader.gif"),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "إنتظر تحميل البيانات...",
          style: TextStyle(
              color: kMainColor,
              fontFamily: "Taga",
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

TextDirection getDirection(BuildContext context) {
  if (translator.isDirectionRTL(context)) {
    return TextDirection.rtl;
  } else {
    return TextDirection.ltr;
  }
}

bool checkRTL(BuildContext context) {
  return translator.isDirectionRTL(context);
}

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

String getUrl(int key) {
  if (Platform.isAndroid) {
    // add the [https]
    return "https://wa.me/$key/}"; // new line
  } else {
    // add the [https]
    return "https://api.whatsapp.com/send?phone=$key}"; // new line
  }
}
