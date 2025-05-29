import 'package:flutter/material.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/home/presentation/widgets/categories.dart';
import 'package:vorratgo/features/home/presentation/widgets/home_cards.dart';
import 'package:vorratgo/features/home/presentation/widgets/vorrat_go_span.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: floatingButton(context),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                VorratGoSpan(),
                verticalSpacer(8),
                SearchBar(
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0),
                  ),

                  leading: const Icon(Icons.search),
                ),
                verticalSpacer(8),

                OnLandingCards(),
                verticalSpacer(8),
                Text(
                  'Categories',
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

  FloatingActionButton floatingButton(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.orange,
      shape: CircleBorder(),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Button Pressed'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
    );
  }
}
