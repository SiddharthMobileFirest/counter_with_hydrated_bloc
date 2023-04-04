import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_example/bloc/counter_bloc.dart';
import 'package:hydrated_bloc_example/bloc/counter_event.dart';
import 'package:hydrated_bloc_example/screens/counter_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hydrated bloc example',
      theme: ThemeData(),
      home: BlocProvider(
        create: (context) => CounterBloc()..add(CounterStarted()),
        child: const CounterScreen(),
      ),
    );
  }
}
