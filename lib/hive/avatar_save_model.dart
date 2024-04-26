// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
part 'avatar_adapter.g.dart';

@HiveType(typeId: 1)
class AvatarSave {
  @HiveField(0)
  String userName;

  @HiveField(1)
  String userPrompt;

  @HiveField(2)
  dynamic userPromptImage;

  AvatarSave({
    required this.userName,
    required this.userPrompt,
    required this.userPromptImage,
  });
}
