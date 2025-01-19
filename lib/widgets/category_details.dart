import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/widgets/show_dialog_msg.dart';
import 'package:news_app/widgets/source_tap.dart';
import 'package:quickalert/quickalert.dart';

class CategoryDetails extends StatefulWidget {
   CategoryDetails({super.key ,required this.categoryModel});
  CategoryModel categoryModel;
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getResponse(id: widget.categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getResponse(id: widget.categoryModel.id);
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          if (snapshot.data!.status == 'error') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getResponse(id: widget.categoryModel.id);
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          var sourceList = snapshot.data!.sources;
          return SourceTap(sourceList: sourceList!);
          // return ListView.builder(
          //   itemCount: sourceList!.length,
          //   itemBuilder: (context ,index){
          //     return Text(sourceList[index].name??'');
          //   });
        });
  }
}
