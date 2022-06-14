import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/notification_item.dart';
import '../Widgets/simple_Header.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Container(
                    height: 90.h,
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return NotificationItem();
                        },
                        separatorBuilder: (context, _) {
                          return Divider(
                            height: 3.h,
                          );
                        },
                        itemCount: 10),
                  ),
                ),
                SimpleHeader(
                  headerTitle: 'الإشعارات',
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.w),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Icon(
                            Icons.arrow_back,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
