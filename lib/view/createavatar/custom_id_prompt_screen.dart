import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAvatarIDPromptScreen extends StatelessWidget {
  const CustomAvatarIDPromptScreen({
    super.key,
    required this.title,
    required this.hintText,
    required this.formHintText,
    required this.submitCallback,
  });

  final String title;
  final String hintText;
  final String formHintText;
  final Function(String) submitCallback;

  @override
  Widget build(BuildContext context) {
    late String userInput;

    final formKey = GlobalKey<FormState>();

    void submitForm() {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        submitCallback(userInput);
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        'images/homeimage.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    formHintText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF2A2A2A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF2A2A2A),
                            title: const Text(
                              'Oops!',
                              style: TextStyle(color: Colors.white),
                            ),
                            content: const Text(
                              'Cannot be left blank',
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              Center(
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    'Okay',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                        return 'Cannot be left blank';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      userInput = newValue!;
                    },
                    onFieldSubmitted: (_) => submitForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
