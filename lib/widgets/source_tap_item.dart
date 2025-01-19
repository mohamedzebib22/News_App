import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';

class SourceTapItem extends StatelessWidget {
   SourceTapItem({super.key , required this.source ,required this.isActive});
  Source source;
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return Text(source.name??'',style: TextStyle(
      fontSize: isActive ? 18 : 14
    ), );
  }
}