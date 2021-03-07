import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_place/google_place.dart';
import 'package:voyo_app/src/data/data.dart';
import 'package:voyo_app/src/data/models/gallery_item.dart';

abstract class BaseGalleryService {
  Future<List<GalleryImageData>> getGallery();
}

class GalleryService extends BaseGalleryService {
  static final GalleryService _instance = GalleryService.internal();

  factory GalleryService() => _instance;

  GalleryService.internal();

  static final GooglePlace _googlePlace = GooglePlace(googleMapsApi);

  List<GalleryImageData> _galleryImageData = [];

  Future<List<GalleryImageData>> getGallery() async =>
      _galleryImageData?.isNotEmpty == true
          ? _galleryImageData
          : _loadInitialGalleryData();

  Future<List<GalleryImageData>> _loadInitialGalleryData() async {
    NearBySearchResponse result = await _googlePlace.search
        .getNearBySearch(Location(lat: 40.785, lng: -73.9011), 50);

    debugPrint('results ${result.toString()}');

    _galleryImageData.add(GalleryImageData(
      id: '0',
        imageData: image0,
        imageType: ImageType.asset,
        metaData: 'fake',
        landmark: 'fake',
        lat: 40.785,
        lng: -73.9011,
        places: await _googlePlace.search
            .getNearBySearch(Location(lat: 40.785, lng: -73.9011), 50)));

    _galleryImageData.add(GalleryImageData(
        id: '1',
        imageData: image1,
        imageType: ImageType.asset,
        metaData: 'fake',
        landmark: 'fake',
        lat: 36.4037,
        lng: 25.4092,
        places: await _googlePlace.search
            .getNearBySearch(Location(lat: 36.4037, lng: 25.4092), 50)));

    _galleryImageData.add(GalleryImageData(
        id: '2',
        imageData: image2,
        imageType: ImageType.asset,
        metaData: 'fake',
        landmark: 'fake',
        lat: 12.5200,
        lng: -69.9578,
        places: await _googlePlace.search
            .getNearBySearch(Location(lat: 12.5200, lng: -69.9578), 50)));

    _galleryImageData.add(GalleryImageData(
        id: '3',
        imageData: image3,
        imageType: ImageType.asset,
        metaData: 'fake',
        landmark: 'fake',
        lat: 48.864716,
        lng: 2.349014,
        places: await _googlePlace.search.getNearBySearch(
            Location(
              lat: 48.864716,
              lng: 2.349014,
            ),
            50)));

    _galleryImageData.add(GalleryImageData(
        id: '4',
        imageData: image4,
        imageType: ImageType.asset,
        metaData: 'fake',
        landmark: 'fake',
        lat: 35.652832,
        lng: 139.839478,
        places: await _googlePlace.search
            .getNearBySearch(Location(lat: 40.785, lng: -73.9011), 50)));

    _galleryImageData.add(GalleryImageData(
        id: '5',
        imageData: image5,
        imageType: ImageType.asset,
        metaData: 'fake',
        landmark: 'fake',
        lat: 30.033333,
        lng: 31.233334,
        places: await _googlePlace.search
            .getNearBySearch(Location(lat: 30.033333, lng: 31.233334), 50)));


    return _galleryImageData;
  }
}
