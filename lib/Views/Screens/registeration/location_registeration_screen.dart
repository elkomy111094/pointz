import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pointz/Views/Screens/registeration/complete_registeration_data_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../helper/components.dart';
import '../../Widgets/custom_text_icon_button.dart';

class LocationRegisterationScreen extends StatefulWidget {
  @override
  _LocationRegisterationScreenState createState() =>
      _LocationRegisterationScreenState();
}

class _LocationRegisterationScreenState
    extends State<LocationRegisterationScreen> {
  int tabbed = 0;
  double? long = 54.0996582;
  double? lat = 23.9561599;
  String url = '';
  double zoomVal = 5;
  var markers = HashSet<Marker>();
  bool markerTapped = false;
  var cameraPosition;
  int markerLatestId = 1;

  GoogleMapController? myMapController;
  Future getlocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      String position = currentLoc.latitude.toString() +
          "," +
          currentLoc.longitude.toString();

      print(position);

      setState(() {
        long = currentLoc.longitude;
        lat = currentLoc.latitude;
        zoomVal = 20;
        cameraPosition = CameraPosition(
          target: LatLng(lat!, long!),
          zoom: 20,
        );
        myMapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat!, long!), zoom: 17)
            //17 is new zoom level
            ));
        url =
            "https://www.google.com/maps/dir/?api=1&origin=$position&destination=$lat,$long&waypoints";
      });
    }
  }

  Future ChangeCurrentLoc(LatLng MyPosition) async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      LatLng currentLoc = MyPosition;
      String position = currentLoc.latitude.toString() +
          "," +
          currentLoc.longitude.toString();

      setState(() {
        long = currentLoc.longitude;
        lat = currentLoc.latitude;
        url =
            "https://www.google.com/maps/dir/?api=1&origin=$position&destination=$lat,$long&waypoints";

        log(lat.toString());
        log(long.toString());
      });
    }
  }

  Future<void> saveMyLocationData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble("lat", lat!);
    pref.setDouble("long", long!);
  }

  @override
  void initState() {
    getlocation().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myMapController!.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            GoogleMap(
              onTap: (position) async {
                await ChangeCurrentLoc(position).then((value) {
                  markers.clear();
                  markers.add(
                    Marker(
                      markerId: MarkerId(markerLatestId.toString()),
                      position: position,
                      infoWindow: InfoWindow(
                        title: "موقعك الحالي",
                      ),
                    ),
                  );
                });
              },
              onMapCreated: (mapController) {
                setState(() {
                  myMapController = mapController;
                  getlocation().then((value) {
                    myMapController?.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                                target: LatLng(lat!, long!), zoom: 17)
                            //17 is new zoom level
                            ));
                    markers.add(
                      Marker(
                        markerId: MarkerId("100"),
                        position: LatLng(lat!, long!),
                        infoWindow: InfoWindow(
                          title: "موقعك الحالي",
                        ),
                      ),
                    );
                  });
                });
              },
              markers: markers,
              mapType: MapType.normal,
              mapToolbarEnabled: false,
              tiltGesturesEnabled: false,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              onCameraMove: (position) {
                setState(() {
                  zoomVal = 15;
                });
              },
              initialCameraPosition: cameraPosition == null
                  ? CameraPosition(
                      target: lat == null && long == null
                          ? LatLng(markers.first.position.latitude,
                              markers.first.position.longitude)
                          : LatLng(lat!, long!),
                      zoom: 0,
                    )
                  : cameraPosition,
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
                  buttonColor: kMainColor.withOpacity(.85),
                  textColor: Colors.white,
                  textSize: 14.sp,
                  onPressed: () async {
                    saveMyLocationData().then((value) {
                      pushToStack(context, CompleteRegisterationData());
                    });
                  },
                  buttonVerticalPaddingVal: 0,
                  buttonHorizontalPaddingval: 15.w,
                  roundedBorder: 10,
                  text: "سجل الموقع"),
            ),
          ],
        ),
      ),
    );
  }
}
