class Validators {
  /// Required Field Check
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  /// Pattern Matching (Regex)
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }

    final RegExp emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  /// Length Validation
  static String? validatePasswordLength(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (value.length > 20) {
      return 'Password must be less than 20 characters';
    }

    return null;
  }

  /// Custom Rule
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }

    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

    if (!usernameRegex.hasMatch(value)) {
      return 'Username must not contain special characters';
    }

    return null;
  }

  /// Cross-field Validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
