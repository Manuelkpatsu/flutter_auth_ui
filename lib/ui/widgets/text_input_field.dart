import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/theme/custom_color.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final String label;

  const TextInputField({
    Key? key,
    required this.controller,
    required this.label,
    this.inputType,
    this.inputAction,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColor.greyTextColor, width: 0.5),
        ),
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: validator,
      textCapitalization: textCapitalization,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
    );
  }
}
