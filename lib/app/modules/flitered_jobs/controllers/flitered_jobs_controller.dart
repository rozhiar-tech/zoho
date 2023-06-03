import 'dart:convert';

import 'package:get/get.dart';
import 'package:zoho/app/data/models/company_model.dart';
import 'package:zoho/app/data/models/job_model_model.dart';
import 'package:http/http.dart' as http;
import 'package:zoho/app/routes/app_pages.dart';

class FliteredJobsController extends GetxController {
  RxString titleText = 'Filtered Jobs'.obs;
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxList<CompanyModel> companies = <CompanyModel>[].obs;
  var fetchedCompanies = <CompanyModel>[];

  getCompany(index) async {
    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/company/$index'),
      headers: {"content-type": "application/json"},
    );
    // return the logo
    var result = (json.decode(response.body) as List).map((e) => CompanyModel.fromJson(e)).toList();
    return result[0];
  }

  goToJobDetails(index) async {
    Get.toNamed(Routes.SINGLE_JOB, arguments: [jobs[index], companies[index]]);
  }

  companyDetails(index) async {
    Get.toNamed(Routes.COMPANY_PROFILE, arguments: companies[index]);
  }

  Future getCompaniesByIds(ids) async {
    final response = await http.post(
      Uri.parse('http://52.20.124.191:4000/api/company_by_ids'),
      headers: {"content-type": "application/json"},
      body: jsonEncode({
        "ids": ids,
      }),
    );
    
    fetchedCompanies = (json.decode(response.body) as List).map((e) => CompanyModel.fromJson(e)).toList();
  }

  @override
  void onInit() async {
    super.onInit();
    var myJobs = Get.arguments;
    // myJobs += myJobs;
    var ids = myJobs.map((e) => e.companyId).toSet().toList();

    await getCompaniesByIds(ids);

    // loop through the jobs and count the fulltime and parttime jobs
    for (var i = 0; i < myJobs.length; i++) {
      var company = fetchedCompanies.firstWhere((element) => element.companyId == myJobs[i].companyId);
      companies.add(company);
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
