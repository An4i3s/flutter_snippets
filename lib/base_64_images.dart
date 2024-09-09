import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Images {
  Images._();

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }




  static Future<Image?> convertImages({required String path}) async {
    try {
      String base64String = await getFileData(path);

      final tempImg = Images.imageFromBase64String(base64String);
      return tempImg;
    } catch (e) {
      print('Exception convert Images');
    }
    return null;
  }

  static Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

    static Future<Image?> convertBase64({required String base64}) async {
    try {
      final tempImg = Images.imageFromBase64String(base64);
      return tempImg;
    } catch (e) {
      print('Exception convert Images');
    }
    return null;
  }
}

 