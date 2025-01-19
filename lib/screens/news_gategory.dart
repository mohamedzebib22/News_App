import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/veiw_news_gategory.dart';

class NewsGategory extends StatelessWidget {
  NewsGategory({super.key, required this.viewNewsByCategory});
  Function viewNewsByCategory;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var categoryList = CategoryModel.allImage;

    return SafeArea(
      child: Scaffold(
        
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Good Morning\nHere is Some News For You',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.01),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Stack(
                            alignment: index % 2 == 0
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(categoryList[index].image),
                              ),
                              InkWell(
                                
                                  onTap: () {
                                    viewNewsByCategory(categoryList[index]);
                                  },
                                  child: VeiwNewsGategory()),
                            ]),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
