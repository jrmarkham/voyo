import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voyo_app/src/data/models/gallery_item.dart';
import 'package:voyo_app/src/data/services/gallery_data.dart';

part 'image_data_event.dart';
part 'image_data_state.dart';

class ImageDataBloc extends Bloc<ImageDataEvent, ImageDataState> {
  ImageDataBloc() : super(ImageDataInitial());

  static final BaseGalleryService _galleryService = GalleryService();

  @override
  Stream<ImageDataState> mapEventToState(
    ImageDataEvent event,
  ) async* {
    if(event is ImageDataEventInit){
    yield ImageDataLoaded(state, await _galleryService.getGallery());

    }
  }

  void initImageData(){
    add(ImageDataEventInit());
  }
}
