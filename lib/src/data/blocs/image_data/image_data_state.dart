part of 'image_data_bloc.dart';

abstract class ImageDataState extends Equatable {
  final List<GalleryImageData> galleryData = [];
}

class ImageDataInitial extends ImageDataState {
  @override
  List<Object> get props => [];
}

class ImageDataLoaded extends ImageDataState {
final ImageDataState state;
  final List<GalleryImageData> galleryData;
ImageDataLoaded(this.state, this.galleryData);
  @override
  List<Object> get props => [state, galleryData];
}
