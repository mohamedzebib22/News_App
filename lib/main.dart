import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/models/theme_model.dart';
import 'package:news_app/provider/change_lang_provider.dart';
import 'package:news_app/provider/change_theme_provider.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/screens/webview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) =>ChangeLangProvider()),
    ChangeNotifierProvider(create: (context) =>ChangeThemeProvider())
  ],child: const News_App()));
}

class News_App extends StatefulWidget {
  const News_App ({super.key});

  @override
  State<News_App> createState() => _News_AppState();
}

class _News_AppState extends State<News_App> {

  
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<ChangeLangProvider>(context);
    var themeProvider = Provider.of<ChangeThemeProvider>(context);
    return MaterialApp(
      theme: ThemeModel.ligtTheme,
      darkTheme: ThemeModel.drakTheme,
      themeMode: themeProvider.appTheme,

      locale: Locale(languageProvider.currentLang),

      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        WebviewScreen.id :(context) => WebviewScreen(), 
        HomePage.id : (context) => HomePage(),
      },
      home: HomePage(),
    );
  }
}

