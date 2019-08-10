class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter valid email address';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 5) {
      return 'The password must be 4 or more characters long';
    }
    return null;
  }
}
