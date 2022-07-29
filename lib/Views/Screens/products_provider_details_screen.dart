import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/models/services_provider_response.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../views_models/home/home_cubit.dart';
import '../../views_models/registeration/registeration_cubit.dart';
import 'empty_screen.dart';

class ProductsProviderDetailsScreen extends StatefulWidget {
  ServicesProvider store;

  ProductsProviderDetailsScreen({required this.store});

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
  bool idInFavList = false;
  bool idInUnFavList = false;

  int productsCategorySelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    idInFavList = checkInFavList(widget.store.id!);
    idInUnFavList = checkInUnFavList(widget.store.id!);
    print(
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    print((widget.store.isFavoriteForCustomer!));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              widget.store.bannerUploadedFile?.base64Format.toString() != null
                  ? Container(
                      height: 30.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: MemoryImage(
                            convertBase64Url(
                                base64Url: widget
                                    .store.bannerUploadedFile!.base64Format
                                    .toString()),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 30.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kMainColor,
                          border: Border.all(color: kMainColor, width: 1)),
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
                        InkWell(
                          onTap: () async {
                            setState(() {
                              if (widget.store.isFavoriteForCustomer!) {
                                if (idInFavList) {
                                  addToUnFavList(widget.store.id!);
                                } else if (idInUnFavList) {
                                  addToFavList(widget.store.id!);
                                } else {
                                  addToUnFavList(widget.store.id!);
                                }
                              } else {
                                if (idInFavList) {
                                  addToUnFavList(widget.store.id!);
                                } else if (idInUnFavList) {
                                  addToFavList(widget.store.id!);
                                } else {
                                  addToFavList(widget.store.id!);
                                }
                              }
                            });

                            RegisterationCubit inst =
                                RegisterationCubit.get(context);
                            HomeCubit homeInst = HomeCubit.get(context);
                            print(
                                "*************************************************************************************************");
                            print(widget.store.id!.toString());
                            print(inst.userResponse!.result!.responseResult!.id!
                                .toString());
                            print(
                                "*************************************************************************************************");
                            await homeInst
                                .addToMyFavorites(
                                    businessID: widget.store.id!,
                                    customerID: inst.userResponse!.result!
                                        .responseResult!.id!)
                                .then((value) {
                              if (value == true) {
                                showToastMessage(text: "Added Successfuly");
                              } else {
                                showToastMessage(text: "Added Failed");
                              }
                            });
                          },
                          child: CircleAvatar(
                            radius: 2.5.h,
                            backgroundColor: Colors.white,
                            child: (widget.store.isFavoriteForCustomer! ||
                                        idInFavList) &&
                                    !(idInUnFavList)
                                ? Padding(
                                    padding: EdgeInsets.all(1.h),
                                    child: SvgPicture.asset(
                                        "assets/icons/favorites.svg"),
                                  )
                                : Center(
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.red,
                                    ),
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
                                    text: widget.store.pointsSystem?.percentage
                                            .toString() ??
                                        "0" + "\n",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontFamily: "Taga",
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5)),
                                TextSpan(
                                    text: " " + "نقطه",
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
                        width: 95.w,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Products Provider details
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 3.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    widget.store.logoUploadedFile?.base64Format
                                                .toString() !=
                                            null
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: kMainColor, width: 2),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(.5.h),
                                              child: Container(
                                                height: 6.h,
                                                width: 6.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    alignment: Alignment.center,
                                                    fit: BoxFit.fill,
                                                    image: MemoryImage(
                                                      convertBase64Url(
                                                          base64Url: widget
                                                              .store
                                                              .logoUploadedFile!
                                                              .base64Format
                                                              .toString()),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 6.h,
                                            width: 6.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(1.h),
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/icons/store.svg",
                                                fit: BoxFit.contain,
                                                width: 4.h,
                                                height: 4.h,
                                                color: Colors.white),
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
                                                    text: checkRTL(context)
                                                        ? widget.store.nameAr
                                                        : widget.store.nameEn,
                                                    style: TextStyle(
                                                      color: kMainColor,
                                                      fontFamily: "Taga",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                    )),
                                              ),
                                            ),
                                            /*  Row(
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
                                            ),*/
                                          ],
                                        ),
                                        /* SizedBox(
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
                                        ),*/
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1.h,
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
                                            text: "عن المطعم\n\n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Taga",
                                                fontSize: 12.sp)),
                                        TextSpan(
                                            text: checkRTL(context)
                                                ? widget.store.detailsAr
                                                : widget.store.detailsEn,
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
                                      child: Container(
                                        height: 6.h,
                                        child: widget.store.socialMediaAccounts!
                                                    .isEmpty ||
                                                widget.store
                                                        .socialMediaAccounts ==
                                                    null
                                            ? Center(
                                                child: Text(
                                                  "لايوجد أي وسائل للتواصل",
                                                  style: TextStyle(
                                                      color: kMainColor,
                                                      fontSize: 15.sp,
                                                      fontFamily: "Taga"),
                                                ),
                                              )
                                            : ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  switch (widget
                                                      .store
                                                      .socialMediaAccounts![
                                                          index]
                                                      .type!
                                                      .code) {
                                                    case "SMWTAP":
                                                      return buildSocialMediaIconButton(
                                                          color: Colors.green,
                                                          icon: FontAwesomeIcons
                                                              .whatsapp,
                                                          onPressed: () async {
                                                            /*  int phone = int.parse(
                                                   "201153942488")*/
                                                            String? phone = widget
                                                                .store
                                                                .socialMediaAccounts![
                                                                    index]
                                                                .accountName;

                                                            if (phone != null &&
                                                                phone != "") {
                                                              int phoneNum =
                                                                  int.parse(
                                                                      phone);
                                                              var whatsappUrl = (Platform
                                                                      .isIOS)
                                                                  ? "https://wa.me/send?phone=+$phoneNum}"
                                                                  : "whatsapp://send?phone=+$phoneNum";
                                                              await launchInBrowser(
                                                                  Uri.parse(
                                                                      whatsappUrl));
                                                            } else {
                                                              showToastMessage(
                                                                  text:
                                                                      "ليس لدي المتجر حساب واتس أب");
                                                            }
                                                          });
                                                    case "SMTWT":
                                                      return buildSocialMediaIconButton(
                                                          onPressed: () async {
                                                            /*  int phone = int.parse(
                                                   "201153942488")*/
                                                            String?
                                                                twitterProfile =
                                                                widget
                                                                    .store
                                                                    .socialMediaAccounts![
                                                                        index]
                                                                    .accountName;

                                                            if (twitterProfile !=
                                                                    null &&
                                                                twitterProfile !=
                                                                    "") {
                                                              var InstaUrl = (Platform
                                                                      .isIOS)
                                                                  ? "https://twitter.com/${twitterProfile}"
                                                                  : "https://twitter.com/${twitterProfile}";
                                                              await launchInBrowser(
                                                                  Uri.parse(
                                                                      InstaUrl));
                                                            } else {
                                                              showToastMessage(
                                                                  text:
                                                                      "ليس لدي المتجر حساب تويتر");
                                                            }
                                                          },
                                                          color:
                                                              Colors.tealAccent,
                                                          icon: FontAwesomeIcons
                                                              .twitter);

                                                    case "SMSNP":
                                                      return buildSocialMediaIconButton(
                                                          onPressed: () async {
                                                            /*  int phone = int.parse(
                                                   "201153942488")*/
                                                            String?
                                                                snapChatProfile =
                                                                widget
                                                                    .store
                                                                    .socialMediaAccounts![
                                                                        index]
                                                                    .accountName;

                                                            if (snapChatProfile !=
                                                                    null &&
                                                                snapChatProfile !=
                                                                    "") {
                                                              var whatsappUrl = (Platform
                                                                      .isIOS)
                                                                  ? "https://www.snapChat.com/add/${snapChatProfile}}"
                                                                  : "https://www.snapChat.com/add/${snapChatProfile}";
                                                              await launchInBrowser(
                                                                  Uri.parse(
                                                                      whatsappUrl));
                                                            } else {
                                                              showToastMessage(
                                                                  text:
                                                                      "ليس لدي المتجر حساب واتساب");
                                                            }
                                                          },
                                                          color: Colors.orange,
                                                          icon: FontAwesomeIcons
                                                              .snapchat);

                                                    case "SMINSTA":
                                                      return buildSocialMediaIconButton(
                                                          onPressed: () async {
                                                            /*  int phone = int.parse(
                                                   "201153942488")*/
                                                            String?
                                                                InstaProfile =
                                                                widget
                                                                    .store
                                                                    .socialMediaAccounts![
                                                                        index]
                                                                    .accountName;

                                                            if (InstaProfile !=
                                                                    null &&
                                                                InstaProfile !=
                                                                    "") {
                                                              var InstaUrl = (Platform
                                                                      .isIOS)
                                                                  ? "https://www.instagram.com/${InstaProfile}/"
                                                                  : "https://www.instagram.com/${InstaProfile}/";
                                                              await launchInBrowser(
                                                                  Uri.parse(
                                                                      InstaUrl));
                                                            } else {
                                                              showToastMessage(
                                                                  text:
                                                                      "ليس لدي المتجر حساب إنستجرام");
                                                            }
                                                          },
                                                          color: Colors.purple,
                                                          icon: FontAwesomeIcons
                                                              .instagram);

                                                    default:
                                                      return SizedBox();
                                                  }
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                    width: 3.w,
                                                  );
                                                },
                                                itemCount: widget
                                                    .store
                                                    .socialMediaAccounts!
                                                    .length),
                                      )

                                      /*Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          buildSocialMediaIconButton(
                                              color: Colors.green,
                                              icon: FontAwesomeIcons.whatsapp,
                                              onPressed: () async {
                                                */ /*  int phone = int.parse(
                                                          "201153942488")*/ /*
                                                int phone = int.parse(widget
                                                    .store.socialMediaAccounts!
                                                    .elementAt(2)
                                                    .accountName!);

                                                if (phone != null) {
                                                  var whatsappUrl = (Platform
                                                          .isIOS)
                                                      ? "https://wa.me/send?phone=+$phone}"
                                                      : "whatsapp://send?phone=+$phone";
                                                  await launchInBrowser(
                                                      Uri.parse(whatsappUrl));
                                                } else {
                                                  showToastMessage(
                                                      text:
                                                          "ليس لدي المتجر حساب واتس أب");
                                                }
                                              }),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          buildSocialMediaIconButton(
                                              onPressed: () {},
                                              color: Colors.purple,
                                              icon: FontAwesomeIcons.instagram),
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
                                              icon: FontAwesomeIcons.snapchat),
                                        ],
                                      )*/
                                      ,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Center(
                                child: Container(
                                  height: 6.h,
                                  width: 89.w,
                                  decoration: BoxDecoration(
                                      color: kMainColor,
                                      borderRadius: BorderRadius.circular(1.h),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.2))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /* Expanded(
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
                                          color: Colors.grey.withOpacity(.2)),*/
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            launch(
                                                "tel://${widget.store.contactNumber}");
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              buildSocialMediaIconButton(
                                                  color: Colors.white,
                                                  icon: Icons
                                                      .phone_in_talk_outlined),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text: "اتصال",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Taga",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.sp)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
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
                      length: 1 /*2*/,
                      child: Scaffold(
                        appBar: AppBar(
                          bottom: TabBar(
                            isScrollable: false,
                            indicatorColor: kMainColor,
                            labelStyle: TextStyle(
                                fontFamily: "Taga",
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                            unselectedLabelColor: Colors.black,
                            labelColor: kMainColor,
                            unselectedLabelStyle:
                                TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
                            onTap: (val) {},
                            tabs: const [
                              /*  Tab(
                                */ /*    icon: Image.asset(
                                  "assets/images/dues.png",
                                  height: 40,
                                  width: 40,
                                  */ /* */ /*color: duesTaped == true ? Colors.white : Colors.white70,*/ /* */ /*
                                ),*/ /*
                                text: "قائمه المتجر",
                              ),*/
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
                            /*Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/empty.svg",
                                    width: 20.h,
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    "لاتوجد أي منتجات",
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Taga",
                                        fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ),*/
                            /* Column(
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
                            ),*/
                            widget.store.addresses!.isEmpty
                                ? Center(
                                    child: EmptyScreen(
                                      svgImageUrl: "assets/icons/empty.svg",
                                      textUnderImage: "لاتوجد فروع لهذا المتجر",
                                    ),
                                  )
                                : Container(
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
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                          accentColor: Colors
                                                              .transparent,
                                                          indicatorColor:
                                                              kMainColor,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent),
                                                  child: ExpansionTile(
                                                    collapsedBackgroundColor:
                                                        Colors.transparent,
                                                    title: Text(
                                                      widget
                                                          .store
                                                          .addresses![index]
                                                          .nameAr!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
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
                                                              text: widget
                                                                      .store
                                                                      .addresses![
                                                                          index]
                                                                      .country!
                                                                      .nameAr! +
                                                                  " ، " +
                                                                  widget
                                                                      .store
                                                                      .addresses![
                                                                          index]
                                                                      .city!
                                                                      .nameAr!,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontFamily:
                                                                      "Taga",
                                                                  fontSize:
                                                                      10.sp)))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, _) =>
                                            SizedBox(),
                                        itemCount:
                                            widget.store.addresses!.length),
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
      height: 5.h,
      width: 5.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 1),
      ),
      child: InkWell(
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
