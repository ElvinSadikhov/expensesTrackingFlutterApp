// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart';  
import 'package:expenses_tracking_app/models/purhcase.dart';
import 'package:expenses_tracking_app/providers/cart_state.dart';
import 'package:expenses_tracking_app/ui/screens/product_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/image_box.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/signed_box.dart'; 
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PurchaseShortcut extends StatelessWidget { 
  final double imageHeight;
  final double imageWidth;
  final Purchase purchase;

  const PurchaseShortcut({ Key? key,  
    this.imageHeight = 100, 
    this.imageWidth= 100, 
    required this.purchase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => ProductScreen(product: this.purchase.product))
        );
      },
      child: SizedBox(
        width: sizeOfScreen.width - 2 * PaddingConsts.horizontalPadding,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageBox(
                  borderRadiusValue: 12,
                  imageLink: this.purchase.product.imageLink, 
                  height: this.imageHeight, 
                  width: this.imageWidth
                ),
                WidgetMethods.horizontalSpace(5),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                        children: [
                          SizedBox(
                            width: sizeOfScreen.width * 0.5,
                            child: Text(
                              this.purchase.product.title,
                              style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w500), 
                            ),
                          ),  
                          GestureDetector(
                            onTap: () { 
                              Provider.of<CartState>(context, listen: false).removeFromCart(purchase);
                            },
                            child: const Icon(
                              Icons.close, 
                              size: 25
                            ),
                          ),
                        ],
                      ),
                      WidgetMethods.verticalSpace(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            this.purchase.product.storeName,
                            style: Theme.of(context).textTheme.headline6!.copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.w400), 
                          ),
                          WidgetMethods.horizontalSpace(30),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () { 
                                  Provider.of<CartState>(context, listen: false).decrementCountOfPurchase(Purchase(product: this.purchase.product, count: this.purchase.count));
                                },
                                child: const SignedBox(iconData: Icons.remove)
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "${this.purchase.count}",
                                  style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              GestureDetector(
                                onTap: () { 
                                  Provider.of<CartState>(context, listen: false).incrementCountOfPurchase(Purchase(product: this.purchase.product, count: this.purchase.count)); 
                                },
                                child: const SignedBox(iconData: Icons.add)
                              )
                            ],
                          )
                        ],
                      )
                    ]
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " " + Strings.price + PriceBuilder.build(price: this.purchase.product.price, currency: this.purchase.product.currency),
                  style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w400),
                ),
                Consumer<CartState>(
                  builder: (context, CartState cartState, _) {
                    return FutureBuilder<int>(
                      future: cartState.getCountOfPurchase(purchase),
                      builder: (context, snapshot) {
                        return snapshot.hasData 
                          ? Text(
                            Strings.total + PriceBuilder.build(price: this.purchase.product.price * snapshot.data!, currency: this.purchase.product.currency),
                            style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w400),
                          )
                          : const CircularProgressIndicator();
                      }, 
                    );
                  }, 
                ), 
              ],
            ), 
          ],
        ),
      ),
    );
  }
}