import 'package:avalia_ai/routes.dart';
import 'package:flutter/material.dart';
import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'view/auth_model.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['BASE_URL']!,
    anonKey: dotenv.env['API_KEY']!,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: const AvaliaAi(),
    ),
  );
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
