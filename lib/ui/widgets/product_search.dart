// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/data/product.dart';
import 'package:expenses_tracking_app/ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';


class ProductSearch extends SearchDelegate< ProductWidget > {

  final List<ProductWidget> productList;
  // TODO: CHANGE
  ProductWidget result = ProductWidget(product: Product(title: ""),);

  ProductSearch({required this.productList});

  @override
  List<Widget>? buildActions(BuildContext context) { 
    return [
      IconButton(
        onPressed: () {
          query = "";
        }, 
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) { 
    return IconButton(
      onPressed: () {
        close(context, result);
      }, 
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return this.findSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return this.findSuggestions();
  }

  Widget findResults() {
    final suggestions = this.productList.where(
      (productWidget) {
        return productWidget.product.title.toLowerCase().contains(query.toLowerCase());
      }
    );

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ...suggestions.map(
              (suggestion) {
                return GestureDetector(
                  child: this.productList.elementAt(index),
                  onTap: () {
                    this.result = suggestions.elementAt(index);
                    close(context, result);
                  },
                );
              }
            ),
            
          ],
        );
      }
    );  
  }


  Widget findSuggestions() {
    final suggestions = this.productList.where(
      (productWidget) {
        return productWidget.product.title.toLowerCase().contains(query.toLowerCase());
      }
    );

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ...suggestions.map(
              (suggestion) {
                return GestureDetector(
                  child: this.productList.elementAt(index),
                  onTap: () {
                    query = this.productList.elementAt(index).product.title;
                  },
                );
              }
            ),
            
          ],
        );
      }
    );  
  }

}