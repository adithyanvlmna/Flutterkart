class AppValidator {
  static String? fieldValidation(String? value, String field) {
    if (value!.isEmpty || value == "") {
      return "$field is required";
    }
    return null;
  }
}
