import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:alartavatar/hive/avatar_save_model.dart';
import 'package:alartavatar/view/home/home_screen.dart';

base mixin HomeScreenMixin on State<HomeScreen> {
  late Box<AvatarSave> _avatartsBox;
  List<AvatarSave> _avatars = [];

  List<AvatarSave> get avatar => _avatars;

  @override
  void initState() {
    super.initState();
    _avatartsBox = Hive.box<AvatarSave>('avatars');
    _avatars = _avatartsBox.values.toList();
  }
}
