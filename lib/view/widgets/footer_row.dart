import 'package:flutter/material.dart';
import 'package:alartavatar/constants/texts.dart';
import 'package:alartavatar/view/webview_screen.dart';

class FooterRow extends StatelessWidget {
  const FooterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            print("privacy_policy");

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WebViewScreen(
                        webUrl:
                            "https://flutter.github.io/news_toolkit/flutter_development/privacy_policy/")));
          },
          child: const Text(
            TextConstant.inappPagePrivacyPolicy,
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                fontSize: 12),
          ),
        ),
        TextButton(
          onPressed: () {
            print("inappPageRestorePurchase");

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const WebViewScreen(webUrl: "https://flutter.dev/")));
          },
          child: const Text(
            TextConstant.inappPageRestorePurchase,
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                fontSize: 12),
          ),
        ),
        TextButton(
          onPressed: () {
            print("inappPageTermsofUse");

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WebViewScreen(
                        webUrl: "https://docs.flutter.dev/tos")));
          },
          child: const Text(
            TextConstant.inappPageTermsofUse,
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                fontSize: 12),
          ),
        ),
      ],
    );
  }
}
