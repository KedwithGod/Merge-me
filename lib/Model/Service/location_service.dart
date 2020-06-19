import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';


final Geolocator geoLocator = Geolocator()
  ..forceAndroidLocationManager;
UserLocation _currentAddress;


class LocationService  {


  Future<UserLocation> getLocation() async {
    try {
      Position position =
      await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      try {
        List<Placemark> p = await geoLocator.placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = p[0];
        _currentAddress = UserLocation(locality: place.locality,
            postalCode: place.postalCode,
            country: place.country,subLocality:place.subLocality);
        print(place.locality);
      } catch (e) {
        print(e);
      }
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    print(_currentAddress);
    return _currentAddress;
  }

  StreamController<UserLocation> _locationController =
  StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    Geolocator().checkGeolocationPermissionStatus().then((granted) {
      if (granted == GeolocationStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        geoLocator.getPositionStream().listen((position) async {
          if (position != null){
            try {
              List<Placemark> p = await geoLocator.placemarkFromCoordinates(
                  position.latitude,position.longitude);
              Placemark place = p[0];
              _currentAddress = UserLocation(locality: place.locality,
                  postalCode: place.postalCode,
                  country: place.country,subLocality: place.subLocality);
            } catch (e) {
              print(e);

            }
            _locationController.add(_currentAddress);
          }
        });
      }
    });
  }

}


