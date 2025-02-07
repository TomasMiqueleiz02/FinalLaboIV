import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:tp2_flutter_grupo12/screens/home_screen.dart';
import 'package:tp2_flutter_grupo12/screens/jugadores_list_screen.dart';
import 'package:tp2_flutter_grupo12/screens/profile_screen.dart';
import 'package:tp2_flutter_grupo12/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jugadores App',
          theme:
              themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          initialRoute: 'home',
          routes: {
            'home': (context) => const HomeScreen(),
            'jugadores_list': (context) => const JugadoresListScreen(),
            'profile': (context) => const ProfileScreen(),
          },
        );
      },
    );
  }
}
