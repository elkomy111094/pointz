import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pointz/Views/Screens/products_provider_details_screen.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../core/services/home_services.dart';
import '../../helper/components.dart';
import '../../models/services_provider_response.dart';
import '../Widgets/cardItem.dart';
import '../Widgets/customt_text_button.dart';
import '../Widgets/simple_Header.dart';

class SearchResultScreen extends StatefulWidget {
  String searchValue;
  String? catName;

  SearchResultScreen({required this.searchValue, this.catName});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
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
    try {
      waitting.value = true;
      waitting.notifyListeners();

      if (widget.catName == null) {
        responseList = await HomeServices()
            .getSearchResultInAll(
                index: pageKey,
                userId: userId,
                pageSize: pageSize,
                searchValue: widget.searchValue)
            .then((value) {
          waitting.value = false;
          waitting.notifyListeners();
          log("8888888888888888888888888888888888888888888888888888888888888888888888888888");
          if (kDebugMode) {
            print(responseList.length);
          }
          return value;
        });
      } else {
        responseList = await HomeServices()
            .getSearchResultInCategory(
                categoryCode: widget.catName!,
                index: pageKey,
                userId: userId,
                pageSize: pageSize,
                searchValue: widget.searchValue)
            .then((value) {
          waitting.value = false;
          waitting.notifyListeners();
          log("8888888888888888888888888888888888888888888888888888888888888888888888888888");
          if (kDebugMode) {
            print(responseList.length);
          }
          return value;
        });
      }
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
        textDirection: TextDirection.rtl,
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
                              showToastMessage(
                                  text: "لا يوجد عناصر أخري لعرضها");
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
                                    isFavorite: item.isFavoriteForCustomer!,
                                    desc: item.detailsAr,
                                    coverImage:
                                        item.bannerUploadedFile?.base64Format,
                                    logoImage:
                                        item.logoUploadedFile?.base64Format,
                                    name: item.nameAr,
                                    currentContext: context,
                                    tabNavigateToScreen:
                                        ProductsProviderDetailsScreen(
                                            store: item),
                                  ),
                                );
                              },

                              /*animateTransitions: true,*/
                              newPageProgressIndicatorBuilder: null,
                              firstPageProgressIndicatorBuilder: (context) {
                                return const SizedBox();
                              },
                              noItemsFoundIndicatorBuilder: (context) {
                                return Center(
                                  child: Text(
                                    "لا يوجد عناصر لعرضها",
                                    style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Taga",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
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
                SimpleHeader(
                  headerTitle: widget.searchValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
