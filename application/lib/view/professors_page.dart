import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/shadows.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class ProfessorsPage extends StatelessWidget {
  String subjectId;
  ProfessorsPage({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    print(subjectId);
    final test = [
      'professor 1',
      'professor 2',
      'professor 3',
      'professor 4',
      'professor 5',
      'professor 6',
      'professor 7',
    ];
    return Scaffold(
      backgroundColor: AVAIColors.white50,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160,
                          color: AVAIColors.darkRoyalBlue,
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: AVAINavigationButton(
                            backButton: true,
                            onPressed: () => {Navigator.pop(context)},
                          ),
                        ),
                        Positioned(
                          bottom: -36,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 288, maxWidth: 420),
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: AVAIColors.white100,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [AVAIShadows.blurShadow],
                              ),
                              child: Text(
                                'Nome da disciplina',
                                textAlign: TextAlign.center,
                                style:
                                    AVAITextStyle(color: AVAIColors.royalBlue)
                                        .title,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 560,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          const SizedBox(height: 72),
                          for (var test in test)
                            Container(
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(minHeight: 68),
                              margin: const EdgeInsets.only(top: 12),
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              decoration: BoxDecoration(
                                color: AVAIColors.white100,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [AVAIShadows.lightShadow],
                              ),
                              child: Text(
                                test,
                                textAlign: TextAlign.center,
                                style: AVAITextStyle().boldContent,
                              ),
                            ),
                          const SizedBox(height: 72),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
