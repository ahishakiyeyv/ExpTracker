import 'package:bloc/bloc.dart';
import 'package:exptracker/app.dart';
import 'package:exptracker/simple_block_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlockObserver();
  runApp(const MyApp());
}
