import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alartavatar/constants/texts.dart';

class RequestAvatarRepository {
  Future<dynamic> fetchImage(
    String prompt,
    String imageWidth,
    String imageHeight,
    BuildContext context,
  ) async {
    const baseUrl = TextConstant.apiStability;
    final url = Uri.parse(
        '$baseUrl/v1alpha/generation/stable-diffusion-512-v2-1/text-to-image');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': TextConstant.apiKeyStability,
        'Accept': 'image/png',
      },
      body: jsonEncode({
        'cfg_scale': 15,
        'clip_guidance_preset': 'FAST_BLUE',
        'height': 512,
        'width': 512,
        'samples': 1,
        'steps': 150,
        'seed': 0,
        'style_preset': "3d-model",
        'text_prompts': [
          {
            'text': prompt,
            'weight': 1,
          }
        ],
      }),
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      try {
        return response.bodyBytes;
      } on Exception {
        return ('Failed to generate imagess', context);
      }
    } else {
      return ('Failed to generate image', context);
    }
  }
}
