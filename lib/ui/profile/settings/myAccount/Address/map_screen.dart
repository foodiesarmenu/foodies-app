import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const String routeName = 'map_screen';

  @override
  State<MapScreen> createState() => _MapScreenState();
}



class _MapScreenState extends State<MapScreen> {

  FloatingSearchBarController controller = FloatingSearchBarController();
  static Position? position;
  Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.getCurrentLocation();
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyCurrentLocation();
  }
  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      //markers: markers,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
      /*polylines: placeDirections != null
          ? {
        Polyline(
          polylineId: const PolylineId('my_polyline'),
          color: Colors.black,
          width: 2,
          points: polylinePoints,
        ),
      }
          : {},*/
    );
  }
  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: controller,
      elevation: 6,
      hintStyle: TextStyle(fontSize: 18),
      queryStyle: TextStyle(fontSize: 18),
      hint: 'Find a place..',
      border: BorderSide(style: BorderStyle.none),
      margins: EdgeInsets.all(8),
      padding: EdgeInsets.all(0),
      height: 54,
      iconColor: Theme.of(context).primaryColor,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      //progress: progressIndicator,
      onQueryChanged: (query) {
       // getPlacesSuggestions(query);
      },
      onFocusChanged: (_) {
        // hide distance and time row
        /*setState(() {
          isTimeAndDistanceVisible = false;
        });*/
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
              icon: Icon(Icons.place, color: Colors.black.withOpacity(0.6)),
              onPressed: () {}),
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //buildSuggestionsBloc(),
              //buildSelectedPlaceLocationBloc(),
              //buildDiretionsBloc(),
            ],
          ),
        );
      },
    );

  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map'),),
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null ? buildMap() :  Center(
            child: Container(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          buildFloatingSearchBar(),
        ],
      ),

      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: _goToMyCurrentLocation,
          child: Icon(Icons.place_outlined, color: Colors.white,),
        ),
      ),

    );
  }
}
