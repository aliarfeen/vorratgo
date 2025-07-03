import 'package:flutter/material.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/home/presentation/widgets/categories.dart';
import 'package:vorratgo/features/home/presentation/widgets/offer_cards.dart';
import 'package:vorratgo/features/home/presentation/widgets/vorrat_go_span.dart';
import 'package:vorratgo/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                VorratGoSpan(),
                // SearchBar(
                //   padding: const WidgetStatePropertyAll<EdgeInsets>(
                //     EdgeInsets.symmetric(horizontal: 16.0),
                //   ),

                //   leading: const Icon(Icons.search),
                // ),
                verticalSpacer(8),

                Offer_Cards(),
                verticalSpacer(8),
                Text(
                  S.of(context).categries,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                  ),
                ),
                verticalSpacer(8),
                Categories(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
