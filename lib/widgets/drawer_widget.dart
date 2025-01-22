import 'package:flutter/material.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/provider/change_lang_provider.dart';
import 'package:news_app/provider/change_theme_provider.dart';
import 'package:news_app/widgets/bottom_bar_lang.dart';
import 'package:news_app/widgets/bottom_bar_theme.dart';
import 'package:news_app/widgets/change_theme_and_lang.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({super.key ,required this.onTap});
  VoidCallback onTap;
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ChangeThemeProvider>(context);
    var langeuageProvider = Provider.of<ChangeLangProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: width * 0.68,
            height: height * 0.19,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text(
                S.of(context).NewsApp,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Row(
            children: [
              Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(
            width: width * .02,
          ),
              InkWell(
                onTap: widget.onTap,
                child: Text(
                  S.of(context).GoToHome,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          Divider(
            thickness: 2,
            indent: 8,
            endIndent: 8,
          ),
          SizedBox(
            height: height * .02,
          ),
          Text(
            S.of(context).Theme,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          ChangeThemeAndLang(
              onTap: bottomBarTheme,
              text: themeProvider.appTheme == ThemeMode.light
                  ? S.of(context).Light
                  : S.of(context).Dark),
          SizedBox(
            height: height * .02,
          ),
          Divider( thickness: 2,
            indent: 8,
            endIndent: 8,),
          Text(
            S.of(context).language,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          ChangeThemeAndLang(
              onTap: bottomBarLang,
              text: langeuageProvider.currentLang == 'en'
                  ? S.of(context).English
                  : S.of(context).Arabic)
        ],
      ),
    );
  }

  void bottomBarTheme() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomBarTheme();
        });
  }

  void bottomBarLang() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomBarLang();
        });
  }
}
