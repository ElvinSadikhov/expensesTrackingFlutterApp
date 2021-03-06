// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/alternative_option.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProductAlternativesBlock extends StatelessWidget {
  final List<Product>? alternatives;
  final Product currentProduct;
  
  const ProductAlternativesBlock({ Key? key, required this.alternatives, required this.currentProduct }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.pricesInOtherStores,
            style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w600, decoration: TextDecoration.underline,),
          ),
        ),
        WidgetMethods.verticalSpace(10),
        this.alternatives != null
          ? this.alternatives!.isNotEmpty
            ? Column(
              children: [
                ...this.alternatives!.map(
                  (alternative) => 
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: AlternativeOption(
                        alternative: alternative,
                        currentProduct: this.currentProduct
                      ),
                    )
                )
              ],
            )
            : Text("Not found")
          : const CircularProgressIndicator(),
      ],
    );
  }
}