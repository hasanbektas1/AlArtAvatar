import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:alartavatar/constants/texts.dart';
import 'package:alartavatar/view/home/home_screen.dart';
import 'package:alartavatar/view/widgets/footer_row.dart';

class InappScreenSecond extends StatelessWidget {
  const InappScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
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
                          },
                          color: Colors.white,
                          iconSize: 35,
                        ),
                        const SizedBox(width: 10)
                      ],
                    ),
                    const Text(
                      TextConstant.inappPageSecondTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      TextConstant.inappPageSecondSubTitle,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      TextConstant.inappPageSecondInfoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.green, width: 5),
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
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF171717),
                                          border: Border.all(
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(19),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              TextConstant
                                                  .inappPageSecondInfoPayment,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              TextConstant
                                                  .inappPageSecondIConText,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.w900),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
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
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: TextConstant
                                                            .inappPageSecondInfo1Payment,
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: TextConstant
                                                            .inappPageSecondInfoPrice,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              TextConstant
                                                  .inappPageSecondICon2Text,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.w900),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF171717),
                                          border: Border.all(
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(19),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              TextConstant
                                                  .inappPageSecondInfoPayment2,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              TextConstant
                                                  .inappPageSecondICon3Text,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.w900),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 99,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 1,
                                        ),
                                        color: Colors.green,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(19),
                                          bottomLeft: Radius.circular(19),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        child: Text(
                                          TextConstant.inappPageSecondTopTitle,
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
                    const Text(
                      TextConstant.inappPageSecondInfoSubscription,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      TextConstant.inappPageSecondSeePlans,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF2A2A2A),
                      title: const Text(
                        'Oops! Payment not made',
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
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF33DB23),
                ),
                child: SizedBox(
                  height: screenHeight * 0.08,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TextConstant.inappButtonText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const FooterRow(),
          ],
        ),
      ),
    );
  }
}
