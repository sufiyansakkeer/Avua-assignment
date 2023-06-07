import 'package:flutter/material.dart';

import '../../resources/registration_services.dart';

class Calender extends StatelessWidget {
  const Calender({
    super.key,
    required TextEditingController dateController,
  }) : _dateController = dateController;

  final TextEditingController _dateController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please select your Date of Birth";
        }
        return null;
      },
      controller: _dateController,
      decoration: const InputDecoration(
        labelText: "Date of Birth",
        suffixIcon: Icon(
          Icons.calendar_month,
        ),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.none,
      onTap: () async {
        final selectedTempDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now().subtract(
              const Duration(
                days: 6570,
              ),
            ),
            firstDate: DateTime.now().subtract(
              const Duration(
                days: 30000,
              ),
            ),
            lastDate: DateTime.now().subtract(
              const Duration(
                days: 6570,
              ),
            ),
            helpText: 'select a Date');

        _dateController.text = RegistrationServices.parseDateTime(
          selectedTempDate ??
              DateTime.now().subtract(
                const Duration(
                  days: 6570,
                ),
              ),
        );
      },
    );
  }
}
