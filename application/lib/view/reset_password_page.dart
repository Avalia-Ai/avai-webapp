import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/widgets/button.dart';
import 'package:avalia_ai/shared/widgets/navigation_button.dart';
import 'package:avalia_ai/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AVAIColors.white50,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildNavigationButton(context),
                      buildResetPasswordForm(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildNavigationButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      alignment: Alignment.topLeft,
      child: AVAINavigationButton(
        backButton: true,
        onPressed: () => {Navigator.pop(context)},
      ),
    );
  }

  Widget buildResetPasswordForm() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 560,
      ),
      margin: const EdgeInsets.only(top: 24, bottom: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/safe.png',
            height: 420,
          ),
          Text(
            'Por favor, insira o endereço de email associado à sua conta. Enviaremos um código de verificação para este endereço para prosseguir com a recuperação de senha.',
            style: AVAITextStyle().subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          const AVAITextInput(
            placeholder: 'nome@ic.ufrj.br',
            label: 'Email institucional',
          ),
          const SizedBox(height: 48),
          AVAIButton(label: 'Enviar', onPressed: () {}),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
