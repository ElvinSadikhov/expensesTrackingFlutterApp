import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/ui/screens/registration_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/clickable_recommendation_text.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_floating_action_button.dart';
import 'package:expenses_tracking_app/ui/widgets/labeled_button.dart';
import 'package:expenses_tracking_app/ui/widgets/login_form.dart';
import 'package:expenses_tracking_app/ui/widgets/product_search.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: SAFE AREA THING

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(label: "", searchDelegate: ProductSearch(productList: [])),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        floatingActionButton: const CustomFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
          child: Column(
            children: const [
               
            ]
          ),
        ),
      ),
    );
  }
}