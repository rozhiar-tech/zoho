import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController
  RxString ProfileName = 'Profile'.obs;

  RxString email = ''.obs;

  GetCvFromStorage() async {
    Reference ref = FirebaseStorage.instance.ref().child('${email.value}/File');
    String url = await ref.getDownloadURL();
    return url;
  }

  final count = 0.obs;
  @override
  void onInit() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email.value = user.email!;
      print(email.value);
      GetCvFromStorage();
    }

    super.onInit();
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
