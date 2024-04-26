import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:alartavatar/view/createavatar/create_prompt_screen.dart';
import 'package:alartavatar/view/createavatar/custom_id_prompt_screen.dart';

class AvatarPromptScreen extends StatelessWidget {
  const AvatarPromptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatarBloc = BlocProvider.of<AvatarBloc>(context);

    return CustomAvatarIDPromptScreen(
      title: 'Type your avatar prompt',
      hintText: 'create and image...',
      formHintText: 'How do you want your avatar looks like?',
      submitCallback: (String userPrompt) {
        print('Kullanıcı prompt: $userPrompt');

        context.read<AvatarBloc>().add(SendPromptInfo(
              prompt: userPrompt,
              userId: avatarBloc.userIDname,
            ));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreatePromptScreen()),
        );
      },
    );
  }
}
