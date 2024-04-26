import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:alartavatar/view/result/result_screen.dart';
import 'package:alartavatar/view/widgets/aspect_ratio_selection.dart';
import 'package:alartavatar/view/widgets/next_button.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  late String userName;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final avatarBloc = BlocProvider.of<AvatarBloc>(context);
    void submitForm() {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        context.read<AvatarBloc>().add(
            SendPromptInfo(prompt: userName, userId: avatarBloc.userIDname));
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          "Create",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: TextFormField(
                  maxLines: 4,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: avatarBloc.promptbloc,
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Cannot be left blank';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    userName = newValue!;
                  },
                  onFieldSubmitted: (_) => submitForm(),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _toggleExpand,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 10),
                    child: Row(
                      children: [
                        const Text(
                          'Prompt Suggestions',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          _isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 32,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isExpanded ? 150 : 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: const Color(0xFF2A2A2A),
                      child: _isExpanded
                          ? ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildButton('Suggestion1'),
                                    _buildButton('Suggestion2 '),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildButton('Suggestion3'),
                                    _buildButton('Suggestion4'),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildButton('Suggestion5'),
                                    _buildButton('Suggestion6'),
                                  ],
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Choose Aspect Ratio:",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AspectRatioOption(
                      ratio: '1:1',
                      width: 40,
                      height: 40,
                    ),
                    AspectRatioOption(
                      ratio: '3:2',
                      width: 40,
                      height: 20,
                    ),
                    AspectRatioOption(
                      ratio: '2:3',
                      width: 20,
                      height: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<AvatarBloc>()
                          .add(CreateAvatarEvent(context: context));

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF33DB23),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const NextButton(buttonText: "Create More")),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ElevatedButton(
          onPressed: () {
            print(buttonText);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF404040),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              )),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
