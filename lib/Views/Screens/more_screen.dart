import 'package:flutter/material.dart';
import 'package:pointz/Views/Widgets/more_item_card.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/simple_Header.dart';

class MoreScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  MoreScreen({this.navBarScreenContext});
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleHeader(
          headerTitle: 'المزيد',
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                //header
                MoreItemCard(
                    title: "وسائل الدفع",
                    iconUrl: "assets/icons/paymentIcon.svg",
                    onTabButton: () {}),

                MoreItemCard(
                    title: "المفضله",
                    iconUrl: "assets/icons/empty-heart.svg",
                    onTabButton: () {}),

                MoreItemCard(
                    title: "تغيير اللغه",
                    iconUrl: "assets/icons/langs.svg",
                    onTabButton: () {}),

                MoreItemCard(
                    title: "المساعده والدعم",
                    iconUrl: "assets/icons/support.svg",
                    onTabButton: () {}),

                MoreItemCard(
                    title: "سياسه الخصوصيه",
                    iconUrl: "assets/icons/policy.svg",
                    onTabButton: () {}),

                MoreItemCard(
                    title: "الشروط والاحكام",
                    iconUrl: "assets/icons/conditions.svg",
                    onTabButton: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
