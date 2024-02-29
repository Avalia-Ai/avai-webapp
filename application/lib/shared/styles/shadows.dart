import 'package:flutter/material.dart';
import 'package:avalia_ai/shared/styles/colors.dart';

class AVAIShadows {
  AVAIShadows._();

  static BoxShadow blurShadow = BoxShadow(
    color: AVAIColors.lightGrey,
    blurRadius: 50,
    offset: const Offset(0, 4),
  );

  static BoxShadow lightShadow = BoxShadow(
    color: AVAIColors.lightGrey,
    blurRadius: 4,
    offset: const Offset(0, 4),
  );
}
