import 'package:avua_assignment/view/registration_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Home Screen"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(" data $index"),
          );
        },
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const RegistrationForm(),
        )),
        child: const Icon(Icons.add),
      ),
    );
  }
}
