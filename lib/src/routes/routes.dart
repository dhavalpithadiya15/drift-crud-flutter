import 'package:drift_crud/src/ui/home/home_view.dart';
import 'package:drift_crud/src/ui/insert/insert_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.home:
        return MaterialPageRoute<bool>(builder: (context) => const HomeView());
      case InsertView.insert:
        int? data = settings.arguments as int?;
        return MaterialPageRoute(builder: (context) => InsertView(id: data));
    }
    return MaterialPageRoute(builder: (context) => const Text("Error Route"));
  }
}
