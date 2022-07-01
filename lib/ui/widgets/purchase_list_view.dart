import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/models/purhcase.dart';
import 'package:expenses_tracking_app/providers/cart_state.dart';
import 'package:expenses_tracking_app/ui/widgets/purchase_shortcut.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PurchaseListView extends StatelessWidget {
  const PurchaseListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;

    return SizedBox( 
      child: Consumer<CartState>(
        builder: (context, CartState cartState, _) {
          return FutureBuilder<List<Purchase>>(
            future: cartState.purchases,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding, top: 5),
                    child: snapshot.hasData 
                      ? PurchaseShortcut( 
                        purchase: snapshot.data![index], 
                      )
                      : Container(),
                  );
                },
              );
            }, 
          );
        }, 
      )
    );
  }
}