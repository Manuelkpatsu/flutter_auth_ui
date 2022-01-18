import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/theme/custom_color.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final bool? obscureText;
  final VoidCallback? toggle;
  final String label;

  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.label,
    this.inputType,
    this.inputAction,
    this.validator,
    this.obscureText,
    this.toggle,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        suffixIcon: IconButton(
          color: CustomColor.greyTextColor,
          icon: obscureText!
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: toggle,
        ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureText!,
      obscuringCharacter: '*',
      validator: validator,
      textCapitalization: textCapitalization,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
    );
  }
}
