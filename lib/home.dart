import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shine/model/product.dart';
import 'package:shine/model/products_respository.dart';
import 'package:shine/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;
  const HomePage({
    Key? key,
     this.category = Category.all,
  }) : super(key: key);

  // Make a collection of cards
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);


    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map<Card>((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: theme.textTheme.headline6,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        formatter.format(product.price),
                        style: theme.textTheme.caption,
                      )
                    ],
                  )),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
    // Scaffold(
    // appBar: AppBar(
    //   systemOverlayStyle: SystemUiOverlayStyle.light,
    //   leading: IconButton(
    //     onPressed: () {
    //       print('Menu button');
    //     },
    //     icon: const Icon(
    //       Icons.menu,
    //       semanticLabel: 'menu',
    //     ),
    //   ),
    //   title: const Text('SHRINE'),
    //   // trailing buttons
    //   actions: <Widget>[
    //     IconButton(
    //       onPressed: () {
    //         print('search button');
    //       },
    //       icon: const Icon(
    //         Icons.search,
    //         semanticLabel: 'search',
    //       ),
    //     ),
    //     IconButton(
    //       onPressed: () {
    //         print('Filter');
    //       },
    //       icon: const Icon(
    //         Icons.tune,
    //         semanticLabel: 'filter',
    //       ),
    //     ),
    //   ],
    // ),
    // body:
    // Add a grid view (102)
    // body: GridView.count(
    //   crossAxisCount: 2,
    //   padding: const EdgeInsets.all(16.0),
    //   childAspectRatio: 8.0 / 9.0,
    //   children: _buildGridCards(context),
    // ),
    // Set resizeToAvoidBottomInset
    // resizeToAvoidBottomInset: false,
    // );
  }
}
