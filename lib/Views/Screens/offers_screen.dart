import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/bottom_navbar_screen.dart';
import 'package:pointz/views_models/home/home_cubit.dart';
import 'package:pointz/views_models/offers/offers_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/categoryItems.dart';
import '../Widgets/simple_Header.dart';
import 'all_category_offers.dart';

class OffersScreen extends StatefulWidget {
  final BuildContext navBarScreenContext;

  OffersScreen({required this.navBarScreenContext});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OffersCubit, OffersState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (widget.navBarScreenContext == null) {
          print("Hi its Null");
        } else {
          print("Hi its Not Null");
        }

        OffersCubit offersCubitInst = OffersCubit.get(context);
        HomeCubit homeCubitInst = HomeCubit.get(context);
        if (offersCubitInst.categorySelectedCode == "") {
          offersCubitInst.setCategorySelectedId(
              0, homeCubitInst.categoriesList![0].code!);
        }
        String currentCategoryCode = offersCubitInst.categorySelectedCode;
        print(offersCubitInst.categorySelectedCode);
        return SafeArea(
          child: Stack(
            children: [
              SimpleHeader(
                headerTitle: "العروض",
                showPopIconButton: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.w),
                        child: buildCategoriesVerticalList(
                            homeCubitInst, offersCubitInst),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Divider(
                          height: 1.h,
                          thickness: 2,
                          color: kBackGroundColor,
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
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 59.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                border: Border.all(color: kMainColor, width: 2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: AllCategoryOffers(
                                    code: currentCategoryCode,
                                    currentContext: widget.navBarScreenContext),
                              ),

                              /*ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return OfferItemWidget(
                                  currentContext: context,
                                  tabNavigateToScreen: ProductScreen(),
                                );
                              },
                              separatorBuilder: (context, _) {
                                return SizedBox(
                                  height: 3.5.w,
                                );
                              },
                              itemCount: 5)*/
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
        );
      },
    );
  }

  //.
  buildCategoriesVerticalList(
      HomeCubit homeCubitInst, OffersCubit offersCubitInst) {
    return Container(
      height: 9.h,
      child: homeCubitInst.categoriesList == null
          ? loader()
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItems(
                  color: offersCubitInst.categorySelectedId == index
                      ? kMainColor
                      : kBackGroundColor,
                  name: translator.isDirectionRTL(context)
                      ? homeCubitInst.categoriesList![index].nameAr
                      : homeCubitInst.categoriesList?[index].nameEn,
                  onTapItem: () {
                    offersCubitInst.setCategorySelectedId(
                        index, homeCubitInst.categoriesList![index].code!);

                    Navigator.of(widget.navBarScreenContext).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return NavBarScreen(defaultScreenId: 3);
                    }), (route) => false);
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
}
