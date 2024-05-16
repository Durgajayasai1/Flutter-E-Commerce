import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "S H O P",
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        actions: [
          // go to cart button
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_checkout))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          // shop subtitle
          Center(
              child: Text(
            "Pick from a selected list of premium products",
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.inversePrimary),
          )),
          // Product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // get each individual product from shop
                final product = products[index];
                // return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "Mini E-Commerce App",
              style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          )
        ],
      ),
    );
  }
}
