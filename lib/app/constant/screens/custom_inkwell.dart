import 'package:flutter/material.dart';

inkWell({required Widget child,required GestureTapCallback onTap}){
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor:  Colors.transparent,
    focusColor: Colors.transparent,
     overlayColor: MaterialStateProperty.all( Colors.transparent),
    onTap: onTap,
    child: child,
  );
}