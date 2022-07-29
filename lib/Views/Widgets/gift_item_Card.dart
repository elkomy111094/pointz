import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/models/customer_all_gifts_response.dart';
import 'package:sizer/sizer.dart';

class GiftItemCard extends StatelessWidget {
  ApiGiftModel? gift;

  GiftItemCard({this.gift});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      child: Card(
        elevation: 5,
        color: kBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 35.h,
                  height: 18.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(2.h),
                        topLeft: Radius.circular(2.h)),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/giftsCardbg.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: " SR " +
                                  (gift == null
                                      ? "0"
                                      : (gift!.availableAmount).toString()) +
                                  "\n\n",
                              style: TextStyle(
                                  color: kMainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp)),
                          TextSpan(
                              text: (gift == null
                                  ? "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                                  : (gift!.message).toString()),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp)),
                        ])),
                    SizedBox(
                      height: 1.5.h,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          (gift == null
                              ? "xxxxxxxxxxxx"
                              : (gift!.sender!.fullName).toString()),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Taga",
                              fontSize: 10.sp)),
                      Text(
                          (gift == null
                              ? "+9665xxxxxxxx"
                              : (gift!.sender!.phoneNumber).toString()),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Taga",
                              fontSize: 10.sp))
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kMainColor, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor:
                                    gift == null ? kMainColor : Colors.white,
                                child: gift == null
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
                                                topRight:
                                                    Radius.circular(15.0)),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(2.h),
                                            child: Image.memory(
                                              convertBase64Url(
                                                  base64Url: gift!
                                                      .business!
                                                      .logoUploadedFile!
                                                      .base64Format!),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Text(
                              (gift == null
                                  ? "xxxxxxxxxxxx"
                                  : (checkRTL(context)
                                          ? gift!.business!.nameAr
                                          : gift!.business!.nameEn)
                                      .toString()),
                              style: TextStyle(
                                  color: kMainColor,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp))
                        ],
                      ),
                      Text(
                          (gift == null
                              ? "+9665xxxxxxxx"
                              : (gift!.lastUpdatedDate).toString()),
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Taga",
                              fontSize: 10.sp))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
