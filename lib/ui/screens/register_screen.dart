import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/theme/custom_color.dart';
import 'package:flutter_auth_ui/ui/widgets/password_input_field.dart';
import 'package:flutter_auth_ui/ui/widgets/text_input_field.dart';
import 'package:flutter_auth_ui/utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  bool _showConfirmPassword = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  const SizedBox(height: 30),
                  title(),
                  const SizedBox(height: 30),
                  fullNameTextField(),
                  const SizedBox(height: 20),
                  emailTextField(),
                  const SizedBox(height: 20),
                  passwordTextField(),
                  const SizedBox(height: 20),
                  confirmPasswordTextField(),
                  const SizedBox(height: 50),
                  registerButton(),
                  const SizedBox(height: 30),
                  conditionsAndPolicy(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Register to Vermo',
        style: Theme.of(context).textTheme.headline1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget fullNameTextField() {
    return TextInputField(
      controller: fullNameController,
      inputAction: TextInputAction.next,
      inputType: TextInputType.name,
      validator: Validator.fullName,
      textCapitalization: TextCapitalization.words,
      label: 'Full Name',
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
      inputAction: TextInputAction.next,
      validator: Validator.password,
      obscureText: _showPassword,
      toggle: () => setState(() => _showPassword = !_showPassword),
      label: 'Password',
    );
  }

  Widget confirmPasswordTextField() {
    return PasswordInputField(
      controller: confirmPasswordController,
      inputAction: TextInputAction.done,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Please confirm password';
        }

        if (passwordController.text != confirmPasswordController.text) {
          return "Passwords do not match";
        }

        return null;
      },
      obscureText: _showConfirmPassword,
      toggle: () =>
          setState(() => _showConfirmPassword = !_showConfirmPassword),
      label: 'Confirm Password',
    );
  }

  Widget registerButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Register'),
    );
  }

  Widget conditionsAndPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By registering, you agree to ',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14,
            ),
        children: [
          TextSpan(
            text: 'Terms & Conditions ',
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: CustomColor.primaryColor,
                  fontSize: 14,
                ),
          ),
          const TextSpan(
            text: 'and ',
          ),
          TextSpan(
            text: 'Privacy Policy ',
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: CustomColor.primaryColor,
                  fontSize: 14,
                ),
          ),
          const TextSpan(
            text: 'of Vermo',
          ),
        ],
      ),
    );
  }
}
