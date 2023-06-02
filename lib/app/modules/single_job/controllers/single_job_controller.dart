import 'package:get/get.dart';
import 'package:zoho/app/data/models/company_model.dart';
import 'package:zoho/app/data/models/job_model_model.dart';

class SingleJobController extends GetxController {
  Rx<JobModel> job = JobModel().obs;
  Rx<CompanyModel> company = CompanyModel().obs;

  RxString pageTitle = 'Google'.obs;

  applyJob() {
    Get.toNamed('/apply-screen', arguments: [job.value, company.value]);
  }

  @override
  void onInit() {
    super.onInit();
    job.value = Get.arguments[0];
    company.value = Get.arguments[1];
    pageTitle.value = job.value.title.toString();
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
