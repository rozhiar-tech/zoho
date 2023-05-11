import 'package:get/get.dart';

import '../modules/all_jobs/bindings/all_jobs_binding.dart';
import '../modules/all_jobs/views/all_jobs_view.dart';
import '../modules/confirm_email/bindings/confirm_email_binding.dart';
import '../modules/confirm_email/views/confirm_email_view.dart';
import '../modules/create_job/bindings/create_job_binding.dart';
import '../modules/create_job/views/create_job_view.dart';
import '../modules/filter_page/bindings/filter_page_binding.dart';
import '../modules/filter_page/views/filter_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/single_job/bindings/single_job_binding.dart';
import '../modules/single_job/views/single_job_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/user_infromation/bindings/user_infromation_binding.dart';
import '../modules/user_infromation/views/user_infromation_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';
import '../modules/view_candidates/bindings/view_candidates_binding.dart';
import '../modules/view_candidates/views/view_candidates_view.dart';
import '../modules/view_jobs/bindings/view_jobs_binding.dart';
import '../modules/view_jobs/views/view_jobs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_EMAIL,
      page: () => const ConfirmEmailView(),
      binding: ConfirmEmailBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFROMATION,
      page: () => const UserInfromationView(),
      binding: UserInfromationBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_JOB,
      page: () => const CreateJobView(),
      binding: CreateJobBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_JOBS,
      page: () => const ViewJobsView(),
      binding: ViewJobsBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_CANDIDATES,
      page: () => const ViewCandidatesView(),
      binding: ViewCandidatesBinding(),
    ),
    GetPage(
      name: _Paths.ALL_JOBS,
      page: () => const AllJobsView(),
      binding: AllJobsBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_JOB,
      page: () => const SingleJobView(),
      binding: SingleJobBinding(),
    ),
    GetPage(
      name: _Paths.FILTER_PAGE,
      page: () => const FilterPageView(),
      binding: FilterPageBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
  ];
}
