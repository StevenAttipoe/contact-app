import 'package:contact_app/Pages/home.dart';
import 'package:contact_app/controller/contact_controller.dart';
import 'package:flutter/material.dart';

class EditContact extends StatefulWidget {
  const EditContact({Key? key}) : super(key: key);

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _addContactFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Form(
                key: _addContactFormKey,
                child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
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
                  const Center(
                    heightFactor: 3,
                    child:Text(
                     "Edit Contact", 
                     style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                      ),
                      controller: _numberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )),
              ElevatedButton(
                  onPressed: () {
                    if (_addContactFormKey.currentState!.validate()) {
                      editContact(args.toString(), _nameController.text,_numberController.text);
                    }
                  },
                  child: const Text('Update Contact'),
                  style: ElevatedButton.styleFrom(primary: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
