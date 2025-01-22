import 'package:flutter/material.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/provider/change_theme_provider.dart';
import 'package:provider/provider.dart';

class BottomBarTheme extends StatelessWidget {
  const BottomBarTheme({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ChangeThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: themeProvider.appTheme == ThemeMode.dark
                  ? getSelectedItem(S.of(context).Dark)
                  : getUnSelectedItem(S.of(context).Dark)),
        ),
        InkWell(
          onTap: () {
            themeProvider.changeTheme(ThemeMode.light);
            Navigator.pop(context);
          },
          child: Container(
              margin: EdgeInsets.all(16),
              child: themeProvider.appTheme == ThemeMode.light
                  ? getSelectedItem(S.of(context).Light)
                  : getUnSelectedItem(S.of(context).Light)),
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
