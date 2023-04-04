import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Color.dart';

class LoadingAndErrorScreen extends StatelessWidget {
  const LoadingAndErrorScreen({
    Key? key,
    required bool isLoading,
    required bool errorOccurred,
    required Function errorResolvingFunction,
    required Widget child,
  })  : _isLoading = isLoading,
        _errorOccurred = errorOccurred,
        _errorResolvingFunction = errorResolvingFunction,
        _child = child,
        super(key: key);

  final bool _isLoading;
  final bool _errorOccurred;
  final Widget _child;
  final Function _errorResolvingFunction;

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    Size size = MediaQuery.of(context).size;

    buildLoadingScreen() => Container(
          color: colors.white,
          alignment: Alignment.center,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: colors.darkbrown,

                strokeWidth: 5,
              ),
              SizedBox(width: 10.w,),
              Text("મેહરબાની કરી ને રાહ જોવો",style: TextStyle(fontSize: 14.sp),)
            ],
          ),
        );

    buildErrorScreen() => Container(
          width: double.infinity,
          color: colors.darkbrown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                "Something Went Wrong",
                style: TextStyle(
                  color: colors.darkbrown,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  _errorResolvingFunction();
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors.darkbrown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Text(
                    "Retry",
                    style: TextStyle(
                      color: colors.darkbrown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child: const CircularProgressIndicator(
          //   color: Colors.green,
          //   strokeWidth: 2,
          // ),
        );

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                _child,
                if (_isLoading) buildLoadingScreen(),
                if (_errorOccurred) buildErrorScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
