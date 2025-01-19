import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/widgets/news_widget.dart';
import 'package:news_app/widgets/source_tap_item.dart';

class SourceTap extends StatefulWidget {
   SourceTap({super.key ,required this.sourceList});
  List<Source> sourceList;

  @override
  State<SourceTap> createState() => _SourceTapState();
}

class _SourceTapState extends State<SourceTap> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: widget.sourceList.length,
     child: Column(
       children: [
         TabBar(
          onTap: (index){
            selectIndex = index;
            setState(() {
              
            });
          },
          dividerColor: Colors.transparent,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs:widget.sourceList.map((source){
          return SourceTapItem(source: source, isActive: selectIndex==widget.sourceList.indexOf(source));
         }).toList()
         ),
         Expanded(child: NewsWidget(source: widget.sourceList[selectIndex]))
       ],
     ));
  }
}