import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/core/services/home_services.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../models/services_provider_response.dart';
import '../Screens/products_provider_details_screen.dart';
import 'cardItem.dart';

class InfiniteScroll extends StatefulWidget {
  String? code;

  InfiniteScroll({this.code = ""});

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

  Future<void> _fetchPage(pageKey) async {
    try {
      wait.value = true;
      wait.notifyListeners();
      responseList = await HomeServices()
          .pgetSomeServicesProviders(widget.code!, pageKey, pageSize)
          .then((value) {
        wait.value = false;
        wait.notifyListeners();

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
    /*  _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });*/
    _fetchPage(pageKey);
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
      child: Scaffold(
        appBar: widget.code != null
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: kMainColor,
                toolbarHeight: 10.h,
              )
            : null,
        body: NotificationListener(
          onNotification: (note) {
            if (note is ScrollEndNotification) {
              setState(() {
                if (isLastPage) {
                  if (_scrollController.position.atEdge) {
                    showToastMessage(text: "لا يوجد عناصر أخري لعرضها");
                  }
                } else {
                  ++pageKey;
                  _fetchPage(pageKey);
                }
              });
            }
            return false;
          },
          child: Stack(
            children: [
              PagedListView<int, ServicesProvider>(
                shrinkWrap: true,
                scrollController: _scrollController,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<ServicesProvider>(
                    itemBuilder: (context, item, index) {
                      return Padding(
                        padding: EdgeInsets.all(1.h),
                        child: CardItem(
                          currentContext: context,
                          tabNavigateToScreen: ProductsProviderDetailsScreen(),
                        ),
                      );
                    },
                    /*animateTransitions: true,*/
                    newPageProgressIndicatorBuilder: null,
                    firstPageProgressIndicatorBuilder: (context) {
                      return SizedBox();
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
                                await _fetchPage(pageKey);
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
                          child: CircularProgressIndicator(
                            color: kMainColor,
                          ),
                        )
                      : SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pointz/core/services/home_services.dart';
import 'package:sizer/sizer.dart';

import '../../models/services_provider_response.dart';

class InfiniteScroll extends StatefulWidget {
  @override
  _InfiniteScrollState createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  final _numberOfServicesProvidersPerRequest = 10;

  int pageKey = 1;
  late bool isLastPage;

  final PagingController<int, ServicesProvider> _pagingController =
      PagingController(firstPageKey: 1);

  Future<void> _fetchPage(pageKey) async {
    try {
      List<ServicesProvider> responseList =
          await HomeServices().pgetSomeServicesProviders("", pageKey);
      isLastPage = responseList.length < _numberOfServicesProvidersPerRequest;
      if (isLastPage) {
        _pagingController.appendLastPage(responseList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(responseList, nextPageKey);
      }
    } catch (e) {
      print("error --> $e");
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (note) {
          if (note is ScrollEndNotification) {
            setState(() {
              ++pageKey;
              _fetchPage(pageKey);
            });
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () => Future.sync(() => _pagingController.refresh()),
          child: PagedListView<int, ServicesProvider>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<ServicesProvider>(
              itemBuilder: (context, item, index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 10.h,
                  child: Center(child: Text(item.nameAr.toString())),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
