class Validate {
  static bool validateEmail(String email) {
    if (email.contains('@') &&
        email.trim().split('@')[0].length >= 5 &&
        email.contains('.com')) {
      return true;
    } else {
      return false;
    }
  }

  static bool validatePhone(String phone) {
    if (phone.trim().length != 11) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateName(String name) {
    if (name.length < 3) {
      return false;
    } else {
      return true;
    }
  }
  static bool validatePass(String pass) {
    if (pass.length < 7) {
      return false;
    } else {
      return true;
    }
  }
}
