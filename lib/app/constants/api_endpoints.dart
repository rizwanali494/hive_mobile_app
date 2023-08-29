class ApiEndpoints {
  static String baseUrl = "http://34.65.200.85";
  static String apiUrl = "${baseUrl}/api/v1/";
  static String authUrl = "${apiUrl}auth/";
  static String googleLogin = "${authUrl}google_login_mobile/";
  static String upload = "${apiUrl}upload/";
  static String communication = "${apiUrl}communication/";
  static String announcementPost = "${communication}announcement_post/";
  static String inbox = "${communication}message/";
  static String notification = "${communication}notification/";
  static String administrative = "${apiUrl}administrative/";
  static String serviceRequest = "${administrative}service_request/";
  static String externalGrade = "${administrative}external_grade/";
  static String sessionNote = "${administrative}session_note/";
  static String universityApplication =
      "${administrative}university_application/";
  static String universities =
      "${administrative}university_application/university/";
}
