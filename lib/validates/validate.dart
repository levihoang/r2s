class Validate {
  static bool checkInvalidateNewPassword(String str) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (!regex.hasMatch(str)) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkNotEqualNewPassword(
      String newPassword, String reNewPassword) {
    if (newPassword != reNewPassword) {
      return true;
    }
    return false;
  }
}
