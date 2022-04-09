import 'package:contact_app/controller/contact_controller.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _addContactFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Form(
                key: _addContactFormKey,
                child: Column(
                children: [
                  const Center(
                    heightFactor: 3,
                    child:Text(
                     "Add Contact", 
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
                      addContact(_nameController.text,_numberController.text);
                    }
                  },
                  child: const Text('Add Contact'),
                  style: ElevatedButton.styleFrom(primary: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
