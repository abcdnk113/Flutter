bool validateEmail(String value) {
  if(value.isEmpty){
    return false;
  }  
  return true;
}


bool validatePassword(String value){
  if(value.isEmpty){
    return false;
  }
  if(value.length<6){
    return false;
  }
  return true;
}