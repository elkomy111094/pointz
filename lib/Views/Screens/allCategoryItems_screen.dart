import 'package:flutter/material.dart';
import 'package:pointz/Views/Widgets/paginated_list.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class AllCategoryItems extends StatelessWidget {
  String? code;
  String? type;

  AllCategoryItems({required this.code, required this.type});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              type.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Taga",
              ),
            ),
            backgroundColor: kMainColor,
            foregroundColor: Colors.white,
          ),
          body: InfiniteScroll(
            code: code,
          ),
        ),
      ),
    );
  }
}
