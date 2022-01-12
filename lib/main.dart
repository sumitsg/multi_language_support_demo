import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_language_support_demo/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:multi_language_support_demo/pages/localization_app_page.dart';
import 'package:multi_language_support_demo/pages/localization_system_page.dart';
import 'package:multi_language_support_demo/provider/local_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Multi Language';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);

          return MaterialApp(
            title: title,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.deepPurpleAccent.shade100,
              primarySwatch: Colors.purple,
            ),
            // ? new
            locale: provider.locale,
            supportedLocales: L10n.all,
            // ? help to access all translation from generated files
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: const MainPage(),
          );
        });
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomBar(),
      body: buildPages(),
    );
  }

  Widget buildBottomBar() {
    const style = const TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Text(
            'Localization',
            style: style,
          ),
          label: 'System',
        ),
        BottomNavigationBarItem(
            icon: Text(
              'Localization',
              style: style,
            ),
            label: 'App'),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const LocalizationSystemPage();
      case 1:
        return const LocalizationAppPage();
      default:
        return Container();
    }
  }
}
