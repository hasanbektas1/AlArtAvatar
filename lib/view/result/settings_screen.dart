import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatarBloc = BlocProvider.of<AvatarBloc>(context);
    print(avatarBloc.premiumUser);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (avatarBloc.premiumUser != "1")
              _buildSettingsItem(context, "Try Premium"),
            _buildSettingsItem(context, "Restore Purchase"),
            _buildSettingsItem(context, "Privacy Policy"),
            _buildSettingsItem(context, "Terms of Use"),
            _buildSettingsItem(context, "Rate Us"),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {
          print('$title click');
        },
      ),
    );
  }
}
