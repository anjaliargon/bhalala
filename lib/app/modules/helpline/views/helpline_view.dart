import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/images/company.png"),
          ),
          Flexible(
              child: TextButton(
                  onPressed: () {
                    launchMap(
                        'Argon Infotech, Dhanmora Rd, Katargam, Surat, Gujarat 395004');
                  },
                  child: Text(
                    "Argon Infotech™\n304,3rd Floor,Oasis Corner,\nDhanmora Char Rasta,Katargam,\nSurat,Gujarat-395004",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))),
          Flexible(
              child: TextButton(
            child: Text(
              "https://www.argoninfotech.com/",
              style: TextStyle(fontSize: 12.sp),
            ),
            onPressed: () {
              _launchURL();
            },
          ))
        ],
      )),
    );
  }

  _launchURL() async {
    const url = 'https://www.argoninfotech.com/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchMap(String address) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
