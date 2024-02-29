import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/shadows.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/widgets/button.dart';
import 'package:avalia_ai/api.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          color: AVAIColors.darkRoyalBlue,
                          child: Image.asset(
                            'assets/images/main.png',
                            height: 280,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          bottom: -36,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 120,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 16),
                              decoration: BoxDecoration(
                                color: AVAIColors.white100,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [AVAIShadows.blurShadow],
                              ),
                              child: Image.asset(
                                'assets/images/avai_logo.png',
                                width: 80,
                                height: 70,
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 560,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 72),
                          Text(
                            'Centralize sua experiência acadêmica: descubra, consulte e avalie disciplinas e professores em um único lugar',
                            textAlign: TextAlign.center,
                            style: AVAITextStyle(color: AVAIColors.royalBlue)
                                .content,
                          ),
                          const SizedBox(height: 24),
                          AVAIButton(
                            label: 'Criar conta',
                            onPressed: () async {
                              Navigator.pushNamed(context, '/auth/register');
                              await fetchSubjects();
                            },
                          ),
                          const SizedBox(height: 12),
                          AVAIButton(
                            label: 'Entrar',
                            secondary: true,
                            onPressed: () =>
                                {Navigator.pushNamed(context, '/auth/login')},
                          ),
                          const SizedBox(height: 48),
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
