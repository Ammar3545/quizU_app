import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quize_u/secondary_point.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const SecondaryPoint());
}
