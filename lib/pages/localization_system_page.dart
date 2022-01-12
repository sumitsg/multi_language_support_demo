import 'package:flutter/material.dart';
import 'package:multi_language_support_demo/main.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:multi_language_support_demo/widget/language_picker_widget.dart';

class LocalizationSystemPage extends StatefulWidget {
  const LocalizationSystemPage({Key? key}) : super(key: key);

  @override
  _LocalizationSystemPageState createState() => _LocalizationSystemPageState();
}

class _LocalizationSystemPageState extends State<LocalizationSystemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageWidget(),
            const SizedBox(
              height: 32,
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context)!.helloWorld,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
