import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/shadows.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/widgets/dropdown.dart';
import 'package:avalia_ai/shared/widgets/navigation_button.dart';
import 'package:avalia_ai/view/warning_modal.dart';
import 'package:flutter/material.dart';

class EvaluationsPage extends StatelessWidget {
  const EvaluationsPage({super.key});

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
                              child: Column(
                                children: [
                                  Text(
                                    'Nome da disciplina',
                                    textAlign: TextAlign.center,
                                    style: AVAITextStyle(
                                            color: AVAIColors.royalBlue)
                                        .semiBoldContent,
                                  ),
                                  Text(
                                    'Nome do docente',
                                    textAlign: TextAlign.center,
                                    style: AVAITextStyle(
                                            color: AVAIColors.royalBlue)
                                        .content,
                                  ),
                                ],
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
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: AVAIDropdown(
                                  smallDropdown: true,
                                  label: '',
                                  placeholder: '',
                                  options: const [
                                    '2024-1',
                                    '2023-2',
                                    '2023-1',
                                    '2022-2',
                                    '2022-1',
                                    '2021-2',
                                    '2021-1',
                                    '2020-2',
                                    '2020-1',
                                    '2019-2',
                                    '2019-1',
                                    '2018-2',
                                    '2018-1',
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select an option';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 72),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const WarningModal(
                                    title: 'Atenção',
                                    content:
                                        'Esta ferramenta não tem o intuito de avaliar o docente de maneira pessoal. Faça uso somente para avaliar a disciplina ministrada pelo professor. Utilize o campo de comentários de maneira gentil para descrever como foi a disciplina durante o período letivo.',
                                    buttonLabel: 'Ok',
                                    imagePath: 'assets/images/message_sent.png',
                                    imageWidth: 360,
                                    closeButton: true,
                                  );
                                },
                              );
                            },
                            child: const Text('aaaa'),
                          ),
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
