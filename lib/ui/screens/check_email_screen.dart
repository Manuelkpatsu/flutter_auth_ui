import 'package:flutter/material.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image(),
              const SizedBox(height: 30),
              title(context),
              const SizedBox(height: 10),
              info(context),
              const SizedBox(height: 40),
              loginButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Image.asset(
      'assets/images/mail.png',
      width: 200,
      height: 150,
      fit: BoxFit.cover,
    );
  }

  Widget title(BuildContext context) {
    return Text(
      'Check your email',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget info(BuildContext context) {
    return Text(
      'We have sent you a reset password link on your registered email address.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Login'),
    );
  }
}
