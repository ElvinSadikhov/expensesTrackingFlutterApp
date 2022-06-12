class LoginValidator {

  LoginValidator._();

  // TODO: TO CHANGE

  static String? validateUsername(String? value) {
    return value == null || value.isEmpty ? "Please enter valid username!" 
      : value.length < 8 ? "Username must contain at least 8 characters!"  
        : !value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[a-z]')) ? "Must contain both uppercase and lowercase laters!"
          : null; 
  }

  static String? validatePassword(String? value) {
    return value == null || value.length < 8 ? "Password must contain at least 8 characters!" : null; 
  } 

}