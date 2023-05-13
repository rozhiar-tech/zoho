import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
          init: SplashScreenController(),
          builder: (controller) {
            return Stack(
              children: [
                Positioned(
                  top: 100,
                  left: Get.width * 0.4,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        controller.title.value,
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: Get.width * 0.2,
                    height: Get.height * 0.5,
                    color: Colors.blue.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: Get.width * 0.2,
                    height: Get.height * 0.4,
                    color: Colors.blue.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 78,
                  child: Container(
                    width: Get.width * 0.2,
                    height: Get.height * 0.6,
                    color: Colors.yellow.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 79,
                  child: Container(
                    width: Get.width * 0.2,
                    height: Get.height * 0.5,
                    color: Colors.purple.withOpacity(0.5),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Image.asset(
                        'assets/images/splash.png',
                        height: Get.height * 0.5,
                        width: Get.width,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
