import 'package:flutter/material.dart';

class RegistrationValidator {

  RegistrationValidator._();

  static String? validateFirstName(String? value) { 
    return value == null || value.isEmpty ? "Please enter your first name!" 
      : value.split(" ").length > 1 ? "First name must contain only 1 word!"  
        : null; 
  }

  static String? validateLastName(String? value) { 
    return value == null || value.isEmpty ? "Please enter your last name!" 
      : value.split(" ").length > 1 ? "Last name must contain only 1 word!"  
        : null; 
  } 
  
  static String? validateGmail(String? value) {  
    return value == null || value.isEmpty ? "Please enter a gmail address!" :
      !value.contains("@gmail.com") ? "Please enter valid gmail!" 
        : null;
  }  

  static String? validateUsername(String? value) { 
    return value == null || value.isEmpty ? "Please enter valid username!" 
      : value.length < 8 ? "Username must contain at least 8 characters!"  
        : value == value.toLowerCase() || value == value.toUpperCase() ? "Username must contain both lowercase and uppercase laters!"
          : null; 
            
  }

  static String? validatePassword(String? value) { 
    return value == null || value.length < 8 ? "Password must contain at least 8 characters!" 
      : value == value.toLowerCase() || value == value.toUpperCase() ? "Password must contain both lowercase and uppercase laters!" 
        : null; 
  } 

  static String? validateConfirmPassword(String? value, {required TextEditingController passwordController}) { 
    return value == null || value.isEmpty ? "Please enter a password second time!" :
      value != passwordController.value.text.trim() ? "Passwords don't match!" : null;
  }

}