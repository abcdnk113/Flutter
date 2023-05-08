// ignore_for_file: library_private_types_in_public_api, prefer_collection_literals
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:provider/provider.dart';
import 'package:weather/network/request.dart';
import 'package:weather/page/mappage/map_provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  //late LatLng _currentPosition;
  String? _mapStyle;
  final textEditingController = TextEditingController();
  late GoogleMapController _googleMapController;
  late PlacesProvider placesProvider = Provider.of<PlacesProvider>(context);
  static const CameraPosition _myPosition = CameraPosition(
    target: LatLng(10.801620, 106.683649),
    zoom: 14.4746,
  );
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    rootBundle.loadString("images/assets/map_style.txt").then(
      (string) {
        _mapStyle = string;
      },
    );
  }
  //final _controller = TextEditingController();
  final _placesApi =
      GeoapifyPlacesApi(apiKey: '188c7813599f48708c016d3d3e9a0027');

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: w * .12, horizontal: h * .04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'images/avatar.png',
                      width: 38,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Britney Glayers',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(
                            'New York-USA',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                          const Iconify(
                              MaterialSymbols.keyboard_arrow_down_rounded)
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  const Iconify(
                    Majesticons.dashboard_line,
                    size: 32,
                    color: Colors.black,
                  ) // widget
                ],
              ),
              const SizedBox(height: 20),
              // TextField(
              //   controller: _controller,
              //   onChanged: _onSearchChanged,
              //   decoration: const InputDecoration(
              //     hintText: 'Search for a location',
              //   ),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: _searchResults.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ListTile(
              //         title: Text(_searchResults[index].formatted),
              //         onTap: () => _onResultSelected(_searchResults[index]),
              //       );
              //     },
              //   ),
              // ),
              Autocomplete<Place>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return placesProvider.searchResults.isEmpty
                      ? []
                      : placesProvider.searchResults.where(
                          (place) => place.formatted.toLowerCase().contains(
                                textEditingValue.text.toLowerCase(),
                              ),
                        );
                },
                onSelected: _onResultSelected,
                fieldViewBuilder: (context, textEditingController,
                    FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: 'Search for a location',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                    ),
                    onChanged: _onSearchChanged,
                  );
                },
                displayStringForOption: (Place place) => place.formatted,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 470,
                width: w - 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: GoogleMap(
                    markers: placesProvider.markers,
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    scrollGesturesEnabled: true,
                    initialCameraPosition: _myPosition,
                    onMapCreated: (controller) {
                      _googleMapController = controller;
                      _googleMapController.setMapStyle(_mapStyle);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearchChanged(String query) async {
    try {
      final results = await _placesApi.autocomplete(query: query);      
      placesProvider.setSearchResults(results);
    } catch (e) {
      print("Error: $e");
    }
  }

  void _onResultSelected(Place result) {
    final newCameraPosition = CameraPosition(
      target: LatLng(result.lat, result.lng),
      zoom: 10,
    );
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));

    Marker newMarker = Marker(
      markerId: const MarkerId('newMarker'),
      position: LatLng(result.lat, result.lng),
      infoWindow: InfoWindow(title: result.formatted),
    );

    placesProvider.addMarker(newMarker);
    // Clear search results and text field
    placesProvider.clearSearchResults();
  }
}

