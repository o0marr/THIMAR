class InputValidator{
  static String? phone(value) {
  if(value!.isEmpty){
  return"يجب اخال رقم الجوال";
  }else if(value.length<11){
    return"يجب ان يكون رقم الجوال  أحد عشر على الاقل";
  }
  else{
  return null;
  }
  }


 static String? password(value) {
  if(value!.isEmpty){
  return"يجب اخال كلمة المرور";
  }else if(value.length<7){
  return"يجب ان تكون كلمة المرور اكثر من سبع حروف على الاقل";

  }
  else{
  return null;
  }
  }


}