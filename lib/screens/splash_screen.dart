import '../providers/habit_provider.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HabitProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    
    Provider.of<HabitProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoTracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      home: const SplashScreen(),
    );
  }
}

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
            // Círculo branco com o ícone, igual ao modelo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.clear_rounded, size: 70, color: Color(0xFF2D6A4F)),
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
                style: TextStyle(fontSize: 16, color: Color(0xFF1B4332)),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D6A4F), // Verde escuro
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Entrar", 
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}