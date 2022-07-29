import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/allCategoryItems_screen.dart';
import 'package:pointz/Views/Screens/gifts_screen.dart';
import 'package:pointz/Views/Screens/notificationScreen.dart';
import 'package:pointz/Views/Screens/products_provider_details_screen.dart';
import 'package:pointz/Views/Screens/profile_screen.dart';
import 'package:pointz/Views/Screens/search_result_screen.dart';
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
    if (homeCubitInst.adsList == null) {
      homeCubitInst.getAllActiveAdvertisements();
    }
    if (homeCubitInst.categoriesList == null) {
      homeCubitInst.getAllCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    RegisterationCubit inst = RegisterationCubit.get(context);
    HomeCubit homeCubitInst = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is CategoriesResponseOptainedSuccessfully) {
          RegisterationCubit inst = RegisterationCubit.get(context);

          homeCubitInst.fillInMap(
              customerID: inst.userResponse!.result!.responseResult!.id!);
        }
        if (state is CategorySomeItemsOptained) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Directionality(
            textDirection: getDirection(context),
            child: Stack(
              children: [
                //TODO:----------------------- Screen Header--------------------
                buildHeader(inst),
                //TODO:------------------------ Screen Body --------------------
                buildBody(homeCubitInst),
              ],
            ),
          ),
        );
      },
    );
  }
  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //.

  //TODO:--------------------------------- Header ------------------------------
  Container buildHeader(RegisterationCubit inst) {
    return Container(
      height: 18.h,
      color: kMainColor.withOpacity(.05),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    pushToStack(widget.navBarScreenContext, ProfileScreen());
                  },
                  child: CircleAvatar(
                    radius: 13.sp,
                    backgroundColor: Colors.deepPurple,
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: SvgPicture.asset(
                        "assets/icons/user_image.svg",
                        width: 5.h,
                        height: 5.h,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: ",,, Hey, you".tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Taga",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp)),
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
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(.5))),
                  child: GestureDetector(
                    onTap: () {
                      pushToStack(
                          widget.navBarScreenContext, ShippingCartScreen());
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: SvgPicture.asset(
                          "assets/icons/shopping-cart.svg",
                          width: 5.h,
                          height: 5.h,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(.5))),
                  child: GestureDetector(
                    onTap: () {
                      pushToStack(
                          widget.navBarScreenContext, const GiftsScreen());
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: SvgPicture.asset(
                          "assets/icons/gifts.svg",
                          width: 5.h,
                          height: 5.h,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(.5))),
                  child: GestureDetector(
                    onTap: () {
                      pushToStack(widget.navBarScreenContext,
                          const NotificationScreen());
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: SvgPicture.asset(
                          "assets/icons/notification.svg",
                          width: 5.h,
                          height: 5.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //search form
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SquareTextField(
              fillColor: Colors.white,
              hintText: "Find your favorite store".tr(),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
              textStyle: TextStyle(
                color: kMainColor,
                fontFamily: "Taga",
                letterSpacing: 0,
                fontSize: 14.sp,
              ),
              preFixWidget: MaterialButton(
                splashColor: kMainColor,
                onPressed: () {
                  if (inst.searchController.text.isNotEmpty) {
                    pushToStack(
                        widget.navBarScreenContext,
                        SearchResultScreen(
                            searchValue:
                                inst.searchController.text.toString()));
                    inst.searchController.clear();
                  }
                },
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  width: 3.h,
                  height: 3.h,
                ),
              ),
              controller: inst.searchController,
              keyBoardType: TextInputType.text,
              onSubmit: (val) {
                print(
                    "********************************************************************************");
                print(val);
                if (inst.searchController.text.isNotEmpty) {
                  print(inst.searchController.text);

                  pushToStack(
                      widget.navBarScreenContext,
                      SearchResultScreen(
                          searchValue: inst.searchController.text));

                  inst.searchController.clear();
                }
                return;
              },
            ),
          ),
        ],
      ),
    );
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-------------------------- Body ---------------------------------------
  Padding buildBody(HomeCubit homeCubitInst) {
    return Padding(
      padding: EdgeInsets.only(
        top: 18.h,
      ),
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
                  EdgeInsets.only(left: 5.w, top: 2.h, right: 5.w, bottom: 2.h),
              child: Row(
                children: [
                  Text(
                    "All Categories".tr(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Taga",
                        fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            buildCategoriesVerticalList(homeCubitInst),
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              height: 0,
            ),
            homeCubitInst.categoriesList == null
                ? loader()
                : buildCategoriesWithSomeItemsHorizontalList(homeCubitInst),
            SizedBox(
              height: 9.h,
            ),
          ],
        ),
      ),
    );
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //Todo:------------------------------- Ads Slider ---------------------------
  Padding buildAdsSlider(HomeCubit homeCubitInst) {
    return Padding(
      padding: EdgeInsets.all(.5.h),
      child: Container(
        height: 18.h,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: homeCubitInst.adsList == null
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
                children: homeCubitInst.adsList!.map((e) {
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
                  if (kDebugMode) {
                    print('Page changed: $value');
                  }
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

  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-------------------------- Categories horizontal List -----------------
  Container buildCategoriesVerticalList(HomeCubit homeCubitInst) {
    return Container(
      height: 9.h,
      child: homeCubitInst.categoriesList == null
          ? loader()
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItems(
                  color: kBackGroundColor,
                  name: translator.isDirectionRTL(context)
                      ? homeCubitInst.categoriesList![index].nameAr
                      : homeCubitInst.categoriesList?[index].nameEn,
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

  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:------ Category With Some Items(Horizontal list) Vertical List --------
  Container buildCategoriesWithSomeItemsHorizontalList(
      HomeCubit homeCubitInst) {
    return Container(
      height: 52.h,
      child: homeCubitInst.categoriesList == null
          ? loader()
          : buildCategorySomeItemsHorizontalList(homeCubitInst),
    );
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:------------ Items Of Certain Category horizontal List ----------------
  ListView buildCategorySomeItemsHorizontalList(HomeCubit homeCubitInst) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            child: Column(
              children: [
                Container(
                  color: kBackGroundColor.withOpacity(.5),
                  child: Row(
                    children: [
                      Text(
                        translator.isDirectionRTL(context)
                            ? homeCubitInst.categoriesList![index].nameAr ??
                                "NoName".tr()
                            : homeCubitInst.categoriesList![index].nameEn ??
                                "NoName".tr(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: kMainColor,
                          fontFamily: "Taga",
                          fontSize: 15.sp,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          pushToStack(
                            widget.navBarScreenContext,
                            AllCategoryItems(
                              code: homeCubitInst.categoriesList?[index].code,
                              type: checkRTL(context)
                                  ? (homeCubitInst
                                      .categoriesList?[index].nameAr)
                                  : (homeCubitInst
                                      .categoriesList?[index].nameEn),
                            ),
                          );
                        },
                        splashColor: kMainColor.withOpacity(.5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Show All".tr(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              translator.isDirectionRTL(context)
                                  ? SvgPicture.asset(
                                      "assets/icons/show_all.svg",
                                      width: 1.5.h,
                                      height: 1.5.h,
                                    )
                                  : Transform.rotate(
                                      angle: 180 * pi / 180,
                                      child: SvgPicture.asset(
                                        "assets/icons/show_all.svg",
                                        width: 1.5.h,
                                        height: 1.5.h,
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 29.h,
                  width: double.infinity,
                  child: homeCubitInst.catTopsList == null
                      ? loader()
                      : homeCubitInst.catTopsList![index]
                                      .ServicesProviderList !=
                                  null ||
                              homeCubitInst.catTopsList![index]
                                  .ServicesProviderList!.isEmpty
                          ? ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, innerIndex) {
                                return CardItem(
                                  tabNavigateToScreen:
                                      ProductsProviderDetailsScreen(
                                    store: homeCubitInst.catTopsList![index]
                                        .ServicesProviderList![innerIndex],
                                  ),
                                  isFavorite: homeCubitInst
                                      .catTopsList![index]
                                      .ServicesProviderList![innerIndex]
                                      .isFavoriteForCustomer!,
                                  busineesID: homeCubitInst.catTopsList![index]
                                      .ServicesProviderList![innerIndex].id!,
                                  currentContext: widget.navBarScreenContext!,
                                  name: checkRTL(context)
                                      ? (homeCubitInst
                                          .catTopsList![index]
                                          .ServicesProviderList![innerIndex]
                                          .nameAr!)
                                      : homeCubitInst
                                          .catTopsList![index]
                                          .ServicesProviderList![innerIndex]
                                          .nameEn,
                                  desc: checkRTL(context)
                                      ? (homeCubitInst
                                          .catTopsList![index]
                                          .ServicesProviderList![innerIndex]
                                          .detailsAr)
                                      : (homeCubitInst
                                          .catTopsList![index]
                                          .ServicesProviderList![innerIndex]
                                          .detailsEn),
                                  coverImage: homeCubitInst
                                      .catTopsList![index]
                                      .ServicesProviderList![innerIndex]
                                      .bannerUploadedFile
                                      ?.base64Format
                                      .toString(),
                                  logoImage: homeCubitInst
                                      .catTopsList![index]
                                      .ServicesProviderList![innerIndex]
                                      .logoUploadedFile
                                      ?.base64Format
                                      .toString(),
                                );
                              },
                              separatorBuilder: (context, _) {
                                return SizedBox(
                                  width: 1.w,
                                );
                              },
                              itemCount: homeCubitInst.catTopsList![index]
                                  .ServicesProviderList!.length,
                            )
                          : Center(
                              child: Text(
                                "No Stores In This Category".tr(),
                                style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 15.sp,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
