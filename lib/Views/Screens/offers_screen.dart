import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/simple_Header.dart';

class OffersScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  OffersScreen({this.navBarScreenContext});
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleHeader(
          headerTitle: "العروض",
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //header
              ],
            ),
          ),
        ),
      ],
    );
  }
}
