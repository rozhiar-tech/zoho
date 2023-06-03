import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoho/app/data/models/job_model_model.dart';
import 'package:zoho/app/data/models/company_model.dart';
import 'package:zoho/app/data/models/student_model.dart';
import 'package:zoho/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeController extends GetxController {
  RxString title = 'Find Your Job'.obs;
  RxBool search = false.obs;
  RxBool isDrawerToogle = false.obs;
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxList<CompanyModel> companies = <CompanyModel>[].obs;
  RxInt fulltimeJobs = 0.obs;
  RxInt parttimeJobs = 0.obs;
  Rx<Student> student = Student().obs;

  var fetchedCompanies = <CompanyModel>[];

  void drawerToogle() {
    isDrawerToogle.value = !isDrawerToogle.value;
  }

  searchIsClicked() {
    search.value = !search.value;
  }

  logout() async {
    await Firebase.initializeApp();
    await FirebaseAuth.instance.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('student');
    Get.offAllNamed(Routes.LOGIN);
  }

  fetchJobs() async {
    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/jobs'),
      headers: {"content-type": "application/json"},
    );

    var myJobs = (json.decode(response.body) as List).map((e) => JobModel.fromJson(e)).toList();

    var ids = myJobs.map((e) => e.companyId).toSet().toList();

    await getCompaniesByIds(ids);

    // loop through the jobs and count the fulltime and parttime jobs
    for (var i = 0; i < myJobs.length; i++) {
      var company = fetchedCompanies.firstWhere((element) => element.companyId == myJobs[i].companyId);
      companies.add(company);
      if (myJobs[i].type == 'Fulltime') {
        fulltimeJobs.value++;
      } else {
        parttimeJobs.value++;
      }
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

  companyDetails(index) async {
    Get.toNamed(Routes.COMPANY_PROFILE, arguments: companies[index]);
  }

  goToJobDetails(index) async {
    Get.toNamed(Routes.SINGLE_JOB, arguments: [jobs[index], companies[index]]);
  }

  getUserInfo() async {
    // get the student object from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var studentString = prefs.getString('student');
    // check if the student object is null
    if (studentString != null) {
      student.value = Student.fromJson(jsonDecode(studentString));
      return;
    }

    Get.snackbar('Error', 'we could not find the student object');
  }

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
    getUserInfo();
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
