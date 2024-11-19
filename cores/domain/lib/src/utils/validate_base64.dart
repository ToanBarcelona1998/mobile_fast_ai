import 'dart:convert';

extension Base64Validate on String{
  bool validate(){
    try{
      base64.decode(this);

      return true;
    }catch(e){
      return false;
    }
  }
}