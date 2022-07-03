import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  ValueNotifier<bool> wait = ValueNotifier(false);
  List<ServicesProvider> responseList = [];

  final PagingController<int, ServicesProvider> _pagingController =
      PagingController(firstPageKey: 1);

  ScrollController _scrollController = ScrollController();

  Future<void> _fetchPage(pageKey, BuildContext context) async {
    RegisterationCubit inst = RegisterationCubit.get(context);
    int userId = inst.userResponse!.result!.responseResult!.id!;
    try {
      wait.value = true;
      wait.notifyListeners();
      responseList = await FavoritesServices()
          .getFavoriteServicesProviders(
              index: pageKey, userId: userId, pageSize: pageSize)
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
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 5.w, right: 5.w),
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
                                    isFavorite: true,
                                    desc: item.detailsAr,
                                    name: item.nameAr,
                                    currentContext: context,
                                    tabNavigateToScreen:
                                        ProductsProviderDetailsScreen(),
                                  ),
                                );
                              },

                              /*animateTransitions: true,*/
                              newPageProgressIndicatorBuilder: null,
                              firstPageProgressIndicatorBuilder: (context) {
                                return SizedBox();
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
                SimpleHeader(
                  headerTitle: 'المفضله',
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
