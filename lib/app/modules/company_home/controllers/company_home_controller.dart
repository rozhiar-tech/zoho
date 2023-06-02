import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoho/app/data/models/company_model.dart';
import 'package:zoho/app/data/models/job_model_model.dart';
import 'package:zoho/app/data/models/application_model.dart';
import 'package:zoho/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class CompanyHomeController extends GetxController {
  RxString title = ''.obs;
  Rx<CompanyModel> company = CompanyModel().obs;
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxList<Application> applications = <Application>[].obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  RxInt jobsPosted = 0.obs;
  RxInt candidatesApplied = 0.obs;
  RxInt fullTime = 0.obs;

  goToCreateJob() {
    Get.toNamed(Routes.CREATE_JOB, arguments: company.value.companyId);
  }



  Future getCompanyInfo() async {
    // get company info from shared preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyInfo = prefs.getString('company');
    if (companyInfo != null) {
      company.value = CompanyModel.fromJson(jsonDecode(companyInfo));
    }
  }

  Future getJobsForCompany() async {
    // get all the jobs for the company from the server
    final response = await http.get(
      Uri.parse(
          'http://52.20.124.191:4000/api/jobs_for_company/${company.value.companyId}'),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      jobs.value = (jsonDecode(response.body) as List)
          .map((e) => JobModel.fromJson(e))
          .toList();
    } else {
      // print(response.body);
      Get.snackbar('Error', response.body);
    }
  }

  Future getApplicationsForCompany() async {
    // get all the jobs for the company from the server
    final response = await http.get(
      Uri.parse(
          'http://52.20.124.191:4000/api/applications_for_company/${company.value.companyId}'),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      applications.value = (jsonDecode(response.body) as List)
          .map((e) => Application.fromJson(e))
          .toList();
      // print(applications.value[0].toJson());
    } else {
      // print(response.body);
      Get.snackbar('Error', response.body);
    }
  }

  updateStatus() {
    jobsPosted.value = jobs.length;
    candidatesApplied.value = applications.length;
    fullTime.value = jobs.where((element) => element.type == 'FullTime').length;
  }

  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('company');
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() async {
    super.onInit();
    await getCompanyInfo();
    await getJobsForCompany();
    await getApplicationsForCompany();
    updateStatus();
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
