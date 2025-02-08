import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';
import 'package:guiago/presentation/home/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: GOColors.primaryColor),
        useMaterial3: true,
      ),
      home: const GuiaGo(),
    );
  }
}

class GuiaGo extends StatefulWidget {
  const GuiaGo({super.key});

  @override
  State<GuiaGo> createState() => _GuiaGoState();
}

class _GuiaGoState extends State<GuiaGo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GOColors.primaryColor,
      body: SafeArea(bottom: false, child: Home()),
    );
  }
}
