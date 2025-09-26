import 'package:flutter/material.dart';
import 'package:testflutter/screens/cooking/onboarding_page.dart';
import 'package:testflutter/screens/store/explore_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // đổi màn hình của từng class ở đây
      home: OnboardingPage(),
    );
  }
}
