import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_flutter_grupo12/providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perfil'),
        elevation: 10,
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: BodyProfile(),
      ),
    );
  }
}

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Configuración",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        SwitchListTile.adaptive(
          title: const Text('Modo Oscuro'),
          value: themeProvider.isDarkMode,
          onChanged: (bool value) {
            themeProvider.toggleTheme(value);
          },
        ),
      ],
    );
  }
}
