import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:alartavatar/constants/texts.dart';
import 'package:alartavatar/view/home/home_screen.dart';
import 'package:alartavatar/view/inapp/inapp_screen_second.dart';
import 'package:alartavatar/view/widgets/footer_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InappScreen extends StatelessWidget {
  const InappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final avatarBloc = BlocProvider.of<AvatarBloc>(context);

    void changeIsOpen() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isOpen', true);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: screenHeight * 0.85,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      TextConstant.inappPage1Image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        if (avatarBloc.premiumUser == "1") {
                          context
                              .read<AvatarBloc>()
                              .add(SendPremiumUserInfo(premiumUSer: "0"));
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        } else {
                          print("nulllll");
                        }
                      },
                      color: Colors.white,
                      iconSize: 35,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            TextConstant.inappPagetitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 27),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                      TextConstant.inappPage1IconInfinity,
                                      width: 25,
                                      height: 25),
                                  const SizedBox(height: 3),
                                  Image.asset(TextConstant.inappPage1IconGroup,
                                      width: 24, height: 24),
                                  const SizedBox(height: 3),
                                  Image.asset(TextConstant.inappPage1IconGroup2,
                                      width: 24, height: 24),
                                ],
                              ),
                              const SizedBox(width: 20),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TextConstant.inappPageInfoText,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    TextConstant.inappPageInfo1Text,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    TextConstant.inappPageInfo2Text,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            children: [
                              Center(
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.green,
                                        Colors.green,
                                        Colors.black,
                                        Colors.black
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 5),
                                        borderRadius: BorderRadius.circular(41),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.green,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(19),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    TextConstant
                                                        .inappPageInfoPaymentText,
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    TextConstant
                                                        .inappPageInfoPayment1Text,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                TextConstant
                                                    .inappPageInfoPayment2Text,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 60,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.green,
                                                width: 1,
                                              ),
                                              color: Colors.green,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(19),
                                                bottomLeft: Radius.circular(19),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 2),
                                              child: Text(
                                                TextConstant
                                                    .inappPageInfoPayment3Text,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            TextConstant.inappPageInfoPayment4Text,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  if (avatarBloc.premiumUser == "0") {
                    changeIsOpen();
                    context
                        .read<AvatarBloc>()
                        .add(SendPremiumUserInfo(premiumUSer: "1"));

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InappScreenSecond(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF33DB23),
                ),
                child: SizedBox(
                  height: screenHeight * 0.08,
                  child: Center(
                    child: Text(
                      avatarBloc.premiumUser == "1"
                          ? TextConstant.inappButtonText
                          : "Premium",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const FooterRow(),
          ],
        ),
      ),
    );
  }
}
