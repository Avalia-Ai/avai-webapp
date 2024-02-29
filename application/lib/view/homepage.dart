import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/shadows.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/widgets/search_bar.dart';
import 'package:avalia_ai/shared/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final test = [
      'aaaa',
      'bbbb',
      'cccc',
      'dddd',
      'eeee',
      'ffff',
      'gggg',
      'hhhh',
      'iiii',
      'jjjj',
      'kkkk',
      'llll',
      'mmmm',
      'nnnn',
      'oooo',
      'pppp',
      'qqqq',
      'rrrr',
      'ssss',
      'tttt',
      'uuuu',
      'vvvv',
      'wwww',
      'xxxx',
      'yyyy',
      'zzzz'
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
                          color: AVAIColors.darkRoyalBlue,
                          child: MediaQuery.of(context).size.width < 720
                              ? ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxHeight: 280),
                                  child: Image.asset(
                                    'assets/images/programmer.png',
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxHeight: 360),
                                  child: Image.asset(
                                    'assets/images/programmer.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: AVAINavigationButton(
                            onPressed: () => {},
                            menuButton: true,
                          ),
                        ),
                        Positioned(
                          bottom: -36,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              constraints: const BoxConstraints(
                                minWidth: 288,
                                maxWidth: 420,
                              ),
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 24,
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                color: AVAIColors.white100,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [AVAIShadows.blurShadow],
                              ),
                              child: Text(
                                'Ciência da Computação',
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
                          const SizedBox(height: 86),
                          Row(
                            children: [
                              const Expanded(
                                child: AVAISearchbar(),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 32,
                                height: 32,
                                color: AVAIColors.lightGrey,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          for (var test in test) ...[
                            const SizedBox(height: 12),
                            InkWell(
                              onTap: () => {
                                Navigator.pushNamed(context, '/professors/1'),
                              },
                              child: Container(
                                alignment: Alignment.center,
                                constraints:
                                    const BoxConstraints(minHeight: 72),
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
                                  style: AVAITextStyle().semiBoldContent,
                                ),
                              ),
                            ),
                          ],
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
