import 'package:flutter/material.dart';

class ChangeThemeAndLang extends StatelessWidget {
   ChangeThemeAndLang({super.key , required this.onTap,required this.text});
  VoidCallback onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.009 ,horizontal: width*.02),
            width: width * 0.60,
            height: height * 0.06,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
            ),
            child: InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    Text(
                        style: TextStyle(color: Colors.white,fontSize: 18),
                        text),
                    Spacer(),
                    Icon(Icons.arrow_drop_down,color: Colors.white,)
                  ],
                )),
          );
  }
}