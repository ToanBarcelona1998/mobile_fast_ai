import 'package:mobile_fast_ai/src/cores/utils/app_date_formatter.dart';

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

  bool validateBirthday(){
    try{
      AppDateFormatter.monthDayYearWithHyphen.parseStrict(this);

      return true;
    }catch(e){
      return false;
    }
  }
}
