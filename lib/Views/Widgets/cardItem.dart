import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/product_screen.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/home/home_cubit.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

class CardItem extends StatefulWidget {
  BuildContext currentContext;

  Widget? tabNavigateToScreen;

  bool isFavorite;

  String? name;

  String? desc;

  int busineesID;

  String? coverImage;

  String? logoImage;

  CardItem(
      {required this.currentContext,
      this.name = "ماكدونالدز",
      required this.busineesID,
      this.logoImage,
      this.coverImage,
      this.tabNavigateToScreen,
      this.desc = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      this.isFavorite = false});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  void Function()? onTapFavoriteButton;
  bool idInFavList = false;
  bool idInUnFavList = false;

  @override
  void initState() {
    idInFavList = checkInFavList(widget.busineesID);
    idInUnFavList = checkInUnFavList(widget.busineesID);
  }

  @override
  Widget build(BuildContext context) {
    idInFavList = checkInFavList(widget.busineesID);
    idInUnFavList = checkInUnFavList(widget.busineesID);
    return Container(
      width: 80.w,
      child: InkWell(
        onTap: () {
          pushToStack(widget.currentContext,
              widget.tabNavigateToScreen ?? ProductScreen());
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.5.h),
            /*side: BorderSide(color: Colors.black.withOpacity(.3), width: 1),*/
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //TODO:-----------Cover Image & Favorite Button-----------
                  Stack(
                    children: [
                      widget.coverImage == null
                          ? Container(
                              height: 17.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(1.5.h),
                                  border:
                                      Border.all(color: kMainColor, width: 1)),
                              child: Center(
                                child: Text(
                                  "No Cover Image".tr(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Taga",
                                      fontSize: 15.sp),
                                ),
                              ),
                            )
                          : Container(
                              height: 17.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: kBackGroundColor, width: 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1.5.h),
                                    bottomLeft: Radius.circular(1.5.h),
                                    bottomRight: Radius.circular(1.5.h),
                                    topRight: Radius.circular(1.5.h)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.h),
                                child: Image.memory(
                                  convertBase64Url(
                                      base64Url: widget.coverImage!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                RegisterationCubit inst =
                                    RegisterationCubit.get(context);
                                HomeCubit homeInst = HomeCubit.get(context);
                                print(inst
                                    .userResponse!.result!.responseResult!.id!);
                                print(widget.busineesID);
                                setState(() {
                                  if (widget.isFavorite) {
                                    if (idInFavList) {
                                      addToUnFavList(widget.busineesID);
                                    } else if (idInUnFavList) {
                                      addToFavList(widget.busineesID);
                                    } else {
                                      addToUnFavList(widget.busineesID);
                                    }
                                  } else {
                                    if (idInFavList) {
                                      addToUnFavList(widget.busineesID);
                                    } else if (idInUnFavList) {
                                      addToFavList(widget.busineesID);
                                    } else {
                                      addToFavList(widget.busineesID);
                                    }
                                  }
                                });

                                await homeInst
                                    .addToMyFavorites(
                                        businessID: widget.busineesID,
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
                                backgroundColor: kBackGroundColor,
                                child: ((widget.isFavorite || idInFavList) &&
                                        !(idInUnFavList))
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
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kBackGroundColor,
                                  borderRadius: BorderRadius.circular(1.h)),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4.7",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: Colors.orangeAccent),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 2.h,
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //TODO:-------------Loogo Image &  Distance---------------
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kMainColor, width: 1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: CircleAvatar(
                              backgroundColor: widget.logoImage == null
                                  ? kMainColor
                                  : Colors.white,
                              child: widget.logoImage == null
                                  ? Padding(
                                      padding: EdgeInsets.all(1.h),
                                      child: SvgPicture.asset(
                                          "assets/icons/store.svg",
                                          fit: BoxFit.contain,
                                          width: 4.h,
                                          height: 4.h,
                                          color: Colors.white),
                                    )
                                  : Center(
                                      child: Container(
                                        height: 4.5.h,
                                        width: 4.5.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                          child: Image.memory(
                                            convertBase64Url(
                                                base64Url: widget.logoImage!),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Text(
                            widget.name!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Taga",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/distance.svg",
                              width: 2.h,
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "4.4KM",
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //TODO:----------------- Store Details -------------------
                  Padding(
                    padding: EdgeInsets.only(right: 5.w, left: 5.w),
                    child: Text(
                      widget.desc!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Taga",
                          color: Colors.grey.shade500),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    )

        /*BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ;
      },
    )*/
        ;
  }
}
