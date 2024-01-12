 import 'package:flutter/material.dart';
import 'package:healthid/language/localizations/localizations.dart';
import '../language/localizations/localezations_constant.dart';
import '../main.dart';

class LanguagePopup extends StatefulWidget {
  const LanguagePopup({Key? key}) : super(key: key);

  @override
  _LanguagePopupState createState() => _LanguagePopupState();
}

class _LanguagePopupState extends State<LanguagePopup> {
  final List<String> languages = [
    'English',
    'کوردی',
    'عرەبی'
  ];

  void _changeLanguage(language) async {
    Locale _locale = await setLocale(language);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select language'.tr(context)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemList(languages[index], index);
        },
      ),
    );
  }

  Widget _itemList(d, index) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.language),
          title: Text(d),
          onTap: () async {
            if (index == 0) {
              _changeLanguage('en');
              // context.locale = Locale('en');
            } else if (index == 1) {
              _changeLanguage('ku');
              // context.locale = Locale('en');
            } else {
              _changeLanguage('ar');
              // context.locale =  Locale('ku');//Locale('es');
            }
            Navigator.pop(context);
          },
        ),
        Divider()
      ],
    );
  }
}
