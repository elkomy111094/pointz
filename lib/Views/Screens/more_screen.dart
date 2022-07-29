import 'package:flutter/material.dart';
import 'package:pointz/Views/Screens/choose_language_screen.dart';
import 'package:pointz/Views/Screens/favorites_screen.dart';
import 'package:pointz/Views/Screens/wallet_screen.dart';
import 'package:pointz/Views/Widgets/more_item_card.dart';
import 'package:sizer/sizer.dart';

import '../../helper/components.dart';
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
    return SafeArea(
      child: Stack(
        children: [
          SimpleHeader(
            headerTitle: 'المزيد',
            showPopIconButton: false,
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  //header
                  MoreItemCard(
                      title: "المحفظه",
                      iconUrl: "assets/icons/paymentIcon.svg",
                      onTabButton: () {
                        pushToStack(widget.navBarScreenContext, WalletScreen());
                      }),

                  MoreItemCard(
                      title: "المفضله",
                      iconUrl: "assets/icons/empty-heart.svg",
                      onTabButton: () {
                        pushToStack(
                            widget.navBarScreenContext, FavoritesScreen());
                      }),

                  MoreItemCard(
                      title: "تغيير اللغه",
                      iconUrl: "assets/icons/langs.svg",
                      onTabButton: () {
                        pushToStack(context, ChooseLanguageScreen());
                      }),

                  MoreItemCard(
                      title: "المساعده والدعم",
                      iconUrl: "assets/icons/support.svg",
                      onTabButton: () {}),

                  MoreItemCard(
                      title: "سياسه الخصوصيه",
                      iconUrl: "assets/icons/policy.svg",
                      onTabButton: () {}),

                  MoreItemCard(
                      title: "الشروط والاحكام",
                      iconUrl: "assets/icons/conditions.svg",
                      onTabButton: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
