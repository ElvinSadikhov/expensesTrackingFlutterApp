import 'package:expenses_tracking_app/utils/enums/currency.dart';


extension EnumConverter on Currency { 
  
  String enumToString() => this.toString().split('.').last;

  static Currency? enumFromString(String value) {  
    for (Currency element in Currency.values) {
      if (element.enumToString() == value) return element;
    }
    return null; 
  } 
      
} 