import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/presentation/theme/app_theme.dart';
import 'package:guiago/presentation/home/views/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      body: SafeArea(
        bottom: false,
        child: Consumer(
          builder: (context, ref, child) {
            final connectivityState = ref.watch(connectivityProvider);

            return connectivityState.when(
              data: (data) {
                return Home();
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
