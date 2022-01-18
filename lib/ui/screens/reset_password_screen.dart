import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/ui/screens/check_email_screen.dart';
import 'package:flutter_auth_ui/ui/widgets/password_input_field.dart';
import 'package:flutter_auth_ui/utils/validator.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/reset_password';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  bool _showConfirmPassword = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              title(),
              const SizedBox(height: 10),
              info(),
              const SizedBox(height: 50),
              passwordTextField(),
              const SizedBox(height: 20),
              confirmPasswordTextField(),
              const SizedBox(height: 50),
              updatePasswordButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Reset Password',
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget info() {
    return Text(
      'Please enter your new password and confirm the password.',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget passwordTextField() {
    return PasswordInputField(
      controller: newPasswordController,
      inputAction: TextInputAction.next,
      validator: Validator.password,
      obscureText: _showPassword,
      toggle: () => setState(() => _showPassword = !_showPassword),
      label: 'New Password',
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

        if (newPasswordController.text != confirmPasswordController.text) {
          return "Passwords do not match";
        }

        return null;
      },
      obscureText: _showConfirmPassword,
      toggle: () =>
          setState(() => _showConfirmPassword = !_showConfirmPassword),
      label: 'Confirm New Password',
    );
  }

  Widget updatePasswordButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, CheckEmailScreen.routeName);
        }
      },
      child: const Text('Update'),
    );
  }
}
