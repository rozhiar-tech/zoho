import 'dart:convert';

import 'package:get/get.dart';
import 'package:zoho/app/data/models/company_model.dart';
import 'package:zoho/app/data/models/job_model_model.dart';
import 'package:http/http.dart' as http;
import 'package:zoho/app/routes/app_pages.dart';

class AllJobsController extends GetxController {
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxList<CompanyModel> companies = <CompanyModel>[].obs;
  var fetchedCompanies = <CompanyModel>[];


  Future fetchJobs() async {
    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/jobs'),
      headers: {"content-type": "application/json"},
    );

    var myJobs = (json.decode(response.body) as List).map((e) => JobModel.fromJson(e)).toList();
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

  @override
  void onInit() async {
    super.onInit();
    await fetchJobs();
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
