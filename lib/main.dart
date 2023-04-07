import 'package:flutter/material.dart';

import 'app.dart';
import 'data/datasources/local/storage_manager.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injection();
  StorageManager.instance.initPrefs();
  runApp(App());
}
