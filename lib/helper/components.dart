import 'package:flutter/material.dart';
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
