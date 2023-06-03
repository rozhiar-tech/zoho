import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/application_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewCandidatesController extends GetxController {
  //TODO: Implement ViewCandidatesController

  RxList applications = [].obs;
  final count = 0.obs;
  RxString title = 'View Candidates'.obs;
  var job;

  Future getApplicationsWithId(id) async {
    //convert the id to Integer
    // int.parse(id);
    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/applications_for_job/$id'),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      // applications.value = (jsonDecode(response.body) as List)
      //     .map((e) => Application.fromJson(e))
      //     .toList();
      applications.value = jsonDecode(response.body);
    } else {
      // print(response.body);
      Get.snackbar('Error', response.body);
    }
  }

  launchURL(url2) async {
    final Uri url = Uri.parse(url2);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch url');
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    job = Get.arguments[0];
    await getApplicationsWithId(3);
    print(applications);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void complete(PDFViewController pdfViewController) {}
}
