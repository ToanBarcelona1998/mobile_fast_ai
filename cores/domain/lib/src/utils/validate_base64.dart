import 'dart:convert';

extension Base64Validate on String{
  bool base64Validate(){
    try{
      base64.decode(this);

      return true;
    }catch(e){
      return false;
    }
  }
}