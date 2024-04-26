import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_state.dart';
import 'package:alartavatar/functions/share_social_media.dart';
import 'package:alartavatar/functions/save_image_gallery.dart';
import 'package:alartavatar/hive/avatar_save_model.dart';
import 'package:alartavatar/view/createavatar/avatar_id_screen.dart';
import 'package:alartavatar/view/home/home_screen.dart';
import 'package:alartavatar/view/inapp/inapp_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SaveImageGalleryMixin, ShowSocialMediaModalMixin {
  late Box<AvatarSave> _avatarsBox;
  List<AvatarSave> _avatars = [];

  late String newPrompt;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _avatarsBox = Hive.box<AvatarSave>('avatars');
    _avatars = _avatarsBox.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    final avatarBloc = BlocProvider.of<AvatarBloc>(context);

    print("Oranllar");
    print(avatarBloc.imageHeight);
    print(avatarBloc.imageWidth);

    return WillPopScope(
      onWillPop: () async {
        bool closeApp = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xFF2A2A2A),
            title: const Text(
              'Would you like to exit the application?',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'Okay',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );

        return closeApp;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  onPressed: () {
                    showSocialMediaModal(context);
                    print(avatarBloc.premiumUser);
                  },
                  icon: const Icon(
                    Icons.ios_share,
                    size: 30,
                    color: Colors.white,
                  )),
            ],
          ),
          backgroundColor: Colors.black,
          body:
              BlocBuilder<AvatarBloc, AvatarState>(builder: ((context, state) {
            if (state is AvatarLoading) {
              print(state);
              print("AvatarLoading");
              return const Center(
                child: SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(color: Colors.white)),
              );
            }

            if (state is AvatarLoaded) {
              print("usernamee");
              print(avatarBloc.userIDname);

              print("Kayıt");
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: state.image != null
                                ? Image.memory(
                                    state.image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'images/onboardingimage1.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Avatar ID: ${avatarBloc.userIDname}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(height: 20),
                        Form(
                            key: formKey,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A2A2A),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: TextFormField(
                                  maxLines: 3,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: avatarBloc.promptbloc,
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Cannot be left blank';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    newPrompt = newValue!;
                                    print("newPrompt");
                                    print(newPrompt);
                                  },
                                  onFieldSubmitted: (_) {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      context.read<AvatarBloc>().add(
                                          SendPromptInfo(
                                              prompt: newPrompt,
                                              userId: avatarBloc.userIDname));
                                    }
                                  }),
                            )),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF33DB23),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {
                                  if (avatarBloc.premiumUser == "0") {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor:
                                            const Color(0xFF2A2A2A),
                                        title: const Text(
                                          'Oops! Your chance is over.',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        content: const Text(
                                          'Upgrade to premium.',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        actions: [
                                          Center(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const InappScreen()));
                                              },
                                              child: const Text(
                                                'Okay',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    print("kayıt image");

                                    saveImageGalley(state.image);
                                    _addAvatar(avatarBloc.userIDname,
                                        avatarBloc.promptbloc, state.image);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    );
                                  }
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.save_alt,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Save",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0C0C0C),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    setState(() {});

                                    if (avatarBloc.premiumUser == "0") {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor:
                                              const Color(0xFF2A2A2A),
                                          title: const Text(
                                            'Oops! Your chance is over.',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          content: const Text(
                                            'Upgrade to premium.',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          actions: [
                                            Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const InappScreen()));
                                                },
                                                child: const Text(
                                                  'Okay',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      context
                                          .read<AvatarBloc>()
                                          .add(SendPromptInfo(
                                            prompt: avatarBloc.promptbloc,
                                            userId: avatarBloc.userIDname,
                                          ));
                                      print("avatarBloc.promptbloc");
                                      print(avatarBloc.promptbloc);

                                      context.read<AvatarBloc>().add(
                                          CreateAvatarEvent(context: context));
                                    }
                                  }
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Refresh",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              );
            } else {
              return Center(
                child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: const Color(0xFF2A2A2A),
                          title: const Text(
                            'Oops!',
                            style: TextStyle(color: Colors.white),
                          ),
                          content: const Text(
                            'Try Again',
                            style: TextStyle(color: Colors.white),
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AvatarIDscreen()));
                                },
                                child: const Text(
                                  'Okay',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text("Try Again")),
              );
            }
          }))),
    );
  }

  void _addAvatar(String name, String prompt, dynamic image) {
    final newTask = AvatarSave(
      userName: name,
      userPrompt: prompt,
      userPromptImage: image,
    );

    _avatarsBox.put(newTask.userName, newTask);
    _avatars.add(newTask);
  }
}
