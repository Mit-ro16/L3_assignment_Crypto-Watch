import 'package:assignment/core/contants/string_constants.dart';

class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.emailRequired;
    }

    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return StringConstants.validEmail;
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.passwordRequired;
    }

    if (value.length < 8) {
      return StringConstants.passwordMinLength;
    }

    return null;
  }


}