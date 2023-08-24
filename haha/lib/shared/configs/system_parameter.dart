class SystemParameter {
  static String tokenPrefId = 'token';
  static String deviceTokenPrefId = 'device_token';
  static String devicePrefId = 'deviceInfo';
  static String userPrefId = 'userInfo';
  static const int timeout = 30;

  static bool canAccessOnRoot = false;
  static bool useSecureConnection = false;
  static bool isEncrypted = false;
  static bool isAuthEncrypted = false;
  static String encryptKey = 'secret-key-eis-zapps-mobile-@2021';
  static String encryptIv = '3e990f6776a353e60b4b64829249138e';

  static String billingInstallment = "billingInstallments";
  static String billingDebt = "billingDebt";
  static String billingCancelation = "billingCancelation";
  static String printStruct = "struct";
  static String printStructCollective = "structCollective";
  static String invoiceImage = "invoiceImage";
  static String mobileApp = "titleApp";

  static double lat = -6.94822;
  static double lng = 107.65798;
  static double zoom = 18;
  static double tilt = 80;
  static double bearing = 30;
}
