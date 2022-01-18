import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/theme/custom_color.dart';
import 'package:flutter_auth_ui/ui/screens/forgot_password_screen.dart';
import 'package:flutter_auth_ui/ui/screens/home_screen.dart';
import 'package:flutter_auth_ui/ui/screens/register_screen.dart';
import 'package:flutter_auth_ui/ui/widgets/password_input_field.dart';
import 'package:flutter_auth_ui/ui/widgets/text_input_field.dart';
import 'package:flutter_auth_ui/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _showPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  logo(),
                  title(),
                  const SizedBox(height: 50),
                  socialLogins(),
                  const SizedBox(height: 20),
                  orText(),
                  const SizedBox(height: 20),
                  emailTextField(),
                  const SizedBox(height: 20),
                  passwordTextField(),
                  const SizedBox(height: 15),
                  forgotPassword(),
                  const SizedBox(height: 30),
                  loginButton(),
                  const SizedBox(height: 30),
                  createAccount(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Image.asset(
      'assets/images/logo.png',
      height: 70,
      width: 80,
      fit: BoxFit.cover,
    );
  }

  Widget title() {
    return Text(
      'Vermo',
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget socialLogins() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        facebookLoginButton(),
        const SizedBox(width: 10),
        googleLoginButton(),
      ],
    );
  }

  Widget facebookLoginButton() {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: CustomColor.blackTextColor,
          side: const BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/facebook.png',
              height: 16,
              width: 16,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            const Text('Facebook'),
          ],
        ),
      ),
    );
  }

  Widget googleLoginButton() {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: CustomColor.blackTextColor,
          side: const BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              height: 16,
              width: 16,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            const Text('Google'),
          ],
        ),
      ),
    );
  }

  Widget orText() {
    return Text(
      'or',
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget emailTextField() {
    return TextInputField(
      controller: emailController,
      inputAction: TextInputAction.next,
      inputType: TextInputType.emailAddress,
      validator: Validator.email,
      label: 'Email',
    );
  }

  Widget passwordTextField() {
    return PasswordInputField(
      controller: passwordController,
      inputAction: TextInputAction.done,
      validator: Validator.password,
      obscureText: _showPassword,
      toggle: () => setState(() => _showPassword = !_showPassword),
      label: 'Password',
    );
  }

  Widget forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
        },
        child: Text(
          'Forgot Password?',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CustomColor.primaryColor,
              ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        }
      },
      child: const Text('Login'),
    );
  }

  Widget createAccount() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Don\'t have an account? ',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
        children: [
          WidgetSpan(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              child: Text(
                'Register Now',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: CustomColor.primaryColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
