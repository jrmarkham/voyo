import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:voyo_app/src/data/blocs/image_data/image_data_bloc.dart';
import 'package:voyo_app/src/data/models/gallery_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _nycWorld = CameraPosition(
    target: LatLng(40.785, -22.609),
    zoom: 1,
  );

  // ignore: close_sinks
  ImageDataBloc imageDataBloc;
  final Map<String, Marker> _markers = {};
  double opacityValue = 0;
  String showImageData;

  @override
  void initState() {
    // TODO: implement initState

    imageDataBloc = BlocProvider.of<ImageDataBloc>(context)..initImageData();
    super.initState();
    //_buildMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: imageDataBloc,
      listener: (BuildContext context, ImageDataState state) {
        if (state is ImageDataLoaded) {
          _buildMarkers(state.galleryData);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Voyo ::: Home'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _nycWorld,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers.values.toSet(),
            ),
            Opacity(
                opacity: opacityValue,
                child: Stack(
                  children: [
                    showImageData != null ? Image.asset(showImageData) :  Container(),
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: Container(
                        color: Colors.white30,
                        height: 50.0,width: 50.0,
                        child: IconButton(
                            icon: Icon(Icons.cancel), onPressed: _setImageOff),
                      ),
                    )
                  ],
                )),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/gallery'),
          child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 50.0,
              child: Text('Gallery',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0))),
        ),
      ),
    );
  }

  void _buildMarkers(List<GalleryImageData> list) async {
    debugPrint('list ${list.toString()}');

    _markers.clear();
    setState(() {
      list.forEach((GalleryImageData item) {
        final Marker marker = Marker(
            markerId: MarkerId(item.id),
            // icon: Container(),

            position: LatLng(item.lat, item.lng),
            infoWindow: InfoWindow(
                title: item.places.results.first.name,
                snippet: item.places.results.first.formattedAddress),
            onTap: ()=> _setImageOn(item.imageData));

        _markers[item.id] = marker;
      });
    });
  }

  Widget _addImage() {
    return showImageData != null ? Image.asset(showImageData) : Container();
  }

  _setImageOn(String imageData) {
    debugPrint('imageData $imageData');
    setState(() {
      opacityValue = 1;
      showImageData = imageData;
    });
  }

  _setImageOff() => setState(() => opacityValue = 0);
}
