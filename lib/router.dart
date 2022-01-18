import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/ui/screens/check_email_screen.dart';
import 'package:flutter_auth_ui/ui/screens/forgot_password_screen.dart';
import 'package:flutter_auth_ui/ui/screens/home_screen.dart';
import 'package:flutter_auth_ui/ui/screens/login_screen.dart';
import 'package:flutter_auth_ui/ui/screens/register_screen.dart';
import 'package:flutter_auth_ui/ui/screens/reset_password_screen.dart';
import 'package:flutter_auth_ui/ui/screens/splash_screen.dart';
import 'package:flutter_auth_ui/ui/screens/verification_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case VerificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case CheckEmailScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CheckEmailScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
