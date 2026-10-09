import 'package:flutter/material.dart';
import 'package:flutter_application_1/note_app/view/Note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_application_1/core/helpers/hive_helper.dart';
import 'package:flutter_application_1/note_app/cubit/cubit/note_cubit.dart';
import 'package:flutter_application_1/note_app/cubit/cubit/note_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.noteBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => NoteCubit()..getNotes(),
        child: const NotePage(),
      ),
    );
  }
}