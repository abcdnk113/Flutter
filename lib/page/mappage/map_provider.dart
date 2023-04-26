import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/network/request.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _searchResults = [];
  final Set<Marker> _markers = {};

  List<Place> get searchResults => _searchResults;
  Set<Marker> get markers => _markers;

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
}
