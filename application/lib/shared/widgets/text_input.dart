import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:flutter/services.dart';

// Text Input
class AVAITextInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPasswordField;
  final bool allowNumbers;
  final bool allowSpecialCharacters;
  final bool allowSpaces;
  final String? Function(String?)? validatorFunction;
  final void Function(dynamic value)? onChanged;
  final TextEditingController? textEditingController;
  const AVAITextInput({
    super.key,
    this.label = '',
    required this.placeholder,
    this.isPasswordField = false,
    this.allowNumbers = true,
    this.allowSpecialCharacters = true,
    this.allowSpaces = true,
    this.validatorFunction,
    this.onChanged,
    this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            textAlign: TextAlign.start,
            style: AVAITextStyle().label,
          ),
          const SizedBox(height: 4)
        ],
        TextFormField(
          validator: validatorFunction,
          obscureText: isPasswordField,
          onChanged: onChanged,
          controller: textEditingController,
          inputFormatters: [
            CustomTextInputFormatter(
              allowNumbers: allowNumbers,
              allowSpecialCharacters: allowSpecialCharacters,
              allowSpaces: allowSpaces,
            ),
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: AVAIColors.white30,
            labelText: placeholder,
            labelStyle: AVAITextStyle(color: AVAIColors.grey).placeholder,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            errorStyle: const TextStyle(color: Colors.green),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AVAIColors.white20,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AVAIColors.white20,
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: isPasswordField
                ? IconButton(
                    // TODO: show and hide password
                    onPressed: () => {},
                    icon: const Icon(Icons.visibility),
                    color: AVAIColors.lightGrey,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

// Input Fomratter
class CustomTextInputFormatter extends TextInputFormatter {
  final bool allowNumbers;
  final bool allowSpecialCharacters;
  final bool allowSpaces;

  CustomTextInputFormatter({
    this.allowNumbers = true,
    this.allowSpecialCharacters = true,
    this.allowSpaces = true,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (!allowNumbers) {
      newText = newText.replaceAll(RegExp(r'[0-9]'), '');
    }

    if (!allowSpecialCharacters) {
      newText =
          newText.replaceAll(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%$]'), '');
    }

    if (!allowSpaces) {
      newText = newText.replaceAll(RegExp(r' '), '');
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
