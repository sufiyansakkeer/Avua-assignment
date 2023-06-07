import 'dart:developer';

import 'package:avua_assignment/bloc/forms/forms_bloc.dart';
import 'package:avua_assignment/core/constants.dart';
import 'package:avua_assignment/model/registration_form/registration_form_model.dart';

import 'package:avua_assignment/view/widgets/calender.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/registration/registration_bloc.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // late File pdfName;
  // late File pdfFile;
  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<RegistrationBloc>(context).add(RegistrationInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // first name
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name.';
                    }
                    return null;
                  },
                ),
                height20,
                // last name
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name.';
                    }
                    return null;
                  },
                ),
                height20,
                // Date of Birth
                Calender(dateController: _dateController),
                height20,
                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                ),
                height20,
                // phone number
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number.';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid phone number.';
                    }
                    return null;
                  },
                ),
                height20,
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    if (state is RegistrationPickedState) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                // Image.asset(
                                //   "assets/pdf_Icon_logo.png",
                                //   height: 50,
                                // ),
                                Expanded(
                                  child: Text(
                                    state.pdfName.toString(),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // cv upload

                GestureDetector(
                  onTap: () async {
                    BlocProvider.of<RegistrationBloc>(context)
                        .add(RegistrationFilePick());
                  },
                  child: const Card(
                    child: SizedBox(
                      height: 180,
                      child: Center(
                        child: CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.cloud_upload_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Registration button
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      child: const Text('Register'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (state is RegistrationInitial) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please add Resume",
                                ),
                              ),
                            );
                          } else if (state is RegistrationPickedState) {
                            int phn = int.parse(_phoneNumberController.text);
                            log(phn.toString());
                            RegistrationFormModel formModel =
                                RegistrationFormModel(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              date: _dateController.text,
                              email: _emailController.text,
                              phoneNumber: phn,
                              resume: state.pdfPath,
                              id: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                            );
                            BlocProvider.of<RegistrationBloc>(context).add(
                                RegistrationAddEvent(
                                    registrationFormModel: formModel,
                                    context: context));
                            BlocProvider.of<FormsBloc>(context)
                                .add(GetAllForms());
                          }
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
