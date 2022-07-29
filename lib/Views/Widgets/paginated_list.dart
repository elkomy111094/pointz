import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/core/services/home_services.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/home/home_cubit.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../models/services_provider_response.dart';
import '../Screens/products_provider_details_screen.dart';
import 'cardItem.dart';

class InfiniteScroll extends StatefulWidget {
  String code;

  BuildContext? currentContext;
  InfiniteScroll({required this.code, currentContext});

  @override
  _InfiniteScrollState createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  int pageKey = 1;
  int pageSize = 10;
  late bool isLastPage;
  ValueNotifier<bool> wait = ValueNotifier(false);
  List<ServicesProvider> responseList = [];

  final PagingController<int, ServicesProvider> _pagingController =
      PagingController(firstPageKey: 1);

  ScrollController _scrollController = ScrollController();

  Future<void> _fetchPage(pageKey, BuildContext context) async {
    RegisterationCubit inst = RegisterationCubit.get(context);

    try {
      wait.value = true;
      wait.notifyListeners();
      responseList = await HomeServices().pgetSomeServicesProviders(
          tagCodeList: [],
          index: pageKey,
          code: widget.code,
          pageSize: pageSize,
          customerID:
              inst.userResponse!.result!.responseResult!.id!).then((value) {
        wait.value = false;
        wait.notifyListeners();

        print(
            "///////////////////////////////////////////////////////////////////////////////////");
        print(value);

        return value;
      });
      isLastPage = responseList.length < pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(responseList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendLastPage(responseList);
      }
    } catch (e) {
      print("error --> $e");
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    print(
        "ooooooooooooooooooooooooooo${widget.code}oooooooooooooooooooooooooooooooooo");
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
    print(checkRTL(context));
    return Directionality(
      textDirection: getDirection(context),
      child: SafeArea(
        child: Scaffold(
          body: NotificationListener(
            onNotification: (note) {
              if (note is ScrollEndNotification) {
                setState(() {
                  if (isLastPage) {
                    if (_scrollController.position.atEdge) {}
                  } else {
                    setState(() {
                      ++pageKey;
                      _fetchPage(pageKey, context);
                    });
                  }
                });
              }
              return false;
            },
            child: Stack(
              children: [
                PagedListView<int, ServicesProvider>(
                  scrollController: _scrollController,
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ServicesProvider>(
                      itemBuilder: (context, item, index) {
                    HomeCubit inst = HomeCubit.get(context);

                    return Padding(
                      padding: EdgeInsets.all(1.h),
                      child: CardItem(
                        busineesID: item.id!,
                        isFavorite: item.isFavoriteForCustomer!,
                        desc:
                            checkRTL(context) ? item.detailsAr : item.detailsEn,
                        name: checkRTL(context) ? item.nameAr : item.nameEn,
                        coverImage: item.bannerUploadedFile?.base64Format,
                        currentContext: inst.mainContext!,
                        logoImage: item.logoUploadedFile?.base64Format,
                        tabNavigateToScreen: ProductsProviderDetailsScreen(
                          store: item,
                        ),
                      ),
                    );
                  },
                      /*animateTransitions: true,*/
                      newPageProgressIndicatorBuilder: (context) {
                    return loader();
                  }, firstPageProgressIndicatorBuilder: (context) {
                    return SizedBox();
                  }, firstPageErrorIndicatorBuilder: (context) {
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
                    valueListenable: wait,
                    builder: (context, val, child) => val == true
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: loader(),
                          )
                        : SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
