import 'package:flutter/material.dart';
import 'package:avalia_ai/shared/styles/colors.dart';

// This navigation button can be used as back button, menu button or as
// close button, defined by backButton, menuButton and closeButton.
// Define only one as true at a time to avoid unexpected behavior.
class AVAINavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool backButton;
  final bool menuButton;
  final bool closeButton;
  const AVAINavigationButton({
    super.key,
    required this.onPressed,
    this.backButton = false,
    this.menuButton = false,
    this.closeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (backButton) {
      icon = Icons.arrow_back;
    } else if (menuButton) {
      icon = Icons.menu;
    } else {
      icon = Icons.close;
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AVAIColors.white100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AVAIColors.lightGrey),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 24,
            color: AVAIColors.royalBlue,
          ),
        ),
      ),
    );
  }
}
