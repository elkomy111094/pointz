import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Screens/shipping_cart_screen.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../Widgets/cardItem.dart';
import '../Widgets/categoryItems.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  HomeScreen({this.navBarScreenContext});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: Padding(
                              padding: EdgeInsets.all(1.h),
                              child: SvgPicture.asset(
                                  "assets/icons/user_image.svg"),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "،،، اهلا بك ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Hacen",
                                      fontSize: 10.sp)),
                              TextSpan(
                                  text: " محمد احمد ",
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Hacen",
                                      fontSize: 15.sp)),
                            ])),
                          ),
                          GestureDetector(
                            onTap: () {
                              pushToStack(widget.navBarScreenContext,
                                  ShippingCartScreen());
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: SvgPicture.asset(
                                  "assets/icons/shopping-cart.svg",
                                  color: kMainColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child:
                                    SvgPicture.asset("assets/icons/gifts.svg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: SvgPicture.asset(
                                    "assets/icons/notification.svg"),
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
                          onSave: (val) {})

                      /*TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: 'ابحث عن متجرك المفضل ….',
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade300,
                              )),
                        )*/
                      ,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //header

                      SizedBox(
                        height: 1.h,
                      ),
                      //Todo : Image slider
                      Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Container(
                          height: 25.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: ImageSlideshow(
                            /// Width of the [ImageSlideshow].
                            width: double.infinity,

                            /// Height of the [ImageSlideshow].
                            height: 25.h,

                            /// The page to show when first creating the [ImageSlideshow].
                            initialPage: 0,

                            /// The color to paint the indicator.
                            indicatorColor: Colors.deepPurple,

                            /// The color to paint behind th indicator.
                            indicatorBackgroundColor: Colors.white,

                            /// The widgets to display in the [ImageSlideshow].
                            /// Add the sample image file into the images folder
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Container(
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.h),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/image.jpg')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Container(
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.h),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/image.jpg')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Container(
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.h),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/image.jpg')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Container(
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.h),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/image.jpg')),
                                  ),
                                ),
                              ),
                            ],

                            /// Called whenever the page in the center of the viewport changes.
                            onPageChanged: (value) {
                              print('Page changed: $value');
                            },

                            /// Auto scroll interval.
                            /// Do not auto scroll with null or 0.
                            autoPlayInterval: 3000,

                            /// Loops back to first slide.
                            isLoop: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        child: Row(
                          children: [
                            Text(
                              "كل الفئات",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hacen",
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
                                onTapItem: () {
                                  pushToStack(widget.navBarScreenContext,
                                      CategoryScreen());
                                },
                              );
                            },
                            separatorBuilder: (context, _) {
                              return SizedBox(
                                width: 3.5.w,
                              );
                            },
                            itemCount: 20),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 3.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "متاجر ملابس",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Hacen",
                                      fontSize: 10.sp),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  splashColor: kMainColor.withOpacity(.1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 2.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "اعرض الكل",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Hacen",
                                              fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/show_all.svg",
                                          width: 1.5.h,
                                          height: 1.5.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 35.h,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CardItem(
                                      currentContext:
                                          widget.navBarScreenContext!,
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
                                Text(
                                  "الكترونيات",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Hacen",
                                      fontSize: 10.sp),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  splashColor: kMainColor.withOpacity(.1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 2.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "اعرض الكل",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Hacen",
                                              fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/show_all.svg",
                                          width: 1.5.h,
                                          height: 1.5.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 35.h,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CardItem(
                                      currentContext:
                                          widget.navBarScreenContext!,
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
                                Text(
                                  "مقاهي",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Hacen",
                                      fontSize: 10.sp),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  splashColor: kMainColor.withOpacity(.1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 2.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "اعرض الكل",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Hacen",
                                              fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/show_all.svg",
                                          width: 1.5.h,
                                          height: 1.5.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 35.h,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CardItem(
                                      currentContext:
                                          widget.navBarScreenContext!,
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
                            vertical: 3.h, horizontal: 3.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "أدوات تجميل",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Hacen",
                                      fontSize: 10.sp),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  splashColor: kMainColor.withOpacity(.1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 2.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "اعرض الكل",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Hacen",
                                              fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/show_all.svg",
                                          width: 1.5.h,
                                          height: 1.5.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 35.h,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CardItem(
                                      currentContext:
                                          widget.navBarScreenContext!,
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
                      SizedBox(
                        height: 4.h,
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
