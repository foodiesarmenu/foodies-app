class ValidationUtils {
  static bool isValidEmail(String email) {
    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    var regex = RegExp(
        r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$');
    return regex.hasMatch(password);
  }

  /// Checks if string consist only Alphabet. (No Whitespace)
  static bool isText(String name) {
    var regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(name);
  }
}
