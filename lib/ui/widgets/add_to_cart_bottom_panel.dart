// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/models/purhcase.dart';
import 'package:expenses_tracking_app/providers/bottom_navigation_bar_state.dart';
import 'package:expenses_tracking_app/providers/cart_state.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/signed_box.dart';
import 'package:expenses_tracking_app/ui/widgets/labeled_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class AddToCartBottomPanel extends StatefulWidget {
  final Product product;
  final double panelHeight;
  
  const AddToCartBottomPanel({ Key? key, required this.product, required this.panelHeight }) : super(key: key);

  @override
  State<AddToCartBottomPanel> createState() => _AddToCartBottomPanelState();
}

class _AddToCartBottomPanelState extends State<AddToCartBottomPanel> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Container(
      height: widget.panelHeight,
      width: sizeOfScreen.width, 
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row( 
            children: [
              GestureDetector(
                onTap: () {
                  if(this.count > 1) {
                    setState(() {
                      this.count--;
                    }); 
                  } 
                },
                child: const SignedBox(iconData: Icons.remove)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "${this.count}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              GestureDetector(
                onTap: () { 
                  setState(() {
                    this.count++;
                  }); 
                },
                child: const SignedBox(iconData: Icons.add)
              )
            ],
          ), 
          LabeledButton( 
            label: AppLocalizations.of(context)!.addToCart, 
            onTap: () {
              Provider.of<CartState>(context, listen: false).addToCart(Purchase(product: widget.product, count: this.count)); 
              Provider.of<BottomNavigationBarState>(context, listen: false).changeScreenByIndex(index: 1, context: context);   
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.productHasBeenAddedToTheCart), behavior: SnackBarBehavior.floating,));  
            },  
          )
        ],
      )
    );
  }
} 