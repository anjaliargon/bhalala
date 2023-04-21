import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/Color.dart';
import '../../constant/String_constant.dart';

class ParivarSahyogView extends StatelessWidget {
  ParivarSahyogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colors.darkbrown,
        title: Text(StringConstant.parivarsahyoug),
      ),
      // body: ListView.builder(
      //   itemCount: controller.samitiData.value.data?.length,
      //   shrinkWrap: true,
      //   physics: NeverScrollableScrollPhysics(),
      //   itemBuilder: (context, index) {
      //     return Slidable(
      //       endActionPane: ActionPane(
      //         extentRatio: 0.2,
      //         motion: const ScrollMotion(),
      //         children: [
      //           SlidableAction(
      //             onPressed: (context) {
      //               UrlLauncher.launch(
      //                   'tel:${controller.samitiData.value.data?[index].phone}');
      //             },
      //             backgroundColor: colors.green,
      //             icon: Icons.call,
      //             foregroundColor: colors.darkbrown,
      //           ),
      //         ],
      //       ),
      //       child: Column(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Row(
      //               children: [
      //                 Column(
      //                   children: [
      //                     Container(
      //                       height: 10.h,
      //                       width: 20.w,
      //                       decoration: BoxDecoration(
      //                           border: Border.all(
      //                               color: colors.darkbrown)),
      //                       child: Image.network(
      //                         "${controller.samitiData.value.data?[index].picture}",
      //                         fit: BoxFit.fill,
      //                         errorBuilder: (a, b, c) => Image.asset(
      //                             'assets/images/userprofile.png'),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 1.h,
      //                     ),
      //                     Text(
      //                         "${controller.samitiData.value.data?[index].villageName}",
      //                         style: TextStyle(
      //                             color: colors.darkbrown,
      //                             fontWeight: FontWeight.bold)),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   width: 5.w,
      //                 ),
      //                 Column(
      //                   crossAxisAlignment:
      //                       CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "${controller.samitiData.value.data?[index].name}",
      //                       style: TextStyle(
      //                           fontSize: 13.sp,
      //                           color: colors.darkbrown,
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                     SizedBox(
      //                       height: 1.h,
      //                     ),
      //                     Text(
      //                         "મોબાઇલ નંબર :${controller.samitiData.value.data?[index].phone}",
      //                         style: const TextStyle()),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Divider(
      //             thickness: 2,
      //             height: 1,
      //             color: colors.darkbrown,
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
