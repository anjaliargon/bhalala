import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/helpline_controller.dart';

class HelplineView extends GetView<HelplineController> {
  const HelplineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.darkbrown,
        title: const Text('એપ્લિકેશન હેલ્પલાઇન '),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.h,),
          GestureDetector(
            onTap: () {
              _launchURLargon();
            },
            child: Container(
              child: Image.asset("assets/images/company.png"),
            ),
          ),
          Flexible(
                  child: Text(
                    "જીગ્નેશ ભાલાળા  - શક્તિનગર",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
          Flexible(
              child: Text(
                "મોબાઈલ નંબર : +91 99787 79471",
                style: TextStyle(fontSize: 12.sp),
              )),
          SizedBox(height: 12.h,),
          Divider(color: colors.darkbrown,height: 1,thickness: 0.5,),
          SizedBox(height: 5.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _launchURLaser();
              },
              child: Container(
                child: Image.asset("assets/images/jwalin.png"),
              ),
            ),
          ),
          SizedBox(height: 4.h,),
          Flexible(
              child: Text(
                "હર્ષભાઈ ભાલાળા  - ભુવા",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          Flexible(
              child: Text(
                "મોબાઈલ નંબર : +91 95588 12094",
                style: TextStyle(fontSize: 12.sp),
              )),
        ],
      )),
    );
  }

  _launchURLargon() async {
    const url = 'https://www.argoninfotech.com/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLaser() async {
    const url = 'http://www.jwalinlaser.com/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchMap(String address) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
