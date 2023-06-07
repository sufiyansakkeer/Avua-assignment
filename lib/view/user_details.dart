// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:avua_assignment/core/constants.dart';
import 'package:avua_assignment/view/widgets/pdf_viewer_page.dart';
import 'package:flutter/material.dart';

import 'package:avua_assignment/model/registration_form/registration_form_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
    required this.form,
  }) : super(key: key);
  final RegistrationFormModel form;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shadowColor: Colors.black,
              elevation: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  height20,
                  Text(
                    "${form.firstName} ${form.lastName}".toUpperCase(),
                    style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  height20,
                  height20,
                  Text(form.date),
                  height10,
                  Text(form.phoneNumber.toString()),
                  height10,
                  Text(form.email),
                  height30,
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 50,
                      child: FilledButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PDFViewerPage(path: form.resume),
                              )),
                          child: const Text("resume"))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
