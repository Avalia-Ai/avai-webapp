import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AVAISearchbar extends StatelessWidget {
  const AVAISearchbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 243, 243, 243),
          labelText: 'Pesquise por disciplina,',
          labelStyle: AVAITextStyle(color: AVAIColors.grey).placeholder,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: AVAIColors.white20,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: AVAIColors.white20,
              width: 1,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search),
            color: AVAIColors.darkGrey,
          )),
    );
  }
}
