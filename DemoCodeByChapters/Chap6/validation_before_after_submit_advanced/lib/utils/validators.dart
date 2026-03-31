class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@')) {
      return 'Email must contain @';
    }

    return null;
  }
}
