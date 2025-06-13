import 'package:app_settings/provider/app_settings_provider.dart';
import 'package:data_store/provider/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_modular_clean_architecture/di/injection.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appSettingsProvider = getIt<AppSettingsProvider>();
    final sessionProvider = getIt<SessionProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'app language:' + '${appSettingsProvider.getAppLanguage()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'app language:' + '${sessionProvider.getAccessToken()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'app Theme:' + '${appSettingsProvider.getThemeType()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
