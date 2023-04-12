import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/constant/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

Widget commonTextField({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  String? counterText,
  FormFieldValidator<String>? validation,
  bool needValidation = false,
  bool? urlValidation = false,
  String? validationMessage,
  double? horizontal,
  iconButton,
  Widget? prefixButton,
  Widget? suffix,
  double? vertical,
  double? lcPadding,
  double? tcPadding,
  double? rcPadding,
  double? bcPadding,
  bool readyOnly = false,
  Function? onPressed,
  bool hintTextBold = false,
  bool showBfBorder = true,
  bool showBeBorder = true,
  bool titleTextBold = false,
  bool labelTextBold = false,
  bool fillColor = false,
  bool textAlign = false,
  bool showNumber = false,
  double? hintFontSize,
  double? labelFontSize,
  double? textSize,
  Color? fbColor,
  Color? ebColor,
  Color? hintTextColor,
  Color? labelTextColor,
  Color? textColor,
  int? maxLength,
  int? maxLines,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyBoardTypeEnter,
  bool? isPassWordValidation = false,
  bool? isMobileValidation = false,
  bool? isEmailValidation = false,
  bool? isNameCapital = false,
  bool? isSentence = false,
  bool obscureText = false,
  Function(String?)? onChangedValue,
  TextInputAction? textInputAction,
  double borderRadius = 10,
}) {
  MyColor colors = MyColor();
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    child: TextFormField(
      onChanged: onChangedValue,
      textCapitalization: (isNameCapital ?? false)
          ? TextCapitalization.words
          : TextCapitalization.none,
      obscureText: obscureText,
      controller: controller,
      keyboardType: showNumber ? TextInputType.number : TextInputType.text,
      textAlign: textAlign ? TextAlign.right : TextAlign.start,
      textInputAction: textInputAction ?? TextInputAction.done,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontWeight: titleTextBold ? FontWeight.bold : FontWeight.normal,
        fontSize: textSize ?? 16,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: lcPadding ?? 15,
          top: MySize.getHeight(tcPadding ?? 10),
          right: rcPadding ?? 0,
          bottom: bcPadding ?? 10,
        ),
        suffix: suffix,

        // suffixIconColor: Colors.black,
        fillColor: fillColor ? colors.darkbrown : Colors.transparent,
        focusedBorder: showBfBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fbColor ?? colors.darkbrown,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: fbColor ?? colors.darkbrown,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
        enabledBorder: showBeBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fbColor ?? colors.darkbrown,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
        focusedErrorBorder: showBfBorder
            ? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
        errorBorder: showBeBorder
            ? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
        counterText: counterText == "" ? null : "",
        filled: true,

        suffixIcon: iconButton,
        prefixIcon: prefixButton,
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelTextColor ?? Colors.grey,
          fontWeight: labelTextBold ? FontWeight.bold : FontWeight.normal,
          fontSize: labelFontSize ?? 16,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor ?? colors.black,
          fontWeight: hintTextBold ? FontWeight.bold : FontWeight.w500,
          fontSize: hintFontSize ?? MySize.getHeight(16),
        ),
        border: const OutlineInputBorder(),
      ),
      inputFormatters: inputFormatters ?? [],
      onTap: onPressed as void Function()?,
      maxLength: maxLength,
      readOnly: readyOnly,
      validator: validation,
    ),
  );
}

customTextField(
    {required String hintText,
    required IconData? iconfat,
    TextInputType? keyboardType,
    iconButton,
    String? errorText,
    bool obscureText = false,
    FormFieldValidator? validator,
    required TextEditingController controller,
    Icon? icon}) {
  MyColor colors = MyColor();
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
                padding: const EdgeInsets.only(right: 10),
                child: TextFormField(
                  style: TextStyle(
                      color: colors.black, fontWeight: FontWeight.bold),
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
                    suffixIcon: iconButton,
                    hintText: hintText,
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
              ),
              if (errorText != null && errorText.isNotEmpty)
                const SizedBox(height: 8),
              if (errorText != null && errorText.isNotEmpty)
                Text(errorText, style: const TextStyle(color: Colors.redAccent))
            ],
          ),
        ),
      ),
    ],
  );
}

_customBorder() {
  MyColor colors = MyColor();
  return UnderlineInputBorder(
    borderSide: BorderSide(color: colors.darkbrown),
  );
}

customeDropDown({IconData? iconfat, Widget? dropdown}) {
  MyColor colors = MyColor();
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

profiletext({required IconData? icons, required String heading, String? text}) {
  MyColor colors = MyColor();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              icons,
              size: 18.sp,
              color: colors.darkbrown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              heading,
              style: TextStyle(color: colors.darkbrown, fontSize: 12.sp),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "$text",
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
      ),
      Divider(
        height: 1.h,
        thickness: 1,
      ),
    ],
  );
}

// box.write('mobileno', loginModel.loginData?.mobileNo);
//
// box.write('address', loginModel.loginData?.address);
// box.write('buissness', loginModel.loginData?.business);
// box.write('birthdate', loginModel.loginData?.birthdate);
// box.write('emailid', loginModel.loginData?.emailed);
// box.write('education', loginModel.loginData?.educationId);
// box.write('jati', loginModel.loginData?.gender);
// box.write('gam', loginModel.loginData?.vId);
// box.write('age', loginModel.loginData?.age);
// box.write('ghar', loginModel.loginData?.homeId);
// box.write('merragestatus', loginModel.loginData?.marriedId);
// box.write('bloodgroup', loginModel.loginData?.bName);
// box.write('membercount', loginModel.loginData?.noOfMember);
