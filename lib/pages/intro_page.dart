import 'package:ecommerce/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            // title
            Text(
              "TrendyTargets",
              style: GoogleFonts.pacifico(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            // subtitle
            Text(
              "Best Quality products",
              style: GoogleFonts.poppins(color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 10,
            ),
            // button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
