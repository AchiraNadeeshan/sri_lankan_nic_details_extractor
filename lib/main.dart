import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';
import 'bindings/nic_binding.dart';

/// The entry point of the application.
void main() {
  runApp(const NICApp());
}

/// The main application widget.
///
/// This class initializes the Flutter application and sets up routing,
/// themes, and dependency bindings using GetX.
class NICApp extends StatelessWidget {
  /// Creates an instance of [NICApp].
  const NICApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Details Extractor',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      initialBinding: NICBinding(), // Binds dependencies using GetX
      initialRoute: '/', // Sets the initial route of the app
      getPages: [
        GetPage(name: '/', page: () => InputScreen()), // Home screen route
        GetPage(
            name: '/result', page: () => ResultScreen()), // Result screen route
      ],
    );
  }
}
