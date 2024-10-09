import 'package:flutter/material.dart';
import 'package:upalerts/providers/portfolio_provider.dart';
import 'package:upalerts/providers/profile_provider.dart';
import 'package:upalerts/routes/routes.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart'; 
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PortfolioProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
      ], 
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(), 
        routerConfig: router,
        title: 'UpAlerts',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
          splashColor: Colors.transparent,
          appBarTheme:
              AppBarTheme.of(context).copyWith(backgroundColor: Colors.white),
        ),
      ),
    );
  }
}
