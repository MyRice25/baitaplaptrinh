import 'package:flutter/material.dart';
import 'package:testflutter/screens/cooking/home_page.dart';
import 'package:testflutter/widgets/cooking/boder_curved_container.dart';
import 'package:testflutter/widgets/cooking/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: CurvedContainer()),
          const SizedBox(height: 32),
          const Text(
            "Complete your\ngrocery need\neasily",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: "Get Started",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
