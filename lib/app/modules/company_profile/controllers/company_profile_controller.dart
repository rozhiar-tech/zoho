import 'package:get/get.dart';

class CompanyProfileController extends GetxController {
  //TODO: Implement CompanyProfileController
  RxString company_text = "Company Profile".obs;
  var company;
  RxString company_name = "Company Name".obs;
  RxString company_email = "Company Email".obs;
  RxString company_phone = "Company Phone".obs;
  RxString company_address = "Company Address".obs;
  RxString company_logo = "".obs;

  companyDetails(company) {
    company_text.value = company.username;
    company_name.value = company.username;
    company_email.value = company.email;
    company_phone.value = company.phone;
    company_address.value = company.address;
    company_logo.value = company.logo;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    company = Get.arguments;
    companyDetails(company);
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
}
