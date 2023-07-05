import 'package:drift_crud/src/routes/routes.dart';
import 'package:drift_crud/src/ui/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: HomeView.home,
      onGenerateRoute: AppRoutes.generatedRoute,
    );
  }
}


