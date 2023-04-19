import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/family_add_controller.dart';

class FamilyAddView extends GetView<FamilyAddController> {
  const FamilyAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.darkbrown,
        title: const Text('Add Members'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FamilyAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
