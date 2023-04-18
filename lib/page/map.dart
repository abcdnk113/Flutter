import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
// ignore: depend_on_referenced_packages
import 'package:google_maps_webservice/places.dart' ;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  // ignore: prefer_collection_literals
  Set<Marker> markers = Set<Marker>();

  String? _mapStyle;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  late GoogleMapController _googleMapController;
  static const CameraPosition _myPosition = CameraPosition(
    target: LatLng(10.801620, 106.683649),
    zoom: 14.4746,
  );
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void showGoogleAutoComplete() async {
    const kGoogleApiKey = "AIzaSyDE6lv3kdLE-moiGhirKopPGzGSBiag39Y";

    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "us",
      language: "en",
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      // ignore: unnecessary_new
      components: [new Component(Component.country, "us")],
      types: ["(cities)"],
      hint: "Search City",
    );
  }

  @override
  void initState() {
    super.initState();

    rootBundle.loadString("images/assets/map_style.txt").then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: w * .12, horizontal: h * .04),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Britney Glayers',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 12)),
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
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              key: _formKey,
              readOnly: true,
              onTap: () {
                showGoogleAutoComplete();
              },
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(13)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(13)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(13)),
                hintText: "Search",
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 470,
              width: w - 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: GoogleMap(
                    markers: markers,
                    mapType: MapType.normal,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    scrollGesturesEnabled: true,
                    initialCameraPosition: _myPosition,
                    onMapCreated: (controller) {
                      _googleMapController = controller;
                      _googleMapController.setMapStyle(_mapStyle);
                    }),
              ),
            ),
          ])),
    ));
  }
}
