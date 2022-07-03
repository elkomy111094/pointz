import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Screens/allCategoryItems_screen.dart';
import 'package:pointz/Views/Screens/gifts_screen.dart';
import 'package:pointz/Views/Screens/notificationScreen.dart';
import 'package:pointz/Views/Screens/profile_screen.dart';
import 'package:pointz/Views/Screens/shipping_cart_screen.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/home/home_cubit.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeCubit homeCubitInst = HomeCubit.get(context);
    homeCubitInst.getAllActiveAdvertisements();
    homeCubitInst.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    RegisterationCubit inst = RegisterationCubit.get(context);
    HomeCubit homeCubitInst = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is CategoriesResponseOptainedSuccessfully) {
          homeCubitInst.fillInMap();
        }

        if (state is CategorySomeItemsOptained) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                buildHeader(inst),
                buildBody(homeCubitInst),
              ],
            ),
          ),
        );
      },
    );
  }

  //Todo : Screen Components

  Container buildHeader(RegisterationCubit inst) {
    return Container(
      height: 20.h,
      color: kMainColor.withOpacity(.05),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    pushToStack(widget.navBarScreenContext, ProfileScreen());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: SvgPicture.asset("assets/icons/user_image.svg"),
                    ),
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
                            fontFamily: "Taga",
                            fontSize: 10.sp)),
                    TextSpan(
                        text:
                            inst.userResponse?.result?.responseResult?.fullName,
                        style: TextStyle(
                            color: kMainColor,
                            fontFamily: "Taga",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp)),
                  ])),
                ),
                GestureDetector(
                  onTap: () {
                    pushToStack(
                        widget.navBarScreenContext, ShippingCartScreen());
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
                  onTap: () {
                    pushToStack(widget.navBarScreenContext, GiftsScreen());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: SvgPicture.asset("assets/icons/gifts.svg"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                GestureDetector(
                  onTap: () {
                    pushToStack(
                        widget.navBarScreenContext, NotificationScreen());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: SvgPicture.asset("assets/icons/notification.svg"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //search form
          Container(
            padding: EdgeInsets.symmetric(vertical: .5.h, horizontal: 2.w),
            child: SquareTextField(
                fillColor: Colors.white,
                hintText: "...ابحث عن متجرك المفضل",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                onChanged: (val) {},
                textStyle: TextStyle(
                  color: kMainColor,
                  fontFamily: "Taga",
                  letterSpacing: 0,
                  fontSize: 14.sp,
                ),
                preFixWidget: Padding(
                  padding: EdgeInsets.all(1.5.h),
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
    );
  }

  Padding buildBody(HomeCubit homeCubitInst) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, bottom: 5.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //header

            SizedBox(
              height: 1.h,
            ),
            //Todo : Image slider
            buildAdsSlider(homeCubitInst),
            Padding(
              padding:
                  EdgeInsets.only(left: 5.w, top: 3.h, right: 5.w, bottom: 2.h),
              child: Row(
                children: [
                  Text(
                    "كل الفئات",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Taga",
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            buildCategoriesVerticalList(homeCubitInst),
            Divider(),
            homeCubitInst.categoriesList == null
                ? loader()
                : buildCategoriesWithSomeItemsHorizontalList(homeCubitInst),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }

  Padding buildAdsSlider(HomeCubit homeCubitInst) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        height: 18.h,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: homeCubitInst.addsList == null
            ? loader()
            : ImageSlideshow(
                /// Width of the [ImageSlideshow].
                width: double.infinity,

                /// Height of the [ImageSlideshow].
                height: 18.h,

                /// The page to show when first creating the [ImageSlideshow].
                initialPage: 0,

                /// The color to paint the indicator.
                indicatorColor: kMainColor,

                /// The color to paint behind th indicator.
                indicatorBackgroundColor: Colors.white,

                /// The widgets to display in the [ImageSlideshow].
                /// Add the sample image file into the images folder
                children: homeCubitInst.addsList!.map((e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Container(
                      height: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h),
                        /* image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/image.jpg')),*/
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.h),
                        child: Image.memory(
                          convertBase64Url(
                              base64Url: e.uploadedFile!.base64Format!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }).toList(),

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
    );
  }

  Container buildCategoriesVerticalList(HomeCubit homeCubitInst) {
    return Container(
      height: 10.h,
      child: homeCubitInst.categoriesList == null
          ? loader()
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItems(
                  name: homeCubitInst.categoriesList![index].nameAr!,
                  navBarContext: widget.navBarScreenContext!,
                  onTapItem: () {
                    pushToStack(
                        widget.navBarScreenContext,
                        CategoryScreen(
                          code: homeCubitInst.categoriesList![index].code!
                              .toString(),
                        ));
                  },
                );
              },
              separatorBuilder: (context, _) {
                return SizedBox(
                  width: 5.w,
                );
              },
              itemCount: homeCubitInst.categoriesList!.length),
    );
  }

  Container buildCategoriesWithSomeItemsHorizontalList(
      HomeCubit homeCubitInst) {
    return Container(
      height: 52.h,
      child: homeCubitInst.categoriesList == null
          ? loader()
          : buildCategorySomeItemsHorizontalList(homeCubitInst),
    );
  }

  ListView buildCategorySomeItemsHorizontalList(HomeCubit homeCubitInst) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      homeCubitInst.categoriesList![index].nameAr!,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: "Taga",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        pushToStack(
                            widget.navBarScreenContext,
                            AllCategoryItems(
                              code: homeCubitInst.categoriesList?[index].code,
                              type: homeCubitInst.categoriesList?[index].nameAr,
                            ));
                      },
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
                                  fontFamily: "Taga",
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
                  height: 30.h,
                  child: homeCubitInst.CategorieSomeServicesProviders.isEmpty ||
                          homeCubitInst.CategorieSomeServicesProviders.length <
                              homeCubitInst.categoriesList!.length
                      ? loader()
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, innerIndex) {
                            return CardItem(
                              currentContext: widget.navBarScreenContext!,
                              name: homeCubitInst
                                  .CategorieSomeServicesProviders[homeCubitInst
                                      .categoriesList?[index].code]?[innerIndex]
                                  .nameAr,
                              desc: homeCubitInst
                                  .CategorieSomeServicesProviders[homeCubitInst
                                      .categoriesList?[index].code]?[innerIndex]
                                  .detailsAr,
                              image: homeCubitInst
                                  .CategorieSomeServicesProviders[homeCubitInst
                                      .categoriesList?[index].code]?[innerIndex]
                                  .bannerUploadedFile
                                  ?.base64Format
                                  .toString(),
                            );
                          },
                          separatorBuilder: (context, _) {
                            return SizedBox(
                              width: 3.5.w,
                            );
                          },
                          itemCount: (homeCubitInst
                                      .CategorieSomeServicesProviders[
                                  homeCubitInst.categoriesList![index].code])!
                              .length,
                        ),
                ), // )
              ],
            ),
          );
        },
        separatorBuilder: (context, _) {
          return SizedBox(
            width: 2.h,
          );
        },
        itemCount: homeCubitInst.categoriesList!.length);
  }
}
