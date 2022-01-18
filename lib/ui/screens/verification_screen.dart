import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/theme/custom_color.dart';
import 'package:flutter_auth_ui/ui/screens/home_screen.dart';
import 'package:flutter_auth_ui/utils/validator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = '/verification';

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              title(),
              const SizedBox(height: 50),
              pinCodeTextField(),
              const SizedBox(height: 50),
              verifyButton(),
              const SizedBox(height: 40),
              resendCode(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return RichText(
      text: TextSpan(
        text: 'Enter the 4 digit code sent to ',
        style: Theme.of(context).textTheme.headline1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text: 'test@gmail.com',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: CustomColor.primaryColor,
                ),
          ),
        ],
      ),
    );
  }

  Widget pinCodeTextField() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: PinCodeTextField(
        appContext: context,
        controller: codeController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        length: 4,
        cursorColor: CustomColor.primaryColor,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          inactiveColor: CustomColor.greyTextColor,
          activeColor: CustomColor.primaryColor,
          selectedColor: CustomColor.primaryColor,
        ),
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
        onChanged: (value) {
          setState(() {
            codeController.text = value;
          });
        },
        validator: Validator.code,
      ),
    );
  }

  Widget verifyButton() {
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
      child: const Text('Verify'),
    );
  }

  Widget resendCode() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Didn't receive a verification code? ",
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14,
            ),
        children: [
          TextSpan(
            text: "Resend code",
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: CustomColor.primaryColor,
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }
}
