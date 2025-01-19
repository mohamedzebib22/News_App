import 'package:flutter/material.dart';

class VeiwNewsGategory extends StatelessWidget {
  const VeiwNewsGategory({super.key});

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
      padding:EdgeInsets.symmetric(horizontal: width*0.005) ,
      width: width*0.30,
      height: height*0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(84),
        color: Colors.grey
      ),
      child: Row(children: [
        Text('ViewAll', style: TextStyle(color: Colors.white,fontSize: 14),),
        Spacer(),
        CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.arrow_forward_ios_outlined ,color: Colors.white,),)
      ],),
    );
  }
}
/**
 height : .075
 width : 42
 */