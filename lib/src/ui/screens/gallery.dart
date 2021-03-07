import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyo_app/src/data/blocs/image_data/image_data_bloc.dart';
import 'package:voyo_app/src/data/data.dart';
import 'package:voyo_app/src/ui/screens/gallery_screens/camera.dart';
import 'package:voyo_app/src/ui/screens/gallery_screens/manager.dart';
import 'package:voyo_app/src/ui/widgets.dart';

import 'gallery_screens/uploader.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // GalleryPage _galleryPage = GalleryPage.manage;
  int currentIdx;
  Widget currentPage;

  // ignore: close_sinks
   ImageDataBloc imageDataBloc;

  @override
  void initState() {
    // TODO: implement initState

     imageDataBloc = ImageDataBloc()..initImageData();
    _getGalleryPage(GalleryPage.manage);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Voyo ::: Gallery'),
        ),
        body: currentPage,
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 0,
          disableDefaultTabController: true,
          activeColor: Colors.white,
          backgroundColor: Colors.blue,
          onTap: (int idx) =>
              idx != currentIdx
                  ? _getGalleryPage(GalleryPage.values[idx])
                  : null,
          items: [
            TabItem(
                icon: Icon(
                  Icons.image,
                  color: currentIdx == GalleryPage.manage.index
                      ? Colors.blue
                      : Colors.white,
                ),
                title: 'Manage'),
            TabItem(
                icon: Icon(Icons.upload_file,
                    color: currentIdx == GalleryPage.upload.index
                        ? Colors.blue
                        : Colors.white),
                title: 'Upload'),
            TabItem(
                icon: Icon(Icons.camera,
                    color: currentIdx == GalleryPage.camera.index
                        ? Colors.blue
                        : Colors.white),
                title: 'Camera'),
          ],
        ));
  }

 void _getGalleryPage(GalleryPage galleryPage) {
    currentIdx = galleryPage.index;
    setState(() {
      switch (galleryPage) {
        case GalleryPage.camera:
          currentPage = GalleryCamera();
          return;
        case GalleryPage.upload:
          currentPage = GalleryUploader();
          return;
        case GalleryPage.manage:
        default:

        currentPage = GalleryManager(imageDataBloc);
          return;
      }
    });


  }
}
