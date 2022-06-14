import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/cardItem.dart';
import '../Widgets/simple_Header.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
                  padding: EdgeInsets.only(top: 10.h),
                  child: Container(
                    height: 90.h,
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CardItem(
                            isFavorite: true,
                            currentContext: context,
                          );
                        },
                        separatorBuilder: (context, _) {
                          return Divider(
                            height: 3.h,
                          );
                        },
                        itemCount: 5),
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
