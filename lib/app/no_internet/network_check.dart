import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../constant/screens/custom_inkwell.dart';
import '../constant/toast.dart';


class InternetConnectionCheck extends StatefulWidget {
  const InternetConnectionCheck({
    Key? key,
  }) : super(key: key);

  @override
  _InternetConnectionCheckState createState() => _InternetConnectionCheckState(
    //    className: className,
  );
}

class _InternetConnectionCheckState extends State<InternetConnectionCheck> {
//Show dialog if user not connected to an check_network
  _showDialog({
    text,
    context,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
            actions: [
              inkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InternetConnectionCheck(),
                        ));
                  },
                  child: inkWell(
                      onTap: () async {
                        var result = await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.none) {
                          showBottomLongToast(
                              "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો");
                        } else {
                          showBottomLongToast(
                              "You are connected to network!");
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "okay",
                        ),
                      )))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("કનેકશન મળ્યું નથી",
                        style: TextStyle(
                            fontSize: 20, color: Colors.black)),
                    const SizedBox(height: 5),
                    inkWell(
                        onTap: () async {
                          var result = await Connectivity().checkConnectivity();
                          if (result == ConnectivityResult.none) {
                            return _showDialog(
                              context: context,
                              text: "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો",
                            );
                          } else {
                            showBottomLongToast("Not connected!");
                          }
                        },
                        child: const Text("Refresh",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.brown,
                                decoration: TextDecoration.underline))),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
