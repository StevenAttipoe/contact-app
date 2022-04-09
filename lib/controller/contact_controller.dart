import 'dart:convert';
import 'package:contact_app/Pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:contact_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/Pages/read_contacts.dart';

Future<List<Contact>> fetchContacts() async {
  const url = 'https://apps.ashesi.edu.gh/contactmgt/view/getallcontact';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((contact) => Contact.fromJson(contact)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

addContact(String name, String number) async {
  var url =
      Uri.parse('https://apps.ashesi.edu.gh/contactmgt/view/add_con_mobi');

  var response = await http.post(url, body: {'uname': name, 'unumber': number});
}

deleteContact(String id) async {
  var url = Uri.parse('https://apps.ashesi.edu.gh/contactmgt/view/delcontact');

  var response = await http.post(url, body: {'ppid': id});
  print(response.body);
}

editContact(String id, String name, String number) async {
  var url = Uri.parse('https://apps.ashesi.edu.gh/contactmgt/view/up_date_con');

  var response = await http.post(url, body: {
    'conid': id,
    'uname': name,
    'unumber': number,
  });
}

Future<void> showDeleteDialog(context, id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Contact'),
        content: const SingleChildScrollView(
          child: Text('Are you sure you want to delete this contact?'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              deleteContact(id);
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const Home(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
          ),
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
