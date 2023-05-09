import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_candidates_controller.dart';

class ViewCandidatesView extends GetView<ViewCandidatesController> {
  const ViewCandidatesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewCandidatesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewCandidatesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
