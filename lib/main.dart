import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart'; // Import penting untuk fix trackpad
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        // Pastikan konfigurasi ini sesuai dengan project Firebase kamu
        apiKey: 'AIzaSyB-WUO2EbSCcKZsRpijDpK1KIt0dt5V8Gk',
        appId: '1:726720464331:android:37b974ebeff9ecfc54224e',
        messagingSenderId: '726720464331',
        projectId: 'attendance-app-6e471',
      ),
    );
    print("Firebase Terhubung ke:");
    print("API Key: ${Firebase.app().options.apiKey}");
    print("Project ID: ${Firebase.app().options.projectId}");
  } catch (e) {
    print("Firebase gagal terhubung: $e");
  }
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // --- PERBAIKAN DIMULAI DI SINI ---
      // Menambahkan scroll behavior khusus untuk mengatasi error trackpad/mouse
      scrollBehavior: MyCustomScrollBehavior(),
      // --- PERBAIKAN SELESAI ---
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Placeholder(),
          ),
          Expanded(
            child: Placeholder(),
          ),
          SizedBox(
            height: 50,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}

// --- KELAS TAMBAHAN UNTUK FIX ---
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override ini mengizinkan input dari mouse dan trackpad untuk melakukan drag/scroll
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}