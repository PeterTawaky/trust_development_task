import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust_development_task/locale_keys.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Provider.of<Locale>(context);
    final onLocaleChange = Provider.of<Function(Locale)>(context);
    final themeMode = Provider.of<ThemeMode>(context);
    final onThemeChange = Provider.of<Function(ThemeMode)>(context);

    bool isArabic = currentLocale.languageCode == 'ar';
    bool isDarkMode = themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.account,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language / اللغة'),
                  subtitle: Text(isArabic ? 'العربية' : 'English'),
                  trailing: Switch(
                    value: isArabic,
                    onChanged: (value) {
                      onLocaleChange(
                        value ? const Locale('ar') : const Locale('en'),
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  ),
                  title: const Text('Dark Mode / الوضع المظلم'),
                  subtitle: Text(isDarkMode ? 'On' : 'Off'),
                  trailing: Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      onThemeChange(value ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
