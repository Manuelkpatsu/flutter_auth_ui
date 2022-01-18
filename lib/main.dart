import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/router.dart';
import 'package:flutter_auth_ui/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
