import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Actions Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final QuickActions quickActions = const QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'action_decrement') {
        print('The user tapped on the "decrement" action.');
        main();
      } else {
        print('The user tapped on the "increment" action.');
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_decrement', localizedTitle: 'decrement', icon: 'minus'),
      const ShortcutItem(
          type: 'action_increment', localizedTitle: 'increment', icon: 'plus')
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: const Center(
          child: Text('On home screen, long press the icon to '
              'get Main view action. Tapping on that action should print '
              'a message to the log.')),
    );
  }
}
