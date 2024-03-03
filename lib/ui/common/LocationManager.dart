import 'package:location/location.dart';

class LocationManager{
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<bool> isLocationPermissionGranted()async{
    // to check if user granted location access
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    return _permissionGranted == PermissionStatus.granted;
  }
  Future<bool> isLocationServiceEnabled() async{
    //to check if the service is working
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    return _serviceEnabled;
  }

  Future<bool> canGetLocation()async{
    bool isPermissionGranted = await isLocationPermissionGranted();
    bool isLocationEnabled =  await isLocationServiceEnabled();
    return isPermissionGranted &&  isLocationEnabled;
  }

  Future<LocationData> getDeviceLocation(){
    return location.getLocation();
  }

  Stream<LocationData> trackUserLocation(){
    return location.onLocationChanged;
  }

}