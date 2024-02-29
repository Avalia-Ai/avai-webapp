import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/shadows.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/widgets/button.dart';
import 'package:avalia_ai/shared/widgets/dropdown.dart';
import 'package:avalia_ai/shared/widgets/navigation_button.dart';
import 'package:avalia_ai/shared/widgets/text_input.dart';
import 'package:avalia_ai/view/warning_modal.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                            closeButton: true,
                            onPressed: () => {
                              Navigator.pop(context),
                            },
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
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Informações gerais',
                                  style: AVAITextStyle().title,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Em qual período você cursou essa disciplina com esse professor?',
                                  style: AVAITextStyle().content,
                                ),
                                const SizedBox(height: 8),
                                AVAIDropdown(
                                  label: '',
                                  placeholder: 'Período',
                                  options: const ['1', '2', '3', '4', '5', '6'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select an option';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 42),
                                Text(
                                  'Avaliações e conteúdo',
                                  style: AVAITextStyle().title,
                                ),
                                const SizedBox(height: 40),
                                AVAIButton(
                                  label: 'Enviar',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Correto'),
                                        ),
                                      );
                                      return;
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Errado'),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
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
