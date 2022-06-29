// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/utils/enums/currency.dart';  


class PriceBuilder { 

  PriceBuilder._();

  static String build({required double price, required Currency currency}) {
    StringBuffer buffer = StringBuffer();

    buffer.write(price.toStringAsFixed(2));

    switch(currency) {
      case Currency.DOLLAR:
        buffer.write(" \$");
        break;
      case Currency.EURO:
        buffer.write(" €");
        break;
      case Currency.MANAT:
        buffer.write(" ₼");
        break;
    }
  
    return buffer.toString();
  }

  static String calculatedDiscountPercentage({required double actualPrice, required discountedPrice}) {
    double priceDrop = (actualPrice - discountedPrice) / actualPrice * 100;

    return "-${priceDrop.toStringAsFixed(2)} %";
  }

  static double calculateDifferenceInPercentage({required double actualPrice, required double anotherPrice}) {
    // if new price is higher, then the result will be positive, otherwise negative
    return double.parse(((anotherPrice - actualPrice) / actualPrice * 100).toStringAsFixed(2));
  }
 
  static double changeCurrency({required double price, required Currency curCurrency, required Currency newCurrency}) { 
    const double manatInDollars = 0.59;
    const double manatInEuros = 0.56;
    const double dollarInEuros = 0.95;

    late double coefficient;
    switch(curCurrency) {
      case Currency.MANAT:
        switch(newCurrency) {
          case Currency.DOLLAR:
            coefficient = manatInDollars;
            break;
          case Currency.EURO:
            coefficient = manatInEuros;
            break;
          case Currency.MANAT:
            coefficient = 1; 
            break;
        }
        break;  
      case Currency.DOLLAR:
        switch(newCurrency) {
          case Currency.MANAT:
            coefficient = 1 / manatInDollars;
            break;
          case Currency.EURO:
            coefficient = dollarInEuros;
            break;
          case Currency.DOLLAR:
            coefficient = 1;
            break;
        } 
        break;
      case Currency.EURO:
        switch(newCurrency) {
          case Currency.MANAT:
            coefficient = 1 / manatInEuros;
            break;
          case Currency.DOLLAR:
            coefficient = 1 / dollarInEuros;
            break;
          case Currency.EURO:
            coefficient = 1;
            break;
        } 
        break;  
    }

    return price * coefficient; 
  }   
}