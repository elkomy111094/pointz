import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pointz/Views/Screens/home_screen.dart';
import 'package:pointz/Views/Screens/more_screen.dart';
import 'package:pointz/Views/Screens/mypoints_screen.dart';
import 'package:pointz/Views/Screens/offers_screen.dart';
import 'package:pointz/Views/Screens/orders_screen.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../views_models/home/home_cubit.dart';
import '../../views_models/registeration/registeration_cubit.dart';
// ----------------------------------------- Provided Style ----------------------------------------- //

class NavBarScreen extends StatefulWidget {
  int? defaultScreenId;

  NavBarScreen({this.defaultScreenId});

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar = true;

  late int selectedItemId;

  setLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("loginState", true);
  }

  @override
  void initState() {
    selectedItemId = widget.defaultScreenId ?? 0;
    setLoggedIn();

    super.initState();

    _controller =
        PersistentTabController(initialIndex: widget.defaultScreenId ?? 0);
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
        title: "Home".tr(),
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Taga",
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
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
        title: "Orders".tr(),
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Taga",
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: selectedItemId == 1 ? kMainColor : Colors.grey),
      ),
      PersistentBottomNavBarItem(
        activeColorSecondary: kMainColor,
        icon: Container(
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/navbar_icons/points.svg",
              color: selectedItemId == 2 ? Colors.white : Colors.white,
              width: 4.h,
              height: 4.h,
            ),
          ),
        ),
        title: "Points".tr(),
        activeColorPrimary: kMainColor,
        textStyle: TextStyle(
            fontFamily: "Taga",
            fontSize: 10.sp,
            height: .04,
            fontWeight: FontWeight.bold,
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
        title: "Offers".tr(),
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Taga",
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
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
        title: "More".tr(),
        activeColorPrimary: Colors.blue,
        textStyle: TextStyle(
            fontFamily: "Taga",
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: selectedItemId == 4 ? kMainColor : Colors.grey),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubitInst = HomeCubit.get(context);
    homeCubitInst.setMainContext(context);
    RegisterationCubit inst = RegisterationCubit.get(context);
    if (inst.userResponse == null) {
      inst
          .getUserDetails(
              phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber!,
              UID: FirebaseAuth.instance.currentUser!.uid)
          .then((value) {
        setState(() {});
      });
    } else {}
    print(inst.refereshedFirebaseToken);
    return inst.userResponse == null
        ? Scaffold(body: Center(child: loader()))
        : Directionality(
            textDirection: translator.isDirectionRTL(context)
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                body: PersistentTabView(
                  context,
                  controller: _controller,
                  screens: _buildScreens(context),
                  items: _navBarsItems(),
                  confineInSafeArea: true,
                  backgroundColor: Colors.white,
                  handleAndroidBackButtonPress: true,
                  resizeToAvoidBottomInset: true,
                  bottomScreenMargin: 0,
                  stateManagement: true,
                  padding: NavBarPadding.all(1.h),
                  navBarHeight: 9.h,
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
                  itemAnimationProperties: const ItemAnimationProperties(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease,
                  ),
                  screenTransitionAnimation: const ScreenTransitionAnimation(
                    animateTabTransition: true,
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 300),
                  ),
                  navBarStyle: NavBarStyle
                      .style15, // Choose the nav bar style with this property
                ),
              ),
            ),
          );
  }
}
