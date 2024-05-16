import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Remove this item from your cart?",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: GoogleFonts.poppins(),
            ),
          ),
          // confirm button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);
              // add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text(
              "Yes",
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }

  // user pressed the pay now button
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                "User wants to pay! Connect this app to your payment backend",
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart

    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "C A R T",
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty
                  ? Center(
                      child: Text(
                        "Your cart is empty...",
                        style: GoogleFonts.poppins(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get indiviudal items in the cart
                        final item = cart[index];
                        // return as a cart list tile
                        return ListTile(
                          title: Text(
                            item.name,
                            style: GoogleFonts.poppins(),
                          ),
                          subtitle: Text(
                            '\$' + item.price.toStringAsFixed(2),
                            style: GoogleFonts.poppins(),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        );
                      },
                    )),
          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Text(
                  "PAY NOW",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.inversePrimary),
                )),
          )
        ],
      ),
    );
  }
}
