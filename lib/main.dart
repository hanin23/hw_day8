import 'package:flutter/material.dart';
import 'package:hw_day8/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://aeqkotsxmmuocrkalmwy.supabase.co",
    anonKey: "sb_publishable_aurh_hSjKE-pYaz9A1uopg_AdW1DLhB",
  );

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
