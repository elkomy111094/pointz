import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/simple_Header.dart';

class MoreScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  MoreScreen({this.navBarScreenContext});
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleHeader(
          headerTitle: 'المزيد',
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: SingleChildScrollView(
            child: Column(
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
