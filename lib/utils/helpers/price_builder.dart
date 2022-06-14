// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/utils/enums/currency.dart';


class PriceBuilder { 

  PriceBuilder._();

  static String build({required double price, required Currency currency}) {
    StringBuffer buffer = StringBuffer();

    buffer.write(price);

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

  // idk need to think about this one !!!
  static void changeCurrency({required double price, required Currency curCurrency, required Currency newCurrency}) {
    // TODO: implement later MAYBE 
  }  

}