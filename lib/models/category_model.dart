import 'package:news_app/constant/const.dart';

class CategoryModel {
  String image;
  String id;
  CategoryModel({required this.image , required this.id});

  static List<CategoryModel> allImage = [
    CategoryModel(image: general,id: 'general'),
    CategoryModel(image: businness ,id:'business'),
    CategoryModel(image: sport ,id :'sports'),
    CategoryModel(image: technology ,id: 'technology'),
    CategoryModel(image: sceince ,id: 'science'),
    CategoryModel(image: health ,id: 'health'),
    CategoryModel(image: entertainment , id: 'entertainment'),
  ];
}
