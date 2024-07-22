class FormValidators {


  static String? validatePhoneNumber(String? value) {

    if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value!)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // Add more validation functions as needed
}
