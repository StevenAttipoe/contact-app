import 'package:contact_app/Pages/add_contact.dart';
import 'package:contact_app/Pages/edit_contact.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Contact Management System',
      debugShowCheckedModeBanner: false,
      // home:  Home(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/add': (context) => const AddContact(),
        '/edit': (context) => const EditContact(),
  },
    );
  }
}

// flutter run --no-sound-null-safety 