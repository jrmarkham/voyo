import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyo_app/src/core_app.dart';
import 'package:voyo_app/src/data/blocs/image_data/image_data_bloc.dart';
import 'package:voyo_app/src/ui/screens/gallery.dart';
import 'package:voyo_app/src/ui/screens/home.dart';

void main() {
  // load user setting from cache
  // load user archive
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      if (kReleaseMode) exit(1);
    };

        runApp(


        MaterialApp(
        debugShowCheckedModeBanner: false,


        title: 'VoYo',
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ImageDataBloc>(create:(BuildContext context)=> ImageDataBloc())
            ], child: CoreApp(),
          ),


            ));
  });
}