import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/simple_Header.dart';
import '../Widgets/wallet_item_Card.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 3.h,
                          ),
                          Center(
                            child: Container(
                              width: 90.w,
                              height: 25.h,
                              child: Card(
                                color: kMainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.h),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الرصيد المتوفر",
                                      style: TextStyle(
                                          color: kBackGroundColor,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp),
                                    ),
                                    Divider(
                                      height: 5.h,
                                      color: kBackGroundColor,
                                    ),
                                    Card(
                                      color: kMainColor,
                                      elevation: 10,
                                      child: Padding(
                                        padding: EdgeInsets.all(1.5.h),
                                        child: Text(
                                          "SR 700",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kBackGroundColor,
                                              fontSize: 25.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(height: 5.h),
                          Text(
                            "التعاملات الاخيره",
                            style: TextStyle(
                                fontFamily: "Taga",
                                fontSize: 12.sp,
                                color: kMainColor),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Center(
                            child: Container(
                              width: 90.w,
                              height: 50.h,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return WalletItemCard();
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 2.h,
                                  );
                                },
                                itemCount: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SimpleHeader(
                  headerTitle: 'المحفظه',
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
