// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/models/purhcase.dart';
import 'package:expenses_tracking_app/providers/cart_state.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/signed_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PurchaseCountControlPanel extends StatefulWidget {
  final Product product;
  
  const PurchaseCountControlPanel({ Key? key, required this.product }) : super(key: key);

  @override
  State<PurchaseCountControlPanel> createState() => _PurchaseCountControlPanelState();
}

class _PurchaseCountControlPanelState extends State<PurchaseCountControlPanel> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (context, CartState cartState, _) {
        return Row( 
          children: [
            GestureDetector(
              onTap: () {
                if(this.count > 1) {
                  this.count--;
                }
                cartState.removeFromCart(Purchase(product: widget.product, count: this.count));
              },
              child: const SignedBox(iconData: Icons.remove)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "${this.count}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorConsts.black
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                this.count++;
                cartState.addToCart(Purchase(product: widget.product, count: this.count)); 
              },
              child: const SignedBox(iconData: Icons.add)
            )
          ],
        );
      }, 
    );
  }
} 