import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/habit_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HabitProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var dados = Provider.of<HabitProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoTracker',

      // ✅ MODO ESCURO FUNCIONANDO
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: dados.modoEscuro ? ThemeMode.dark : ThemeMode.light,

      home: const SplashScreen(),
    );
  }
}

// 🔹 SPLASH (mantive igual ao seu)
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8F3DC),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.clear_rounded,
                  size: 70, color: Color(0xFF2D6A4F)),
            ),
            const SizedBox(height: 30),
            const Text(
              "EcoTracker",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4332),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Text(
                "Acompanhe seus hábitos sustentáveis e faça a diferença todos os dias!",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()),
                );
              },
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}