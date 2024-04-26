/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_finish_1/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:neo_finish_1/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:neo_finish_1/view/createavatar/create_prompt_screen.dart';

class CreateAvatar extends StatefulWidget {
  const CreateAvatar({Key? key}) : super(key: key);

  @override
  State<CreateAvatar> createState() => _CreateAvatarState();
}

class _CreateAvatarState extends State<CreateAvatar> {
  late String _newPrompt;

  @override
  Widget build(BuildContext context) {
    final avatarBloc = BlocProvider.of<AvatarBloc>(context);
    _newPrompt = avatarBloc.promptbloc;

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Create",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            avatarBloc.userIDname,
            style: const TextStyle(color: Colors.white),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: TextFormField(
                maxLines: 5,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: avatarBloc.promptbloc,
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be left empty';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _newPrompt = newValue!;
                },
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF33DB23),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }

                context.read<AvatarBloc>().add(SendPromptInfo(
                    prompt: _newPrompt, userId: avatarBloc.userIDname));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePromptScreen()));
              },
              child: const SizedBox(
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create New Avatar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */