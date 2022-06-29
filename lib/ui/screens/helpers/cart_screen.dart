import 'package:expenses_tracking_app/ui/widgets/alternatives_sliding_up_panel.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/sliding_up_panel_header.dart'; 
import 'package:expenses_tracking_app/ui/widgets/purchase_list_view.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const PurchaseListView();

    // return SlidingUpPanel( 
    //   borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)), 
    //   body: const PurchaseListView(),
    //   panel: const AlternativesSlidingUpPanel(), 
    //   header: const SlidingUpPanelHeader(), 
    // );
  }
}