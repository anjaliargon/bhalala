import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'helper/helper.dart';

const EMAIL_REGEX =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const PASSWORD_REGEX =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

class CustomeTextFields extends StatefulWidget {
  TextEditingController fieldValue;
  var label;
  int? no = 10;
  String hint;
  var icon;
  bool validation;
  var number;
  var isReadonly;
  int keyboard;
  var iconfat;

  CustomeTextFields(
      {Key? key,
      required this.fieldValue,
      required this.hint,
      required this.iconfat,
      this.icon,
      this.number,
      required this.validation,
      required this.keyboard,
      this.label,
      this.isReadonly,
      this.no})
      : super(key: key);

  @override
  State<CustomeTextFields> createState() => _CustomeTextFieldsState();
}

class _CustomeTextFieldsState extends State<CustomeTextFields> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2026));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        widget.fieldValue.text = Helper.localDate(currentDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: FaIcon(
              widget.iconfat,
              color: colors.darkbrown,
              size: 20.sp,
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 15),
            child: TextFormField(
                style:
                    TextStyle(color: colors.black, fontWeight: FontWeight.bold),
                controller: widget.fieldValue,
                validator: widget.validation
                    ? (fieldValue) {
                        if (fieldValue == null || fieldValue.isEmpty) {
                          return '${widget.hint}';
                        } else if (widget.keyboard == 1 &&
                            (fieldValue.length < 10)) {
                          return 'Incorrect Input';
                        } else if (widget.keyboard == 3 &&
                            !RegExp(EMAIL_REGEX).hasMatch(fieldValue)) {
                          return 'incorrect email';
                        } else if (widget.keyboard == 2 &&
                            !RegExp(PASSWORD_REGEX).hasMatch(fieldValue)) {
                          return 'Wrong password';
                        } else if (widget.keyboard == 5 &&
                            (fieldValue.length < 6)) {
                          return 'Provide Correct Input';
                        }
                        return null;
                      }
                    : null,
                obscureText: widget.keyboard == 2 ? true : false,
                maxLength: widget.keyboard == 1
                    ? 10
                    : widget.keyboard == 5
                        ? 6
                        : null,
                maxLines: 1,
                keyboardType: widget.keyboard == 1 || widget.keyboard == 5
                    ? TextInputType.phone
                    : TextInputType.text,
                inputFormatters: widget.keyboard == 1 || widget.keyboard == 5
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    : null,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colors.darkbrown),
                    ),
                    labelText: widget.label,
                    hintText: widget.hint,
                    hintStyle:  TextStyle(color: colors.grey),
                    labelStyle: const TextStyle(color: Colors.green),
                    // errorBorder: const OutlineInputBorder(
                    //   // borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: Colors.red, width: 1.5),
                    // ),
                    // disabledBorder: const OutlineInputBorder(
                    //   // borderRadius: BorderRadius.circular(10),
                    //   borderSide:
                    //   BorderSide(color: Colors.black, width: 1.5),
                    // ),
                    // border: const OutlineInputBorder(
                    //   // borderRadius: BorderRadius.circular(10),
                    //   borderSide:
                    //   BorderSide(color: Colors.brown, width: 1.5,),
                    // ),
                    // suffixIcon: Icon(widget.icon))),
                    suffixIcon: widget.icon != null &&
                            widget.icon == Icons.calendar_today_rounded
                        ? GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Icon(widget.icon),
                          )
                        : Icon(widget.icon))),
          ),
        ),
      ],
    );
  }
}
