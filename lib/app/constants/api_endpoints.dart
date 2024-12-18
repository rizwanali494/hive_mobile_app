class ApiEndpoints {
  static String baseUrl = "https://hive.bcp.net.pk";

  // static String baseUrl = "http://34.65.200.85";
  static String socketUrl = "ws://hive.bcp.net.pk/ws/ping/";
  static String pdfUrl = "${baseUrl}/view-reports-pdf";
  static String viewReport = "${baseUrl}/view-reports-pdf";
  static String apiUrl = "${baseUrl}/api/v1/";
  static String authUrl = "${apiUrl}auth/";
  static String refreshToken = "${authUrl}token/refresh/";
  static String me = "${authUrl}me/";
  static String googleLogin = "${authUrl}google_login_mobile/";
  static String upload = "${apiUrl}upload/";
  static String communication = "${apiUrl}communication/";
  static String announcementPost = "${communication}announcement_post/";
  static String notification = "${communication}notification/";
  static String administrative = "${apiUrl}administrative/";
  static String serviceRequest = "${administrative}service_request/";
  static String externalGrade = "${administrative}external_grade/";
  static String subject = "${externalGrade}subject/";
  static String sessionNote = "${administrative}session_note/";
  static String award = "${administrative}award/";
  static String user = "${apiUrl}user/";
  static String studentUser = "${user}student/";
  static String inbox = "${user}inbox";
  static String verifyEmail = "${studentUser}initiate_verify_backup_email/";
  static String message = "${communication}message/";
  static String hobby = "${studentUser}hobby/bulk_create/";
  static String event = "${apiUrl}event/";
  static String activity = "${event}activity/";
  static String report = "${user}reports/";
  static String reportToken = "${report}token/";
  static String assessments = "${report}assessments/";
  static String summary = "${report}summary/";
  static String universityApplication =
      "${administrative}university_application/";
  static String universities =
      "${administrative}university_application/university/";
}
