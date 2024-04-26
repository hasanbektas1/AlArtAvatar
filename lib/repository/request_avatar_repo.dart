import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestAvatarRepository {
  String imageUrl = '';

  Future<dynamic> fetchImage(
    String prompt,
    String imageWidth,
    String imageHeight,
    BuildContext context,
  ) async {
    var url = Uri.parse('https://api.dezgo.com/text2image');
    var headers = {
      'X-Dezgo-Key': 'DEZGO-YOUR-API-KEY',
      'Content-Type': 'application/json',
      'Accept': 'image/png'
    };

    var body = {
      'width': imageWidth,
      'height': imageHeight,
      'prompt': prompt,
      'model': 'realdream_12',
    };

    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print(response.statusCode);
      print("response.statusCode-----");
      imageUrl = 'data:image/png;base64,${base64Encode(response.bodyBytes)}';
      print(imageUrl);
      return response.bodyBytes;
    } else {
      print('Failed to load image: ${response.statusCode}');
    }
  }
}
