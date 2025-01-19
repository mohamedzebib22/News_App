import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/news_gategory.dart';
import 'package:news_app/widgets/category_details.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: InkWell(
            onTap: () {
              selectCategoryModel = null;
              Navigator.pop(context);
              setState(() {});
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical:height * 0.05 ),
              child: Text('GoBack'),
            )),
      ),
      appBar: AppBar(
        toolbarHeight: height * 0.03,
        title: Text('Home'),
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
}
