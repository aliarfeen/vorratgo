import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/DI/web_services/web_services_di.dart';
import 'package:vorratgo/core/cubits/user_auth_cubit/firebase_email_password_auth_cubit.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/core/widgets/app_submit_button.dart';
import 'package:vorratgo/features/profile_center/cubit/user_center_cubit.dart';
import 'package:vorratgo/features/profile_center/presentation/widgets/profile_menu_item.dart';

class ProfileCenter extends StatelessWidget {
  const ProfileCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserProfileCenterCubit>()..loadUserProfile(),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<UserProfileCenterCubit, UserProfileCenterState>(
          builder: (context, state) {
            if (state is UserProfileLoaded) {
              final user = state.user;
              return Column(
                children: [
                  const SizedBox(height: 20),

                  // --- Profile Header ---
                  ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          color: AppColors.green,
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Text(
                              user.name.substring(0, 1).toUpperCase(),
                              style: TextStyles.white24Bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, color: Colors.green),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Divider(),

                  // --- Menu List ---
                  Expanded(
                    child: ListView(
                      children: const [
                        ProfileMenuItem(
                          icon: Icons.shopping_bag_outlined,
                          title: 'Orders',
                        ),
                        ProfileMenuItem(
                          icon: Icons.person_outline,
                          title: 'My Details',
                        ),
                        ProfileMenuItem(
                          icon: Icons.location_on_outlined,
                          title: 'Delivery Address',
                        ),
                        ProfileMenuItem(
                          icon: Icons.credit_card_outlined,
                          title: 'Payment Methods',
                        ),
                        ProfileMenuItem(
                          icon: Icons.local_offer_outlined,
                          title: 'Promo Card',
                        ),
                        ProfileMenuItem(
                          icon: Icons.notifications_outlined,
                          title: 'Notifications',
                        ),
                        ProfileMenuItem(
                          icon: Icons.help_outline,
                          title: 'Help',
                        ),
                        ProfileMenuItem(
                          icon: Icons.info_outline,
                          title: 'About',
                        ),
                      ],
                    ),
                  ),

                  // --- Logout Button ---
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //     vertical: 12,
                  //   ),
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.logout, color: Colors.green),
                  //     label: const Text(
                  //       'Log Out',
                  //       style: TextStyle(
                  //         color: Colors.green,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xffF6F6F6),
                  //       elevation: 0,
                  //       minimumSize: const Size(double.infinity, 50),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: AppSubmitionButton(
                      color: AppColors.lightGrey,
                      textColor: AppColors.green,
                      lable: 'Log Out',
                      width: double.infinity,
                      height: 55,

                      onPressed: () {
                        sl<UserProfileCenterCubit>().logOut();
                        sl<FirebaseEmailPasswordAuthCubit>().signOut();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/authGate',
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is UserProfileError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
