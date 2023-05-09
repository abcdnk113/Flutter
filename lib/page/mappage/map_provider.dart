import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/network/request.dart';

class PlacesProvider with ChangeNotifier {
  final CameraPosition _cameraPosition = const CameraPosition(target: LatLng(10.801620, 106.683649));
  List<Place> _searchResults = [];
  final Set<Marker> _markers = {};

  CameraPosition get cameraPosition => _cameraPosition;
  List<Place> get searchResults => _searchResults;
  Set<Marker> get markers => _markers;
  // static const CameraPosition _myPosition = CameraPosition(
  //   target: LatLng(10.801620, 106.683649),
  //   zoom: 14.4746,
  // );

  void setSearchResults(List<Place> results) {
    _searchResults = results;
    notifyListeners();
  }

  void addMarker(Marker marker) {
    _markers.add(marker);
    notifyListeners();
  }

  void clearSearchResults() {
    _searchResults.clear();
    notifyListeners();
  }

  void clearMarkers() {
    _markers.clear();
    notifyListeners();
  }

  // void updateCameraPosition(CameraPosition newPosition) {
  //   _cameraPosition = newPosition;
  //   notifyListeners();
  // }
}


