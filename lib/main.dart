// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//TODO use device preview package 

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            color: Colors.black,
            width: screenWidth,
            child: Center(
              child: LayoutBuilder(builder: (context, constrains) {
                var DeviceType = getDeviceType(mediaQueryData);
                double localHeight = constrains.maxHeight;
                double localWidth = constrains.maxWidth;
                print(' height = $screenHeight ');
                print(" local height = $localHeight");
                print('width = $screenWidth ');
                print(' local width = $localWidth');
                print(DeviceType);
                return Container(
                  color: Colors.red,
                  width: localWidth / 2,
                  height: localHeight / 2,
                );
              }),
            ),
          ),
        ));
  }

  DeviceType getDeviceType(MediaQueryData mediaQueryData) {
    Orientation orientation = mediaQueryData.orientation;
    double width = 0;
    if (orientation == Orientation.landscape) {
      width = mediaQueryData.size.height;
    } else {
      width = mediaQueryData.size.width;
    }
    if (width >= 950) {
      return DeviceType.Desktop;
    } else if (width >= 600) {
      return DeviceType.Tablet;
    }
    return DeviceType.Mobile;
  }
}

enum DeviceType { Mobile, Tablet, Desktop }
