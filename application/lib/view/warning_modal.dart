import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/widgets/button.dart';
import 'package:avalia_ai/shared/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class WarningModal extends StatelessWidget {
  final String content;
  final String buttonLabel;
  final String title;
  final String imagePath;
  final double imageWidth;
  final bool closeButton;
  const WarningModal({
    Key? key,
    required this.content,
    required this.buttonLabel,
    required this.title,
    required this.imagePath,
    required this.imageWidth,
    this.closeButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AVAIColors.white100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                constraints: const BoxConstraints(
                    maxWidth: 420, maxHeight: 720, minHeight: 420),
                color: AVAIColors.white100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagePath,
                      width: imageWidth,
                    ),
                    Text(title),
                    Text(
                      content,
                      style: AVAITextStyle().content,
                    ),
                    AVAIButton(label: 'Ok', onPressed: () => {})
                  ],
                ),
              ),
              if (closeButton)
                Positioned(
                  top: 16,
                  left: 16,
                  child: AVAINavigationButton(
                    closeButton: true,
                    onPressed: () => {},
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
