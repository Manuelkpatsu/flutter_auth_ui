import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/ui/widgets/text_input_field.dart';
import 'package:flutter_auth_ui/utils/validator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
              emailTextField(),
              const SizedBox(height: 50),
              recoverPasswordButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Forgot Password',
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget info() {
    return Text(
      'Please enter your registered email to reset your password.',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget emailTextField() {
    return TextInputField(
      controller: emailController,
      inputAction: TextInputAction.done,
      inputType: TextInputType.emailAddress,
      validator: Validator.email,
      label: 'Email',
    );
  }

  Widget recoverPasswordButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Recover Password'),
    );
  }
}
