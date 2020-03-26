import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

getWidgetText(text, [fontWeight,fontSize,color,textAlign]){
  if (fontSize == null){
    fontSize = 14;
  }
  if (fontWeight == null){
    fontWeight = FontWeight.normal;
  }
  if (color == null){
    color = Colors.black;
  }
  if (textAlign == null){
    textAlign = TextAlign.left;
  }

  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color
    ),
  );
}