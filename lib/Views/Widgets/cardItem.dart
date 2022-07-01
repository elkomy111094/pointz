import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pointz/Views/Screens/product_screen.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

class CardItem extends StatelessWidget {
  BuildContext currentContext;

  Widget? tabNavigateToScreen;

  bool isFavorite;

  String? name;

  String? desc;

  String? image;

  CardItem(
      {required this.currentContext,
      this.name = "ماكدونالدز",
      this.image,
      this.tabNavigateToScreen,
      this.desc = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      child: InkWell(
        onTap: () {
          pushToStack(currentContext, tabNavigateToScreen ?? ProductScreen());
        },
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Stack(
                children: [
                  image == null
                      ? Container(
                          height: 17.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/image.jpg"))),
                        )
                      : Container(
                          height: 17.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.h),
                            child: Image.memory(
                              convertBase64Url(base64Url: image!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 2.5.h,
                            backgroundColor: Colors.white,
                            child: isFavorite
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(1.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/image.jpg"),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      name!,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Taga",
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
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
              Padding(
                padding: EdgeInsets.only(top: 2.w, right: 5.w, left: 5.w),
                child: Text(
                  desc!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: "Taga",
                      color: Colors.grey.shade500),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
