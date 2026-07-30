import 'package:flutter/material.dart';

import 'app_configs.dart';
import 'app.dart';

void main() async {
  await initializeAppConfig();
  runApp(
    const App(),
    // DevicePreview(
    //   enabled: false,
    //   builder: (context) => const App(),
    // ),
  );
}
