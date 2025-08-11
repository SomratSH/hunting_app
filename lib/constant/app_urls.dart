class AppUrls {
  AppUrls();

  static const String baseUrl = 'http://10.10.13.19:8000/api/v1';
  static const String imageUrl = "http://10.10.13.19:8000";

  //sign up urls
  static const String signUp = '/accounts/signup/step1/';
  static const String signUpStep2 = '/accounts/signup/step2/';
  static const  String loginUrl = '/accounts/login/';

  //forgot password urls
  static const String sendOtp = '/accounts/send-otp/';
  static const String verifyOtp = '/accounts/verify-otp/';
  static const String resetPassword = '/accounts/reset-password/';


  //hunts portions url
  static const String huntUrl = '/hunts/';


  //subscription portion
  static String getPlanUrl = "/subscriptions/plans/";
  static String creatSubscription = "/subscriptions/checkout/";

  //profile urls
  static String get profileUrl => '/accounts/profile/';
  static String get updateProfile => '/accounts/profile/update/';

  //core term and policy
  static String termConditonUrl = "/cores/terms-conditions/";
  static String privacyPolicy = "/cores/privacy-policy/";

  

}