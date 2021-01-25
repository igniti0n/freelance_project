import 'package:test_project_one/app/modules/sign_up/views/sign_up_2_view.dart';
import 'package:test_project_one/app/modules/sign_up/views/sign_up_interest_view.dart';
import 'package:test_project_one/app/modules/sign_up/views/sign_up_media_accounts_view.dart';
import 'package:test_project_one/app/modules/policy/views/policy_view.dart';
import 'package:test_project_one/app/modules/policy/bindings/policy_binding.dart';
import 'package:test_project_one/app/modules/withdrawal/views/withdrawal_view.dart';
import 'package:test_project_one/app/modules/withdrawal/bindings/withdrawal_binding.dart';
import 'package:test_project_one/app/modules/change_password/views/change_password_view.dart';
import 'package:test_project_one/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:test_project_one/app/modules/profile/views/profile_view.dart';
import 'package:test_project_one/app/modules/profile/bindings/profile_binding.dart';
import 'package:test_project_one/app/modules/more/views/more_view.dart';
import 'package:test_project_one/app/modules/more/bindings/more_binding.dart';
import 'package:test_project_one/app/modules/chat/views/chat_view.dart';
import 'package:test_project_one/app/modules/chat/bindings/chat_binding.dart';
import 'package:test_project_one/app/modules/wallet/views/wallet_view.dart';
import 'package:test_project_one/app/modules/wallet/bindings/wallet_binding.dart';
import 'package:test_project_one/app/modules/stats/views/stats_view.dart';
import 'package:test_project_one/app/modules/stats/bindings/stats_binding.dart';
import 'package:test_project_one/app/modules/performance_list_report/views/performance_list_report_view.dart';
import 'package:test_project_one/app/modules/performance_list_report/bindings/performance_list_report_binding.dart';
import 'package:test_project_one/app/modules/performance_report/views/performance_report_view.dart';
import 'package:test_project_one/app/modules/performance_report/bindings/performance_report_binding.dart';
import 'package:test_project_one/app/modules/my_ads/views/my_ads_view.dart';
import 'package:test_project_one/app/modules/my_ads/bindings/my_ads_binding.dart';
import 'package:test_project_one/app/modules/ads_details/views/ads_details_view.dart';
import 'package:test_project_one/app/modules/ads_details/bindings/ads_details_binding.dart';
import 'package:test_project_one/app/modules/sign_up/views/sign_up_view.dart';
import 'package:test_project_one/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:test_project_one/app/modules/sign_in/views/sign_in_view.dart';
import 'package:test_project_one/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:test_project_one/app/modules/home/views/home_view.dart';
import 'package:test_project_one/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:test_project_one/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SPLASH, 
      page:()=> SplashScreen(), 
    ),
    
    GetPage(
      name: Routes.SIGN_IN, 
      page:()=> SignInView(), 
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP, 
      page:()=> SignUpView(), 
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP_2, 
      page:()=> SignUp2View(), 
    ),
    GetPage(
      name: Routes.ADS_DETAILS, 
      page:()=> AdsDetailsView(), 
      binding: AdsDetailsBinding(),
    ),
    GetPage(
      name: Routes.MY_ADS, 
      page:()=> MyAdsView(), 
      binding: MyAdsBinding(),
    ),
    GetPage(
      name: Routes.PERFORMANCE_REPORT, 
      page:()=> PerformanceReportView(), 
      binding: PerformanceReportBinding(),
    ),
    GetPage(
      name: Routes.PERFORMANCE_LIST_REPORT, 
      page:()=> PerformanceListReportView(), 
      binding: PerformanceListReportBinding(),
    ),
    GetPage(
      name: Routes.STATS, 
      page:()=> StatsView(), 
      binding: StatsBinding(),
    ),
    GetPage(
      name: Routes.WALLET, 
      page:()=> WalletView(), 
      binding: WalletBinding(),
    ),
    GetPage(
      name: Routes.CHAT, 
      page:()=> ChatView(), 
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.MORE, 
      page:()=> MoreView(), 
      binding: MoreBinding(),
    ),
    GetPage(
      name: Routes.PROFILE, 
      page:()=> ProfileView(), 
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD, 
      page:()=> ChangePasswordView(), 
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.WITHDRAWAL, 
      page:()=> WithdrawalView(), 
      binding: WithdrawalBinding(),
    ),
    GetPage(
      name: Routes.POLICY, 
      page:()=> PolicyView(), 
      binding: PolicyBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP_INTEREST, 
      page:()=> SignUpInterestView(), 
      
    ),
    GetPage(
      name: Routes.SIGN_UP_MEDIA_ACCOUNTS, 
      page:()=> SignUpMediaAccountsView(), 
      
    ),
  ];
}