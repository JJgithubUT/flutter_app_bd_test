import 'package:flutter/material.dart';
import 'package:flutter_app_bd_1/services/mongo_service.dart';
import 'package:flutter_app_bd_1/screens/phones_screen.dart';
import 'package:flutter_app_bd_1/widgets/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoService().connect();
  print('Conexión a MongoDB establecida.');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: tema1(),
      home: const PhoneScreen(),
    );
  }
}