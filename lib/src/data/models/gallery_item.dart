import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:google_place/google_place.dart';

enum ImageType {asset, url}

class GalleryImageData extends Equatable {
  final String id; // ur
  final String imageData; // url or asset link ..
  final ImageType imageType;
  final String landmark;

  final double lat;
  final double lng;
  final String metaData;
  final NearBySearchResponse places;

  GalleryImageData({
    @required this.id,
    @required this.imageData,
    @required this.imageType,
    @required this.landmark,
    @required this.lat,
    @required this.lng,
    @required this.metaData,
    @required this.places

  });

  @override
  List<Object> get props => [id, imageData, imageType, landmark, lat,
    lng, metaData, places];
}