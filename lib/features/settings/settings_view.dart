import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/features/change_password/view/change_password_view.dart';
import 'package:ecommerce/features/change_profile/view/change_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            _getOption(
              'Change Profile',
              Icons.person_outline_outlined,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChangeProfileView(),
                  ),
                );
              },
            ),
            _getDivider(),
            _getOption(
              'Change Password',
              Icons.lock_outline,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChangePasswordView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(),
    );
  }

  Widget _getOption(String title, IconData? icon, void Function() onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: GoogleFonts.cairo(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Icon(
        icon,
        size: 30,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
    );
  }
}
