import 'package:flutter/material.dart';
import 'package:pointz/Views/Widgets/paginated_list.dart';

class AllCategoryOffers extends StatelessWidget {
  String code;
  BuildContext? currentContext;
  AllCategoryOffers({required this.code, currentContext});

  @override
  Widget build(BuildContext context) {
    if (currentContext == null) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    } else {
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
    }

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: InfiniteScroll(
            code: code,
            currentContext: currentContext ?? context,
          ),
        ),
      ),
    );
  }
}
