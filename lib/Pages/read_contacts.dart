import 'package:flutter/material.dart';
import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/controller/contact_controller.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactState();

}

class _ContactState extends State<ContactList> {

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  ListTile _buildListTile(String title, String subtitle, String id) {
    return ListTile(
      title: Text(title + " ID: " + id, style: TextStyle(fontSize: 18)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 18)),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.create_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(
                context, '/edit',
                arguments: id
                );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outlined),
            color: Colors.black,
            onPressed: () {
              showDeleteDialog(context,id);
            },
          ),
        ],
      ),
    );
  }

  ListView _contactsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _buildListTile(
              data[index].pname, data[index].pphone, data[index].pid);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder<List<Contact>>(
      future: fetchContacts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Contact>? data = snapshot.data;
          return _contactsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(child: CircularProgressIndicator());
      },
    )));
  }
}
