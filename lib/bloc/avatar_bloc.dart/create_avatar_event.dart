// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class AvatarEvent {}

class CreateAvatarEvent extends AvatarEvent {
  final BuildContext context;

  CreateAvatarEvent({required this.context});
}

class SendPromptInfo extends AvatarEvent {
  String prompt;
  String? userId;

  SendPromptInfo({
    required this.prompt,
    this.userId,
  });
}

class SendRatioInfo extends AvatarEvent {
  String imageWidth;
  String imageHeight;

  SendRatioInfo({
    required this.imageWidth,
    required this.imageHeight,
  });
}

class SendPremiumUserInfo extends AvatarEvent {
  String premiumUSer;

  SendPremiumUserInfo({
    required this.premiumUSer,
  });
}
