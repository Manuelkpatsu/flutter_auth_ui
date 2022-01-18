import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/theme/custom_theme.dart';
import 'package:flutter_auth_ui/ui/screens/check_email_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      home: const CheckEmailScreen(),
    );
  }
}
