
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild(
      {super.key,
      required this.hintText,
      this.prefix,
      this.text,
      this.sufix,
      this.textStyle,
      this.borderColor = Colors.blue,
      this.maxLines = 1,
      this.onChanged,
      this.validator});

  MyValidator? validator;
  String hintText;
  String? text;
  Widget? prefix;
  Widget? sufix;
  TextStyle? textStyle;
  Color? borderColor;
  int maxLines;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      initialValue: text,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle,
        prefixIcon: prefix,
        suffixIcon: sufix,
        filled: true,
        fillColor: Colors.blue,
        disabledBorder: makeAllBorder(color: Colors.grey, radius: 24),
        enabledBorder: makeAllBorder(color: borderColor!, radius: 24),
        focusedBorder:
            makeAllBorder(color: Colors.blue, radius: 24),
        focusedErrorBorder:
            makeAllBorder(color: Colors.red, radius: 24),
        errorBorder: makeAllBorder(color: Colors.red, radius: 24),
      ),
      
    );
  }

  OutlineInputBorder makeAllBorder(
      {required Color color, required double radius}) {
    return OutlineInputBorder(
        
        borderSide: BorderSide(color: color ,
        
        ),
        borderRadius: BorderRadius.circular(radius));
  }
}
