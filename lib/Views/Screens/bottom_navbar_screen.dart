import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pointz/Views/Screens/home_screen.dart';
import 'package:pointz/Views/Screens/more_screen.dart';
import 'package:pointz/Views/Screens/mypoints_screen.dart';
import 'package:pointz/Views/Screens/offers_screen.dart';
import 'package:pointz/Views/Screens/orders_screen.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';
// ----------------------------------------- Provided Style ----------------------------------------- //

class ProvidedStylesExample extends StatefulWidget {
  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  int selectedItemId = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens(BuildContext navBarContext) {
    return [
      HomeScreen(navBarScreenContext: navBarContext),
      OrdersScreen(navBarScreenContext: navBarContext),
      MyPointsScreen(navBarScreenContext: navBarContext),
      OffersScreen(navBarScreenContext: navBarContext),
      MoreScreen(navBarScreenContext: navBarContext),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorSecondary: kMainColor,
        icon: Container(
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/navbar_icons/home.svg",
              color: selectedItemId == 0 ? kMainColor : Colors.grey,
              width: 2.h,
              height: 2.h,
            ),
          ),
        ),
        title: "الرئيسيه",
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Hacen",
            fontSize: 10.sp,
            color: selectedItemId == 0 ? kMainColor : Colors.grey),
      ),
      PersistentBottomNavBarItem(
        activeColorSecondary: kMainColor,
        icon: Container(
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/navbar_icons/orders.svg",
              color: selectedItemId == 1 ? kMainColor : Colors.grey,
              width: 3.h,
              height: 3.h,
            ),
          ),
        ),
        title: "الطلبات",
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Hacen",
            fontSize: 10.sp,
            color: selectedItemId == 1 ? kMainColor : Colors.grey),
      ),
      PersistentBottomNavBarItem(
        activeColorSecondary: kMainColor,
        contentPadding: 10,
        icon: Container(
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/navbar_icons/points.svg",
              color: selectedItemId == 2 ? Colors.white : Colors.grey,
              width: 4.h,
              height: 4.h,
            ),
          ),
        ),
        title: "نقاطي",
        activeColorPrimary: kMainColor,
        textStyle: TextStyle(
            fontFamily: "Hacen",
            fontSize: 10.sp,
            color: selectedItemId == 2 ? kMainColor : Colors.grey),
      ),
      PersistentBottomNavBarItem(
        activeColorSecondary: kMainColor,
        icon: Container(
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/navbar_icons/offers.svg",
              color: selectedItemId == 3 ? kMainColor : Colors.grey,
            ),
          ),
        ),
        title: "العروض",
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Hacen",
            fontSize: 10.sp,
            color: selectedItemId == 3 ? kMainColor : Colors.grey),
      ),
      PersistentBottomNavBarItem(
        activeColorSecondary: kMainColor,
        icon: Container(
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/navbar_icons/more.svg",
              color: selectedItemId == 4 ? kMainColor : Colors.grey,
              width: 1.h,
              height: 1.h,
            ),
          ),
        ),
        title: "المزيد",
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Hacen",
            fontSize: 10.sp,
            color: selectedItemId == 4 ? kMainColor : Colors.grey),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child:
                  Center(child: SvgPicture.asset("assets/icons/favorites.svg")),
            ),
          ),
          screens: _buildScreens(context),
          items: _navBarsItems(),

          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: 10.h,
          onItemSelected: (id) {
            print(id);
            setState(() {
              selectedItemId = id;
            });
          },
          hideNavigationBarWhenKeyboardShows: true,
          margin: EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          selectedTabScreenContext: (context) {
            BuildContext testContext = context!;
          },
          hideNavigationBar: _hideNavBar,
          decoration: NavBarDecoration(
              colorBehindNavBar: Colors.indigo,
              borderRadius: BorderRadius.circular(20.0)),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 300),
          ),
          navBarStyle: NavBarStyle
              .style15, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
