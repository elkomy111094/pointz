/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../Widgets/simple_Header.dart';

class MyPointsScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  MyPointsScreen({this.navBarScreenContext});

  @override
  _MyPointsScreenState createState() => _MyPointsScreenState();
}

class _MyPointsScreenState extends State<MyPointsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SimpleHeader(
            headerTitle: 'نقاطي',
            showPopIconButton: false,
          ),
          Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 2.h),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          width: 90.w,
                          height: 15.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 15.h,
                                  width: 90.w,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.h)),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/icons/pointswithshadow.svg",
                                                  width: 5.h,
                                                  color: Colors.black,
                                                  height: 5.h,
                                                ),
                                                RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "100",
                                                      style: TextStyle(
                                                          color: kMainColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: "Taga")),
                                                ])),
                                                RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "نقطه",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.sp,
                                                          fontFamily: "Taga")),
                                                ])),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Container(
                                                height: 5.h,
                                                width: 5.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kMainColor,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(2),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: kBackGroundColor,
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: AssetImage(
                                                                "assets/images/mac.jpg"))),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Text(
                                                "ماكدونلدز",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: "Taga",
                                                  color: kMainColor,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 2.h,
                        );
                      },
                      itemCount: 10),
                ),
              )),
        ],
      ),
    );
  }
}
*/

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/empty_screen.dart';
import 'package:pointz/Views/Widgets/gift_item_Card.dart';
import 'package:pointz/core/services/gifts_Services.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../../models/customer_all_gifts_response.dart';
import '../Widgets/customt_text_button.dart';

class CustomerAvailableGifts extends StatefulWidget {
  BuildContext? navBarScreenContext;
  CustomerAvailableGifts({this.navBarScreenContext});

  @override
  State<CustomerAvailableGifts> createState() => _CustomerAvailableGiftsState();
}

class _CustomerAvailableGiftsState extends State<CustomerAvailableGifts> {
  int pageKey = 1;
  int pageSize = 10;
  late bool isLastPage;
  ValueNotifier<bool> waitting = ValueNotifier(false);
  List<ApiGiftModel> responseList = [];

  final PagingController<int, ApiGiftModel> _pagingController =
      PagingController(firstPageKey: 1);

  final ScrollController _scrollController = ScrollController();

  Future<void> _fetchPage(pageKey, BuildContext context) async {
    RegisterationCubit inst = RegisterationCubit.get(context);
    String customerPhone =
        inst.userResponse!.result!.responseResult!.phoneNumber!;
    print(
        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(customerPhone);
    try {
      waitting.value = true;
      waitting.notifyListeners();
      responseList = await GiftsServices()
          .getAllCustomerAvailableGifts(
              index: pageKey,
              customerPhoneNumer: customerPhone,
              pageSize: pageSize)
          .then((value) {
        waitting.value = false;
        waitting.notifyListeners();
        log("8888888888888888888888888888888888888888888888888888888888888888888888888888");
        if (kDebugMode) {
          print(responseList.length);
        }
        return value;
      });
      log("8888888888888888888888888888888888888888888888888888888888888888888888888888");
      if (kDebugMode) {
        print(responseList.length);
      }
      isLastPage = responseList.length < pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(responseList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendLastPage(responseList);
      }
    } catch (e) {
      if (kDebugMode) {
        print("error --> $e");
      }
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    /*  _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });*/
    _fetchPage(pageKey, context);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: getDirection(context),
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: NotificationListener(
                    onNotification: (note) {
                      if (note is ScrollEndNotification) {
                        setState(() {
                          if (isLastPage) {
                            if (_scrollController.position.atEdge) {
                              /* showToastMessage(
                                  text: "لا يوجد عناصر أخري لعرضها");*/
                            }
                          } else {
                            ++pageKey;
                            _fetchPage(pageKey, context);
                          }
                        });
                      }
                      return false;
                    },
                    child: Stack(
                      children: [
                        PagedListView<int, ApiGiftModel>(
                          shrinkWrap: false,
                          scrollController: _scrollController,
                          pagingController: _pagingController,
                          builderDelegate: PagedChildBuilderDelegate<
                                  ApiGiftModel>(
                              itemBuilder: (context, item, index) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GiftItemCard(
                                      gift: item,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                );
                              },

                              /*animateTransitions: true,*/
                              newPageProgressIndicatorBuilder: null,
                              firstPageProgressIndicatorBuilder: (context) {
                                return const SizedBox();
                              },
                              noItemsFoundIndicatorBuilder: (context) {
                                return EmptyScreen(
                                    svgImageUrl: "assets/icons/empty.svg",
                                    textUnderImage:
                                        "قائمه هداياك فارغه حاليا".tr());
                              },
                              firstPageErrorIndicatorBuilder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Center(
                                      child: Text(
                                        "تعذر تحميل العناصر",
                                        style: TextStyle(
                                          color: kMainColor,
                                          fontFamily: "Taga",
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    CustomTextButton(
                                        buttonColor: kMainColor,
                                        buttonHorizontalPaddingval: 25.w,
                                        buttonVerticalPaddingVal: 2.h,
                                        textColor: Colors.white,
                                        textSize: 12.sp,
                                        onPressed: () async {
                                          await _fetchPage(pageKey, context);
                                        },
                                        text: "حاول مره أخري")
                                  ],
                                );
                              }),
                        ),
                        ValueListenableBuilder(
                            valueListenable: waitting,
                            builder: (context, val, child) =>
                                val == true ? loader() : const SizedBox()),
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
  }
}
