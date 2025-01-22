import 'package:flutter/material.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/provider/change_lang_provider.dart';
import 'package:news_app/provider/change_theme_provider.dart';
import 'package:provider/provider.dart';

class BottomBarLang extends StatelessWidget {
  const BottomBarLang({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<ChangeLangProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: InkWell(
              onTap: () {
                languageProvider.changeLang('ar');
                Navigator.pop(context);
              },
              child: languageProvider.currentLang == 'ar'
                  ? getSelectedItem(S.of(context).Arabic)
                  : getUnSelectedItem(S.of(context).Arabic)),
        ),
        InkWell(
          onTap: () {
           languageProvider.changeLang('en');
            Navigator.pop(context);
          },
          child: Container(
              margin: EdgeInsets.all(16),
              child: languageProvider.currentLang == 'en'
                  ? getSelectedItem(S.of(context).English)
                  : getUnSelectedItem(S.of(context).English)),
        ),
      ],
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        Icon(
          Icons.check,
          color: Colors.blue,
          size: 20,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }
}
