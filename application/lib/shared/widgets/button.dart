import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/view/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:avalia_ai/shared/styles/colors.dart';

class AVAIButton extends StatelessWidget {
  final bool secondary;
  final String label;
  final VoidCallback onPressed;
  final AuthModel? authModel;
  const AVAIButton(
      {super.key,
      this.secondary = false,
      required this.label,
      required this.onPressed,
      this.authModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: secondary ? AVAIColors.white50 : AVAIColors.royalBlue,
          border: secondary ? Border.all(color: AVAIColors.royalBlue) : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style:
              // TODO: Change the textSTyle to AVAITextStyle.label
              AVAITextStyle(
            color: secondary ? AVAIColors.royalBlue : AVAIColors.white100,
          ).action,
        ),
      ),
    );
  }
}
