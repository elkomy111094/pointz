import 'package:flutter/material.dart';
import 'package:pointz/Views/Screens/product_screen.dart';
import 'package:pointz/Views/Widgets/offer_item_widget.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../Widgets/categoryItems.dart';
import '../Widgets/simple_Header.dart';

class OffersScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  OffersScreen({this.navBarScreenContext});
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SimpleHeader(
            headerTitle: "العروض",
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Text(
                          "كل الفئات",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: kMainColor,
                              fontFamily: "Taga",
                              fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10.h,
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryItems(
                            navBarContext: widget.navBarScreenContext!,
                            onTapItem: () {},
                          );
                        },
                        separatorBuilder: (context, _) {
                          return SizedBox(
                            width: 3.5.w,
                          );
                        },
                        itemCount: 20),
                  ),
                  Divider(
                    height: 1.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                "كل المطاعم",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "Taga",
                                    fontSize: 10.sp),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 55.h,
                          child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return OfferItemWidget(
                                  currentContext: context,
                                  tabNavigateToScreen: ProductScreen(),
                                );
                              },
                              separatorBuilder: (context, _) {
                                return SizedBox(
                                  height: 3.5.w,
                                );
                              },
                              itemCount: 5),
                        ), // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
