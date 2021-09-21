// @dart=2.9

import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io' as Platform;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  CameraDeepArController cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilteds = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          CameraDeepAr(
            onCameraReady: (isReady) {
              setState(() {});
            },
            cameraDeepArCallback: (c) async {
              cameraDeepArController = c;
              setState(() {});
            },
            androidLicenceKey:
                '7e312c2144f7aca7054f108a5a20f192257804b62ab09aa99247aa8e954914ae5c9efc276f3a267d',
            iosLicenceKey: '',
            onImageCaptured: (String path) {},
            onVideoRecorded: (String path) {},
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(8, (page) {
                        bool active = currentPage == page;

                        return Platform.Platform.isIOS
                            //IOS View
                            ? GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {});
                                },
                                child: AvatarView(
                                  radius: active ? 65 : 30,
                                  isOnlyText: false,
                                  borderWidth: 2,
                                  borderColor: Colors.purpleAccent,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath:
                                      "assets/ios/${page.toString()}.jpg",
                                  placeHolder:
                                      const Icon(Icons.person, size: 50),
                                  errorWidget:
                                      const Icon(Icons.error, size: 50),
                                ),
                              )
                            //Android View
                            : GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {});
                                },
                                child: AvatarView(
                                  radius: active ? 45 : 20,
                                  isOnlyText: false,
                                  borderWidth: 2,
                                  borderColor: Colors.purpleAccent,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath:
                                      "assets/android/${page.toString()}.jpg",
                                  placeHolder:
                                      const Icon(Icons.person, size: 50),
                                  errorWidget:
                                      const Icon(Icons.error, size: 50),
                                ),
                              );
                      })))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
