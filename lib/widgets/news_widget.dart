import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsWidget extends StatefulWidget {
   NewsWidget({super.key , required this.source});
  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsById(widget.source.id ?? ''),
     builder: (context , snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }else if(snapshot.hasError){
        return Column(children: [
          Text(snapshot.data!.message!),
          ElevatedButton(onPressed: (){
            ApiManager.getNewsById(widget.source.id??'');
            setState(() {
              
            });
          }, child: Text('Try Again'))
        ],);
      }
      if(snapshot.data!.status == 'error'){
        return Column(children: [
          Text(snapshot.data!.message!),
          ElevatedButton(onPressed: (){
            ApiManager.getNewsById(widget.source.id??'');
            setState(() {
              
            });
          }, child: Text('Try Again'))
        ],);
      }
      var articlesList = snapshot.data!.articles;
      return ListView.builder(
        itemCount: articlesList!.length,
        itemBuilder: (context,index){
          return NewsItem(news: articlesList[index]);
        });
     });
  }
}