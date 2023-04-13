import 'package:flutter/material.dart';
import 'package:teste_object_box/app.dart';
import 'package:provider/provider.dart';
import 'package:teste_object_box/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: providers,
      child: const App(),
    ),
  );
}
