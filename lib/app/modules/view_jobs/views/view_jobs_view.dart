import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_jobs_controller.dart';

class ViewJobsView extends GetView<ViewJobsController> {
  const ViewJobsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewJobsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewJobsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
