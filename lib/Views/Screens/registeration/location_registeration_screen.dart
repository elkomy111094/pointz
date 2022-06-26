import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pointz/Views/Widgets/custom_text_icon_button.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../bottom_navbar_screen.dart';

class LocationRegisterationScreen extends StatefulWidget {
  @override
  _LocationRegisterationScreenState createState() =>
      _LocationRegisterationScreenState();
}

class _LocationRegisterationScreenState
    extends State<LocationRegisterationScreen> {
  double long = 31.1715202;
  double lat = 30.0115274;
  var markers = HashSet<Marker>();
  Future getlocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        long = currentLoc.longitude;
        lat = currentLoc.latitude;
      });
    }
  }

  @override
  void initState() {
    RegisterationCubit inst = RegisterationCubit.get(context);
    log("------------------------------------------------------------------------------------");
    log(inst.userFirebaseId);
    getlocation();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onTap: (val) {
                getlocation().then((value) {
                  setState(() {
                    print("reloooooooooooooooooooooooooad");
                  });
                });
              },
              onMapCreated: (mapController) {
                setState(() async {
                  markers.add(
                    Marker(
                      markerId: MarkerId("1"),
                      position: LatLng(lat, long),
                      infoWindow: InfoWindow(
                        title: "موقعك الحالي",
                      ),
                    ),
                  );
                });
              },
              markers: markers,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, long),
                zoom: 19,
              ),
            ),
            Positioned(
              left: 5.w,
              right: 5.w,
              bottom: 2.h,
              child: CustomTextIconButton(
                  icon: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 2.h,
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/mylocation.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  buttonColor: kMainColor.withOpacity(.75),
                  textColor: Colors.white,
                  textSize: 12.sp,
                  onPressed: () {
                    pushToStack(context, ProvidedStylesExample());
                  },
                  buttonVerticalPaddingVal: 0,
                  buttonHorizontalPaddingval: 15.w,
                  roundedBorder: 10,
                  text: "سجل"),
            ),
          ],
        ),
      ),
    );
  }
}
