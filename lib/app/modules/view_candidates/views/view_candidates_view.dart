import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_candidates_controller.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ViewCandidatesView extends GetView<ViewCandidatesController> {
  const ViewCandidatesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ViewCandidatesController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(controller.title.value),
              centerTitle: true,
            ),
            body: Container(
              height: Get.height * 0.9,
              width: Get.width,
              child: ListView.builder(
                itemCount: controller.applications.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    child: Card(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.launchURL(
                              controller.applications[index]['Cv_link']);
                        },
                        child: Text('View CV'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
