import 'package:avalia_ai/shared/widgets/button.dart';
import 'package:avalia_ai/shared/widgets/dropdown.dart';
import 'package:avalia_ai/shared/widgets/navigation_button.dart';
import 'package:avalia_ai/shared/widgets/text_input.dart';
import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:avalia_ai/view/auth_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatelessWidget {
  final bool register;
  final SupabaseClient client;

  const AuthPage._({
    Key? key,
    this.register = false,
    required this.client,
  }) : super(key: key);

  factory AuthPage({
    Key? key,
    bool register = false,
    SupabaseClient? client,
  }) {
    return AuthPage._(
      key: key,
      register: register,
      client: client ??
          SupabaseClient(dotenv.env['BASE_URL']!, dotenv.env['API_KEY']!),
    );
  }

  Widget buildPersonalInfoInputs(semesterOptions) {
    return Column(
      children: [
        AVAITextInput(
          label: 'Nome completo',
          placeholder: 'José da Silva',
          allowNumbers: false,
          allowSpecialCharacters: false,
          onChanged: (value) => {},
        ),
        const SizedBox(height: 24),
        AVAIDropdown(
          label: 'Período de ingresso',
          placeholder: '20xx-x',
          options: semesterOptions,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an option';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildIdentifiersInput(BuildContext context) {
    final authProvider = Provider.of<AuthModel>(context, listen: false);
    return Column(
      children: [
        AVAITextInput(
          label: 'E-mail institucional',
          placeholder: 'nome@ic.ufrj.br',
          allowNumbers: true,
          allowSpaces: false,
          textEditingController: authProvider.emailController,
        ),
        const SizedBox(height: 24),
        AVAITextInput(
          label: 'Senha',
          placeholder: '••••••',
          isPasswordField: true,
          textEditingController: authProvider.passwordController,
        ),
      ],
    );
  }

  Widget buildTermsOfUse() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (bool? newValue) {},
        ),
        const SizedBox(width: 6),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Aceito os ',
                style: AVAITextStyle().content,
              ),
              TextSpan(
                text: 'Termos de Uso',
                style: AVAITextStyle().link,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // TODO: Open terms of use
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildForgotPassword(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        // TODO: go to forgot password page
        onTap: () => {Navigator.pushNamed(context, '/reset-password')},
        child: Text(
          'Esqueci a senha',
          style: AVAITextStyle().link,
        ),
      ),
    );
  }

  Widget buildAlternativeButton(context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Não tem conta? ',
            style: AVAITextStyle().content,
          ),
          TextSpan(
            text: 'Registrar',
            style: AVAITextStyle().link,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/auth/register');
              },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> semesterOptions = [
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
                          decoration: const BoxDecoration(
                            color: AVAIColors.darkRoyalBlue,
                          ),
                          child: Image.asset(
                            'assets/images/main.png',
                            height: 280,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: AVAINavigationButton(
                            backButton: true,
                            onPressed: () => {Navigator.pop(context)},
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
                          const SizedBox(height: 32),
                          if (register) ...[
                            buildPersonalInfoInputs(semesterOptions),
                            buildIdentifiersInput(context),
                            const SizedBox(
                              height: 24,
                            ),
                            buildTermsOfUse(),
                          ] else ...[
                            buildIdentifiersInput(context),
                            const SizedBox(
                              height: 16,
                            ),
                            buildForgotPassword(context),
                            const SizedBox(
                              height: 36,
                            ),
                            AVAIButton(
                              label: 'Entrar',
                              onPressed: () async {
                                final authModel = Provider.of<AuthModel>(
                                    context,
                                    listen: false);
                                final email = authModel.email;
                                final password = authModel.password;
                                await signInUser(context,
                                    email: email, password: password);
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    if (register) ...[
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 560,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        margin: const EdgeInsets.only(top: 36),
                        child: AVAIButton(
                          label: 'Cadastrar',
                          onPressed: () => {},
                        ),
                      )
                    ] else ...[
                      const SizedBox(
                        height: 16,
                      ),
                      buildAlternativeButton(context),
                    ],
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> signUpUser(context, {String? email, String? password}) async {
    final result = await client.auth.signUp(email: email!, password: password!);
    if (result.user != null) {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  Future<void> signInUser(context, {String? email, String? password}) async {
    final result = await client.auth
        .signInWithPassword(email: email!, password: password!);
    if (result.user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> logout(context) async {
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }
}
