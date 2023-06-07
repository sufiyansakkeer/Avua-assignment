import 'dart:developer';

import 'package:avua_assignment/view/registration_form.dart';
import 'package:avua_assignment/view/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forms/forms_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FormsBloc>(context).add(GetAllForms());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          if (state is FormsInitial) {
            return const Center(
              child: Text("Add form"),
            );
          } else if (state is FormsLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          "${state.registrationForms[index].firstName} ${state.registrationForms[index].lastName}",
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                        ),
                        onTap: () {
                          log(state.registrationForms[index].resume,
                              name: "resume path");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserDetails(
                                  form: state.registrationForms[index])));
                        }),
                  ),
                );
              },
              itemCount: state.registrationForms.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
