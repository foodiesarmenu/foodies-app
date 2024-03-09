import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/ButtonInProfile.dart';
import 'package:foodies_app/ui/common/LocationManager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../common/custom_app_bar.dart';


class MyAddressScreen extends StatefulWidget {
  static const String routeName = 'add-address';
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  static const String userLocationId = 'user';
  LocationManager locationManager = LocationManager();

  GoogleMapController? _controller;
  static  CameraPosition userLocation = const CameraPosition(
    //31.208777, 29.943629 dorms at alexandria
    target: LatLng(31.208777, 29.943629),
    zoom: 17,
  );

  // list of unique elements
  Set<Marker> markers = {
    Marker(markerId: const MarkerId(userLocationId),
    position: (userLocation.target),
      //icon: ,
      //onDrag: ,
      //rotation: ,
        draggable: true,

        onDrag: (newPosition) {},
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: const InfoWindow(title: 'Mahmoud', snippet: 'This is my location')

    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Delivery Addresses'),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(child:  GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: userLocation,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              onTap: (latLang){},
              markers: markers,

            ),
              ),
            ButtonInProfile(
              borderColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white,
              textColor: Theme.of(context).primaryColor,
              text: '+ Add new address',
              onPressed: () {
                getLocation();
              },
            ),
          ],
        ),
      ),
    );
  }

  StreamSubscription<LocationData>? locationListener;
  void getLocation()async {
    bool canGetLocation = await locationManager.canGetLocation();
    if(!canGetLocation) return;
    //if I can get the location??
    var locationDate = await locationManager.getDeviceLocation();// it gets the location only one time
    print(locationDate);
    locationManager.location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 2000,
      distanceFilter: 100,
    );
    locationListener = locationManager.trackUserLocation()
    .listen((locationData) {
      if(locationData == null)return;
      setState(() {
        userLocation = CameraPosition(target: LatLng(
            locationDate.latitude??0.0,
            locationDate.longitude??0.0));
        markers.add( Marker(markerId: const MarkerId(userLocationId),
            position: (userLocation.target),
            infoWindow: const InfoWindow(title: 'Mahmoud', snippet: 'This is my location')
        ),);
      });
      changeMapPosition(locationData);
    });
    print(locationDate);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    locationListener?.cancel();
  }

  void changeMapPosition(LocationData locationData) {
    _controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: userLocation.target,
      zoom: 17
      )));
  }
}
