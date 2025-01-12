import 'package:bloc/bloc.dart';
import 'package:exptracker/app.dart';
import 'package:exptracker/simple_block_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    appId: '1:841280203900:android:2dfd95c0ef70ca94d3edf9',
    projectId: 'expense-tracker-ad9bd',
    apiKey: 'AIzaSyDjWdaDHQzzDm0MAMkxi5gjm18V3gP7l3w',
    storageBucket: "expense-tracker-ad9bd.firebasestorage.app",
    messagingSenderId: 'id',
  ));
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
