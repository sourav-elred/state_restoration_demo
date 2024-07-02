import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Restoration Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RestorableCounter(),
      restorationScopeId: 'app',
    );
  }
}

class RestorableCounter extends StatefulWidget {
  const RestorableCounter({super.key});

  @override
  RestorableCounterState createState() => RestorableCounterState();
}

class RestorableCounterState extends State<RestorableCounter>
    with RestorationMixin {
  final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'counter';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  void _incrementCounter() {
    setState(() {
      _counter.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Restoration Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter.value}',
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

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}
