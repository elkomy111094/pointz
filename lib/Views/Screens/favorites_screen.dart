import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/empty_screen.dart';
import 'package:pointz/Views/Screens/products_provider_details_screen.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../core/services/favorite_services.dart';
import '../../helper/components.dart';
import '../../models/services_provider_response.dart';
import '../Widgets/cardItem.dart';
import '../Widgets/customt_text_button.dart';
import '../Widgets/simple_Header.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int pageKey = 1;
  int pageSize = 10;
  late bool isLastPage;
  ValueNotifier<bool> waitting = ValueNotifier(false);
  List<ServicesProvider> responseList = [];

  final PagingController<int, ServicesProvider> _pagingController =
      PagingController(firstPageKey: 1);

  final ScrollController _scrollController = ScrollController();

  Future<void> _fetchPage(pageKey, BuildContext context) async {
    RegisterationCubit inst = RegisterationCubit.get(context);
    int? userId = inst.userResponse!.result!.responseResult!.id!;
    print(
        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(userId);
    try {
      waitting.value = true;
      waitting.notifyListeners();
      responseList = await FavoritesServices()
          .getFavoriteServicesProviders(
              index: pageKey, userId: userId, pageSize: pageSize)
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
                  padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
                  child: NotificationListener(
                    onNotification: (note) {
                      if (note is ScrollEndNotification) {
                        setState(() {
                          if (isLastPage) {
                            if (_scrollController.position.atEdge) {
                              /* showToastMessage(
                                  text: "???? ???????? ?????????? ???????? ????????????");*/
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
                        PagedListView<int, ServicesProvider>(
                          shrinkWrap: false,
                          scrollController: _scrollController,
                          pagingController: _pagingController,
                          builderDelegate: PagedChildBuilderDelegate<
                                  ServicesProvider>(
                              itemBuilder: (context, item, index) {
                                return Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: CardItem(
                                    busineesID: item.id!,
                                    isFavorite: true,
                                    desc: checkRTL(context)
                                        ? item.detailsAr
                                        : item.detailsEn,
                                    coverImage:
                                        item.bannerUploadedFile?.base64Format,
                                    logoImage:
                                        item.logoUploadedFile?.base64Format,
                                    name: checkRTL(context)
                                        ? item.nameAr
                                        : item.nameEn,
                                    currentContext: context,
                                    tabNavigateToScreen:
                                        ProductsProviderDetailsScreen(
                                      store: item,
                                    ),
                                  ),
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
                                        "No Favorites items Founded".tr());
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
                                        "???????? ?????????? ??????????????",
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
                                        text: "???????? ?????? ????????")
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
                SimpleHeader(
                  headerTitle: "Favorites".tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
