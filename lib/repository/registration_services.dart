import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

import 'package:permission_handler/permission_handler.dart';

class RegistrationServices {
  // date parsing function
  static String parseDateTime(DateTime date) {
    // to parse to jan 25 2023 type date format
    final dateFormatted = DateFormat.yMMMd().format(date);
    return "$dateFormatted ";
  }

  // to check user is adult or not
  static bool isAdult(String birthDateString) {
    String datePattern = "dd-MM-yyyy";

    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }

  Future<bool> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<FilePickerResult?> getFile() async {
    // Get the path to the file.

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf", "docx"],
    );

    return result;
  }
}
