import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/provider/change_lang_provider.dart';
import 'package:news_app/provider/change_theme_provider.dart';
import 'package:news_app/screens/news_gategory.dart';
import 'package:news_app/widgets/category_details.dart';
import 'package:news_app/widgets/custom_text_feild.dart';
import 'package:news_app/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
  String wordSearch = '';
  List<News> searchResults = [];
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ChangeThemeProvider>(context);
    var languageProvider = Provider.of<ChangeLangProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: InkWell(
            onTap: () {
              print('The language is ${languageProvider.currentLang}');
            },
            child: DrawerWidget(onTap: () { 
              selectCategoryModel = null;
               Navigator.pop(context);
               setState(() {});
             },)),
        // InkWell(
        //     onTap: () {
        //       selectCategoryModel = null;
        //       Navigator.pop(context);
        //       setState(() {});
        //     },
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(vertical: height * 0.05),
        //       child: Text('GoBack'),
        //     )),
      ),
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        title: isSearch
            ? CustomTextFeild(
                hintText: 'Search',
                // onChanged: (value) {
                //   wordSearch = value;
                //   if (wordSearch.isEmpty) {
                //     searchByTitle(value);
                //   } else {
                //     searchResults.clear();
                //   }
                //   setState(() {});
                // },
              )
            : Text('Home'),
        actions: [
          InkWell(
              onTap: () {
                isSearch = !isSearch;
                setState(() {});
              },
              child: Icon(Icons.search)),
        ],
        centerTitle: true,
      ),
      body: selectCategoryModel == null
          ? NewsGategory(viewNewsByCategory: viewNewsByCategory)
          : CategoryDetails(
              categoryModel: selectCategoryModel!,
            ),
    );
  }

  CategoryModel? selectCategoryModel;

  void viewNewsByCategory(CategoryModel newSelectCategory) {
    selectCategoryModel = newSelectCategory;
    print('selectCategoryModel == ${selectCategoryModel!.id}');
    setState(() {});
  }

  // void searchByTitle(String word) async {
  //   try {
  //     var response = await ApiManager.searchWithApi(word);
  //     {
  //       if (response != null && response.articles != null) {
  //         searchResults = response.articles!;

  //         setState(() {});
  //       }
  //       print('THe search is ${response!.articles}');
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
