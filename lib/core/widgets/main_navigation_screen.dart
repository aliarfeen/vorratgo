import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/cart/presentation/pages/cart.dart';
import 'package:vorratgo/features/home/presentation/screens/home.dart';
import 'package:vorratgo/features/profile_center/presentation/screens/profile_center.dart';
import 'package:vorratgo/generated/l10n.dart';

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 18);
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Search', style: optionStyle),
    CartScreen(),
    Text('favorits', style: optionStyle),
    ProfileCenter(),
  ];

  @override
  Widget build(BuildContext context) {
    int cartItemCount = context.watch<CartCubit>().items.length;
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) => current is CartUpdated,
      listener: (context, state) {
        if (state is CartUpdated) {
          setState(() {
            cartItemCount = state.items.length;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:
          //  SafeArea(
          //   child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
          // ),
          IndexedStack(index: _selectedIndex, children: _widgetOptions),
          bottomNavigationBar: Container(
            height: 100.h,
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
                  gap: 5.w,
                  activeColor: AppColors.green,
                  iconSize: 25.dm,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  duration: Duration(milliseconds: 200),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: AppColors.grey,
                  tabs: [
                    GButton(icon: LineIcons.home, text: S.of(context).home),

                    GButton(icon: LineIcons.search, text: S.of(context).search),
                    GButton(
                      icon: LineIcons.shoppingBasket,
                      text: S.of(context).cart,
                      leading: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(
                            LineIcons.shoppingBasket,
                            size: 25,
                            color:
                                _selectedIndex == 2
                                    ? Colors.green
                                    : Colors.black,
                          ),
                          cartItemCount > 0
                              ? Positioned(
                                right: -4,
                                top: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: AppColors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: Center(
                                    child: Text(
                                      // cubit.items.length.toString(),
                                      cartItemCount.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              : Container(),
                        ],
                      ),
                    ),
                    GButton(
                      icon: Icons.favorite_border_outlined,
                      text: S.of(context).bakery,
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
        );
      },
    );
  }
}
