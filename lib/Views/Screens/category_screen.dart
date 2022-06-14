import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Screens/products_provider_details_screen.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../Widgets/cardItem.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int productsCategorySelectedIndex = 0;
  List<String> providerProductsCategoroies = [
    "اللحوم",
    "الدجاج",
    "اسماك",
    "أطباق جانبيه",
    "المشروبات",
    "فطار",
    "غداء",
    "عشاء",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: 20.h,
                color: kMainColor.withOpacity(.05),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
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
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  "مطاعم",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Taga",
                                      fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //search form
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: .5.h, horizontal: 5.w),
                      child: SquareTextField(
                          fillColor: Colors.white,
                          hintText: "...ابحث عن متجرك المفضل",
                          onChanged: (val) {},
                          preFixWidget: Padding(
                            padding: EdgeInsets.all(1.h),
                            child: SvgPicture.asset(
                              "assets/icons/search.svg",
                              width: 3.h,
                              height: 3.h,
                            ),
                          ),
                          onSave: (val) {}),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //header
                      Container(
                        height: 7.h,
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Center(
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        productsCategorySelectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              productsCategorySelectedIndex ==
                                                      index
                                                  ? kMainColor
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.h)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: .5.h),
                                        child: Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                text:
                                                    providerProductsCategoroies[
                                                        index],
                                                style: TextStyle(
                                                    color:
                                                        productsCategorySelectedIndex ==
                                                                index
                                                            ? Colors.white
                                                            : Colors.black,
                                                    fontSize: 12.sp,
                                                    fontFamily: "Taga")),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, _) {
                                  return SizedBox(
                                    width: 3.5.w,
                                  );
                                },
                                itemCount: providerProductsCategoroies.length),
                          ),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  child: Text(
                                    "مطاعم موصي بها",
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
                              height: 32.h,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CardItem(
                                      currentContext: context,
                                      tabNavigateToScreen:
                                          ProductsProviderDetailsScreen(),
                                    );
                                  },
                                  separatorBuilder: (context, _) {
                                    return SizedBox(
                                      width: 3.5.w,
                                    );
                                  },
                                  itemCount: 5),
                            ), // )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 3.w),
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
                              height: 75.h,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return CardItem(
                                      currentContext: context,
                                      tabNavigateToScreen:
                                          ProductsProviderDetailsScreen(),
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
        ),
      ),
    );
  }
}
