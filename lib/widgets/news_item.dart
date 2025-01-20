import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/screens/webview_screen.dart';
import 'package:news_app/widgets/bottom_sheet_news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsItem extends StatefulWidget {
  NewsItem({super.key, required this.news});
  News news;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
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
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.black,
                  context: context,
                  builder: (context) {
                    return BottomSheetNews(
                      image:
                          widget.news.urlToImage ?? 'asset/images/general.png',
                      desc: widget.news.description ?? '',
                      onTap: () {
                        Navigator.pushNamed(context, WebviewScreen.id,arguments: widget.news);
                      },
                    );
                  });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.news.urlToImage ?? 'asset/images/general.png',
                fit: BoxFit.fill,
                height: height * .25,
              ),
            ),
          ),
          Text(
            widget.news.title ?? '',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Text(
            'By:${widget.news.author ?? ''}',
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
