import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_candidates_controller.dart';

class ViewCandidatesView extends GetView<ViewCandidatesController> {
  const ViewCandidatesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ViewCandidatesController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                controller.title.value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xffF7F7F7),
              elevation: 0,
            ),
            body: SizedBox(
              height: Get.height * 0.9,
              width: Get.width,
              child: ListView.builder(
                itemCount: controller.applications.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(controller.students[index].pictureUrl.toString()),
                          ),
                          title: Text(controller.students[index].username.toString()),
                          subtitle: Text(controller.students[index].email.toString()),
                          trailing: ElevatedButton(
                            onPressed: () {
                              controller.viewCv(controller.applications[index].cvLink.toString());
                            },
                            child: const Text('View CV'),
                          ),
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
