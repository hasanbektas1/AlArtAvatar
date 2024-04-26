import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/hive/avatar_save_model.dart';

import 'package:alartavatar/repository/request_avatar_repo.dart';
import 'package:alartavatar/view/home/home_screen.dart';
import 'package:alartavatar/view/onboarding/onboarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isOpen = prefs.getBool('isOpen') ?? false;

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(AvatarAdapter());

  await Hive.openBox<AvatarSave>('avatars');

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AvatarBloc>(
            create: (context) =>
                AvatarBloc(articleRepository: RequestAvatarRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isOpen ? const HomeScreen() : OnboardingPapes(),
      )));
}
