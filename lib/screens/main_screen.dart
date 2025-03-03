import 'package:flutter/material.dart';
import 'package:flutter_app_bd_1/screens/phones_screen.dart';
import 'package:flutter_app_bd_1/screens/cars_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de productos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PhoneScreen(),
                ),
              );
            },
            child: const Text('Celulares')
          ),
          ElevatedButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CarsScreen(),
                ),
              );
            },
            child: const Text('Electrodomesticos')
          ),
        ],
      ),
    );
  }
}