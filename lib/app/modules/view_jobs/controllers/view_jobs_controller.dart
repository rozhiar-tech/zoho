import 'dart:convert';

import 'package:get/get.dart';
import 'package:zoho/app/data/models/company_model.dart';
import 'package:zoho/app/data/models/job_model_model.dart';
import 'package:http/http.dart' as http;

class ViewJobsController extends GetxController {
  RxString title = 'ALL POSTED JOBS'.obs;
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxList<CompanyModel> companies = <CompanyModel>[].obs;

  viewCandidates(index) {
    Get.toNamed('/view-candidates', arguments: [jobs[index], companies[index]]);
  }

  @override
  void onInit() async {
    super.onInit();
    var myJobs = Get.arguments[0];
    for (var i = 0; i < myJobs.length; i++) {
      var company = Get.arguments[1];
      companies.add(company.value);
    }
    jobs.value = myJobs;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
