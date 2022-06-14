import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointz/Views/Screens/product_screen.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

class ProductsProviderDetailsScreen extends StatefulWidget {
  @override
  _ProductsProviderDetailsScreenState createState() =>
      _ProductsProviderDetailsScreenState();
}

class _ProductsProviderDetailsScreenState
    extends State<ProductsProviderDetailsScreen> {
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

  int productsCategorySelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: 30.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/burger.jpg"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 5.h,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          width: 5.h,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.5),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "1000" + "\n",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontFamily: "Taga",
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5)),
                                TextSpan(
                                    text: "نقطه",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: "Taga",
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5)),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 30.h,
                        width: 95.w,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Products Provider details
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 3.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 6.h,
                                      width: 6.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/mac.jpg"),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(1.h),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: RichText(
                                                text: TextSpan(
                                                    text: "ماكدونالدز",
                                                    style: TextStyle(
                                                      color: kMainColor,
                                                      fontFamily: "Taga",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                    )),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: RichText(
                                                      text: TextSpan(
                                                          text: "4.4 KM",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black))),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Container(
                                                  height: 2.h,
                                                  width: 2.h,
                                                  child: Center(
                                                      child: SvgPicture.asset(
                                                    "assets/icons/distance.svg",
                                                    fit: BoxFit.fill,
                                                    height: 2.h,
                                                    width: 2.h,
                                                  )),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.orange
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.h)),
                                              child: Padding(
                                                padding: EdgeInsets.all(.3.h),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    RichText(
                                                        text: TextSpan(
                                                            text: "4.4",
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black))),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                      size: 15.sp,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 2.h,
                                              width: 2.h,
                                              child: Center(
                                                  child: SvgPicture.asset(
                                                "assets/icons/navbar_icons/home.svg",
                                                fit: BoxFit.fill,
                                                height: 3.h,
                                                width: 3.h,
                                              )),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: "مفتوح من ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 8.sp,
                                                      fontFamily: "Taga")),
                                              TextSpan(
                                                  text: "AM ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 8.sp,
                                                  )),
                                              TextSpan(
                                                  text: "8:00",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 8.sp,
                                                      fontFamily: "Taga")),
                                              TextSpan(
                                                  text: "  الي ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 8.sp,
                                                      fontFamily: "Taga")),
                                              TextSpan(
                                                  text: "PM ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 8.sp,
                                                  )),
                                              TextSpan(
                                                  text: "12.00 ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 8.sp,
                                                      fontFamily: "Taga")),
                                            ]))
                                          ],
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Container(
                                  height: 8.h,
                                  width: 90.w,
                                  child: RichText(
                                      overflow: TextOverflow.fade,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "عن المطعم \n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Taga",
                                                fontSize: 12.sp)),
                                        TextSpan(
                                            text:
                                                "ماك تعتبر من أكبر الشركات عالمياً في تصنيع المواد الغذائيه ماك تعتبر من أكبر الشركات عالمياً ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Taga",
                                                fontSize: 10.sp)),
                                      ])),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "للتواصل",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Taga",
                                                fontSize: 12.sp)),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            buildSocialMediaIconButton(
                                                color: Colors.green,
                                                icon: FontAwesomeIcons.whatsapp,
                                                onPressed: () {}),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            buildSocialMediaIconButton(
                                                onPressed: () {},
                                                color: Colors.purple,
                                                icon:
                                                    FontAwesomeIcons.instagram),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            buildSocialMediaIconButton(
                                                onPressed: () {},
                                                color: Colors.tealAccent,
                                                icon: FontAwesomeIcons.twitter),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            buildSocialMediaIconButton(
                                                onPressed: () {},
                                                color: Colors.orange,
                                                icon:
                                                    FontAwesomeIcons.snapchat),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Center(
                                child: Container(
                                  height: 5.h,
                                  width: 89.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.2))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              buildSocialMediaIconButton(
                                                  color: kMainColor,
                                                  icon: FontAwesomeIcons
                                                      .mapMarkerAlt),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text: "الخريطه",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "Taga",
                                                        fontSize: 10.sp)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 5.h,
                                          width: 1,
                                          color: Colors.grey.withOpacity(.2)),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              buildSocialMediaIconButton(
                                                  color: Colors.green,
                                                  icon: Icons
                                                      .phone_in_talk_outlined),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text: "اتصال",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "Taga",
                                                        fontSize: 10.sp)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Products Provider Description
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: AppBar(
                          bottom: TabBar(
                            isScrollable: false,
                            indicatorColor: kMainColor,
                            labelStyle: TextStyle(
                                fontFamily: "Taga",
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                            unselectedLabelColor: Colors.black,
                            labelColor: kMainColor,
                            unselectedLabelStyle:
                                TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
                            onTap: (val) {},
                            tabs: const [
                              Tab(
                                /*    icon: Image.asset(
                                  "assets/images/dues.png",
                                  height: 40,
                                  width: 40,
                                  */ /*color: duesTaped == true ? Colors.white : Colors.white70,*/ /*
                                ),*/
                                text: "قائمه الطعام",
                              ),
                              Tab(
                                /*icon: Image.asset(
                                  "assets/images/depts.png",
                                  height: 40,
                                  width: 40,
                                  */ /*color: debtsTaped == true ? Colors.white : Colors.white70,*/ /*
                                ),*/
                                text: "الفروع",
                              ),
                            ],
                          ),
                          backgroundColor: Colors.white,
                          toolbarHeight: 0,
                        ),
                        body: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  height: 4.h,
                                  color: Colors.white60,
                                  child: Center(
                                    child: ListView.separated(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                productsCategorySelectedIndex =
                                                    index;
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
                                                      BorderRadius.circular(
                                                          10.h)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.w,
                                                    vertical: .5.h),
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
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                "Taga")),
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
                                        itemCount:
                                            providerProductsCategoroies.length),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            pushToStack(
                                                context, ProductScreen());
                                          },
                                          child: Container(
                                            child: Card(
                                              elevation: 10,
                                              color: Colors.white,
                                              child: Padding(
                                                padding: EdgeInsets.all(1.h),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 10.h,
                                                      width: 10.h,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                          alignment:
                                                              Alignment.center,
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "assets/images/mac.jpg"),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1.h),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w),
                                                      child: Container(
                                                        height: 10.h,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            RichText(
                                                                text: TextSpan(
                                                                    text:
                                                                        "دوبل ماك رويال",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            "Taga",
                                                                        fontSize:
                                                                            12.sp))),
                                                            RichText(
                                                                text: TextSpan(
                                                                    text:
                                                                        "قطع دجاج تقدم مع بطاطس",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontFamily:
                                                                            "Taga",
                                                                        fontSize:
                                                                            10.sp))),
                                                            Row(
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  "assets/icons/clock.svg",
                                                                  width: 3.h,
                                                                  height: 3.h,
                                                                ),
                                                                RichText(
                                                                    text: TextSpan(
                                                                        text:
                                                                            " مده الاستلام : ",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .grey,
                                                                            fontFamily:
                                                                                "Taga",
                                                                            fontSize:
                                                                                10.sp))),
                                                                RichText(
                                                                    text: TextSpan(
                                                                        text:
                                                                            "10 دقائق",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                "Taga",
                                                                            fontSize:
                                                                                10.sp))),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: kMainColor
                                                              .withOpacity(.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.h)),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            .5.h),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            RichText(
                                                                text: TextSpan(
                                                                    text:
                                                                        "SR 5.5",
                                                                    style: TextStyle(
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color:
                                                                            kMainColor))),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                                      itemCount:
                                          providerProductsCategoroies.length),
                                )
                              ],
                            ),
                            Container(
                              color: Colors.white,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(1.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.h),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                accentColor: Colors.transparent,
                                                indicatorColor: kMainColor,
                                                backgroundColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                              collapsedBackgroundColor:
                                                  Colors.transparent,
                                              title: Text(
                                                "جده",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    fontSize: 12.sp,
                                                    fontFamily: "Taga",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              trailing: Icon(
                                                FontAwesomeIcons.eye,
                                                size: 12.sp,
                                              ),
                                              leading: SvgPicture.asset(
                                                "assets/icons/mylocation.svg",
                                                color: Colors.black,
                                                width: 3.h,
                                                height: 3.h,
                                              ),
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                        text:
                                                            " حي 7251 مدائن الفهد جده 22347 الديه 2483",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontFamily: "Taga",
                                                            fontSize: 10.sp)))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, _) => SizedBox(),
                                  itemCount: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocialMediaIconButton(
      {required Color color,
      required IconData icon,
      void Function()? onPressed}) {
    return Container(
      height: 4.h,
      width: 4.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 1),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: 12.sp,
          ),
        ),
      ),
    );
  }
}
