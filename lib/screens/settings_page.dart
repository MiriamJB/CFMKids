import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//find information on this widget at:
//https://pub.dev/packages/babstrap_settings_screen

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          SettingsGroup(
            settingsGroupTitle: "General",
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.sunny,
                iconStyle: IconStyle(
                  backgroundColor: const Color.fromARGB(255, 140, 222, 233),
                ),
                title: 'Appearance',
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  backgroundColor: const Color.fromARGB(255, 13, 163, 171),
                ),
                title: 'Dark mode',
                trailing: Switch.adaptive(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.info_rounded,
                iconStyle: IconStyle(
                  backgroundColor: const Color.fromARGB(255, 9, 106, 111),
                ),
                title: 'About this app',
              ),
            ],
          ),
          // You can add a settings title
          SettingsGroup(
            settingsGroupTitle: "Account",
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.exit_to_app_rounded,
                title: "Sign out",
              ),
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.delete_solid,
                title: "Delete account",
                titleStyle: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
