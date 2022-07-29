import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/splash_screen.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/views_models/category/category_cubit.dart';
import 'package:pointz/views_models/gifts/gifts_cubit.dart';
import 'package:pointz/views_models/home/home_cubit.dart';
import 'package:pointz/views_models/offers/offers_cubit.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: kMainColor, // navigation bar color
    statusBarColor: kMainColor, // status bar color
    systemNavigationBarDividerColor: Colors.grey,
  ));
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang',
  );
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterationCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => GiftsCubit()),
        BlocProvider(create: (context) => OffersCubit()),
      ],
      child: LocalizedApp(
          child: /*DevicePreview(builder: (_) => Pointz())*/ Pointz())));
}

class Pointz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To Prevent LandScape Mode (Prevent App Rotation)
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return FutureBuilder(
        future: SharedPreferences.getInstance().then((value) {
          return value.getBool("loginState");
        }),
        builder: (context, AsyncSnapshot snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: kMainColor,
                  ),
                ),
              ),
            );
          } else {
            if (snap.hasData) {
              if (snap.data == true) {
                return Sizer(
                  builder: (BuildContext context, Orientation orientation, _) {
                    RegisterationCubit inst = RegisterationCubit.get(context);
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: translator.delegates,
                      locale: translator.activeLocale,
                      supportedLocales: translator.locals(),
                      home: SafeArea(
                          child: SplashScreen(
                        next: "NavBar",
                      )),
                    );
                  },
                );
              } else {
                return Sizer(
                  builder: (BuildContext context, Orientation orientation, _) {
                    RegisterationCubit inst = RegisterationCubit.get(context);
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: translator.delegates,
                      locale: translator.activeLocale,
                      supportedLocales: translator.locals(),
                      home: SafeArea(
                          child: SplashScreen(
                        next: "Login",
                      )),
                    );
                  },
                );
              }
            } else {
              return Sizer(
                builder: (BuildContext context, Orientation orientation, _) {
                  RegisterationCubit inst = RegisterationCubit.get(context);
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: translator.delegates,
                    locale: translator.activeLocale,
                    supportedLocales: translator.locals(),
                    home: SafeArea(
                        child: SplashScreen(
                      next: "OnBoarding",
                    )),
                  );
                },
              );
            }
          }
        });
  }
}
