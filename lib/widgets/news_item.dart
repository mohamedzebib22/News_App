import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .02),
      margin: EdgeInsets.all(6),
      width: width * 0.91,
      height: height * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              news.urlToImage ?? 'asset/images/general.png',
              fit: BoxFit.fill,
              height: height * .25,
            ),
          ),
          Text(
            news.title ?? '',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Text(
            'By:${news.author ?? ''}',
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
