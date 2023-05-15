import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/confirm_email_controller.dart';

class ConfirmEmailView extends GetView<ConfirmEmailController> {
  const ConfirmEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ConfirmEmailController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Verify Email',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              elevation: 0,
              backgroundColor: Color(0xffF8F8F8),
              shadowColor: Colors.transparent,
              centerTitle: true,
            ),
            backgroundColor: Color(0xffF8F8F8),
            body: Center(
              child: Column(
                children: [
                  Text(
                    controller.confirmEmailTitle.value,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.verifyEmail();
                    },
                    child: Text('I have verified my email'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
