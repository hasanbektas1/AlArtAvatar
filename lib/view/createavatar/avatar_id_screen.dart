import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:alartavatar/view/createavatar/avatar_prompt_screen.dart';
import 'package:alartavatar/view/createavatar/custom_id_prompt_screen.dart';

class AvatarIDscreen extends StatelessWidget {
  const AvatarIDscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAvatarIDPromptScreen(
      title: 'Type your avatar ID',
      hintText: 'Name',
      formHintText: 'What will you call your avatar?',
      submitCallback: (String userName) {
        print('Kullanıcı adı: $userName');

        context
            .read<AvatarBloc>()
            .add(SendPromptInfo(prompt: "", userId: userName));

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AvatarPromptScreen()),
        );
      },
    );
  }
}
