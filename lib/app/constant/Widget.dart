import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';


customTextField({required String hintText, required IconData?iconfat,
  TextInputType? keyboardType,
   IconButton? suffixicon,
  String? errorText,
  bool obscureText=false,
  FormFieldValidator? validator,required TextEditingController controller,Icon? icon}) {
  MyColor  colors = MyColor();
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: FaIcon(
            iconfat,
            color: colors.darkbrown,
            size: 20.sp,
          ),
        ),
      ),
      Expanded(
        flex: 8,
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: errorText != null && errorText.isNotEmpty ? 5 : 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right:10),
                child: TextFormField(
                  style: TextStyle(color: colors.black,fontWeight: FontWeight.bold),
                  cursorColor: colors.darkbrown,
                  keyboardType: keyboardType ?? TextInputType.text,
                  obscureText: obscureText,
                  validator: validator,
                  controller: controller,
                  decoration: InputDecoration(
                    icon: icon,
                    errorBorder: _customBorder(),
                    disabledBorder: _customBorder(),
                    focusedBorder: _customBorder(),
                    enabledBorder: _customBorder(),
                    focusedErrorBorder: _customBorder(),
                    border: InputBorder.none,
                    suffixIcon: suffixicon,
                    hintText: hintText,

                    hintStyle:   TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp

                    ),
                  ),
                ),
              ),
              if( errorText != null && errorText.isNotEmpty)
                const SizedBox(height: 8),
              if( errorText != null && errorText.isNotEmpty)
                Text(errorText, style: const TextStyle(color: Colors.redAccent))
            ],
          ),
        ),
      ),
    ],
  );
}
_customBorder() {
  MyColor  colors = MyColor();
  return UnderlineInputBorder(
      borderSide: BorderSide(color: colors.darkbrown ),
  );
}
customeDropDown({required  IconData?iconfat,Widget ? dropdown}){
  MyColor  colors = MyColor();
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: FaIcon(
            iconfat,
            color: colors.darkbrown,
            size: 20.sp,
          ),
        ),
      ),
      Expanded(
        flex: 8,
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 15),
          child: dropdown,
        ),
      ),
    ],
  );
}
profiletext({required  IconData?icons, required String heading, String? text}){
  MyColor  colors = MyColor();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(icons,size:18.sp,color: colors.darkbrown,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(heading,style: TextStyle(color: colors.darkbrown,fontSize: 12.sp),),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text("$text",style: TextStyle(fontSize: 12.sp,),),
      ),
      Divider(
        height: 1.h,
        thickness: 1,
      ),
    ],
  );
}