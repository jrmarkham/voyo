part of 'image_data_bloc.dart';

abstract class ImageDataEvent extends Equatable {
  const ImageDataEvent();
}

class ImageDataEventInit extends ImageDataEvent {
  @override
  List<Object> get props => [];
}