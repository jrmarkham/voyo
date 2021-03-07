import 'package:flutter/material.dart';

class GalleryUploader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Center(
     child: Column(
        children: [
          Text('Up load Images from internet'),

          ElevatedButton(
              child: Text('Upload Canned Vidoes'),
              onPressed: ()=> debugPrint('get images')),
        ],
      ),
   );
  }
}
