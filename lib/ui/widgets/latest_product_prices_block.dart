import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:flutter/material.dart';


class LatestProductPricesBlock extends StatefulWidget {
  const LatestProductPricesBlock({ Key? key }) : super(key: key);

  @override
  State<LatestProductPricesBlock> createState() => _LatestProductPricesBlockState();
}

class _LatestProductPricesBlockState extends State<LatestProductPricesBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockLabel(title: Strings.latestProductPrices)
      ],
    );
  }
}