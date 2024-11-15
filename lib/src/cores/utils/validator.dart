extension StringValidator on String {
  bool validateEmail() {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(this);
  }

  bool validatePhoneNumber(){
    final phoneRegex =
    RegExp(r'^(?:[+0]9)?[0-9]{10,}$');
    return phoneRegex.hasMatch(this);
  }
}
