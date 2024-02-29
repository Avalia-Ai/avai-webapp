import 'package:avalia_ai/routes.dart';
import 'package:flutter/material.dart';
import 'package:avalia_ai/shared/styles/colors.dart';

void main() {
  runApp(const AvaliaAi());
}

class AvaliaAi extends StatefulWidget {
  const AvaliaAi({super.key});

  @override
  AvaliaAiState createState() => AvaliaAiState();
}

class AvaliaAiState extends State<AvaliaAi> {
  @override
  void initState() {
    super.initState();
    FluroRoute.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avalia Aí',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AVAIColors.royalBlue),
        fontFamily: 'PublicSans',
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: FluroRoute.router.generator,
    );
  }
}
