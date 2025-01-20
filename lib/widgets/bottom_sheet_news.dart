import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomSheetNews extends StatelessWidget {
  BottomSheetNews(
      {super.key,
      required this.image,
      required this.desc,
      required this.onTap});
  String image;
  String desc;
  VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              fit: BoxFit.fill,
              height: height * .25,
            ),
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 18, color: Colors.white),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          CustomButton(
            onTap: onTap,
            title: 'VeiwAll',
            width: double.infinity,
            itemColor: Colors.white,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
