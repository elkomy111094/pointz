import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pointz/views_models/home/home_cubit.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import 'Views/Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => RegisterationCubit()),
    BlocProvider(create: (context) => HomeCubit()),
  ], child: Pointz()) /*DevicePreview(builder: (_) => Pointz())*/);
}

class Pointz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To Prevent LandScape Mode (Prevent App Rotation)
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Sizer(
      builder: (BuildContext context, Orientation orientation, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: SplashScreen()),
        );
      },
    );
  }
}
