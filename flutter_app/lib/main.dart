import 'package:flutter/material.dart';
import 'package:workshop_flutterfriends/dbus_repository.dart';

final dbusRepository = DBusRepository(dataSource: DBusDataSource.session());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              dbusRepository.throttleMotor(duration: 1, speed: 0.5);
            },
            child: const Text('Turn the Servo!'),
          ),
        ),
      ),
    );
  }
}
