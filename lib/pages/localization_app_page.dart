import 'package:flutter/material.dart';
import 'package:multi_language_support_demo/main.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:multi_language_support_demo/widget/language_picker_widget.dart';

class LocalizationAppPage extends StatefulWidget {
  const LocalizationAppPage({Key? key}) : super(key: key);

  @override
  _LocalizationAppPageState createState() => _LocalizationAppPageState();
}

class _LocalizationAppPageState extends State<LocalizationAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
        actions: [
          LanguagePickerWidget(),
          const SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageWidget(),
            const SizedBox(height: 32),
            Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.hello('User'),
              style: TextStyle(fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }
}
