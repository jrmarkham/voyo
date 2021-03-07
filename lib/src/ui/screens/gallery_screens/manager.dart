import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyo_app/src/data/blocs/image_data/image_data_bloc.dart';
import 'package:voyo_app/src/data/models/gallery_item.dart';
import 'package:transparent_image/transparent_image.dart';

class GalleryManager extends StatefulWidget {
  final ImageDataBloc imageDataBloc;
  GalleryManager(this.imageDataBloc);
  @override
  _GalleryManagerState createState() => _GalleryManagerState();
}

class _GalleryManagerState extends State<GalleryManager> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder(
        cubit: widget.imageDataBloc,
        builder: (BuildContext context,  ImageDataState state) {

          debugPrint('gallery data ${widget?.imageDataBloc?.state?.galleryData}');

          return widget?.imageDataBloc?.state?.galleryData?.isNotEmpty == true
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: widget.imageDataBloc.state.galleryData.length,
            itemBuilder: (BuildContext context, int idx) {
              final GalleryImageData item = widget.imageDataBloc.state.galleryData[idx];

              return Stack(

                children: [


                  item.imageType == ImageType.asset
                      ? Image.asset(item.imageData)
                      : FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: item.imageData,
                  ),

                  Positioned(
                    left: 10.0, top: 10.0,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [


                        Text(item.places.results.first.name ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                             fontWeight: FontWeight.bold
                          ),),

                        Text(item.places.results.first.vicinity??'',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0
                          ),),

                    Text(item.places.results.first.formattedAddress??'',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0
                          ),),
                        Text(item.places.results.first.businessStatus??'',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0
                          ),),
                      ],
                    ),
                  ),

                ],

              );
            },


          ) :
          Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 15.0,
              ),
            ),
          );
        }
      ),
          );
  }

  // _loadImage() async {
  //   final List<GalleryImageData> list = await _galleryService.getGallery();
  //   debugPrint('_galleryImageList ${list.toString()}');
  //   list.forEach((GalleryImageData item)=>_galleryImageList.add(item));
  //
  // }

}
