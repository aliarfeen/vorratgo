import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/home/presentation/screens/home.dart';
import 'package:vorratgo/features/profile_center/presentation/screens/profile_center.dart';
import 'package:vorratgo/generated/l10n.dart';

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Search', style: optionStyle),
    Text('cart', style: optionStyle),
    ProfileCenterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8,
              ),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: AppColors.orange,
                iconSize: 30,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 200),
                tabBackgroundColor: Colors.grey[100]!,
                color: AppColors.grey,
                tabs: [
                  GButton(icon: LineIcons.home, text: S.of(context).home),

                  GButton(icon: LineIcons.search, text: S.of(context).search),
                  GButton(
                    icon: LineIcons.shoppingBasket,
                    text: S.of(context).cart,
                  ),
                  GButton(icon: LineIcons.user, text: S.of(context).profile),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
