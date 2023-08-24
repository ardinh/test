//import 'package:flutter/material.dart';

import 'package:haha/shared/constants/colors.dart';
import 'package:haha/shared/utils/size_util.dart';
import 'package:flutter/material.dart';

class StyleConstant {
  //color

  //shadow
  static final softShadows = [
    BoxShadow(
        color: ColorConstants.colorShadowBottom,
        offset: const Offset(3.0, 2.0),
        blurRadius: 3.0,
        spreadRadius: 1.0),
    BoxShadow(
        color: ColorConstants.colorShadowTop,
        offset: const Offset(-3.0, -2.0),
        blurRadius: 3.0,
        spreadRadius: 1.0),
  ];
  static final softShadowsMode = [
    BoxShadow(
      blurRadius: 4,
      offset: const Offset(-3, -3),
      color: ColorConstants.colorContainerShadowTop,
    ),
    BoxShadow(
      blurRadius: 4,
      offset: const Offset(3, 3),
      color: ColorConstants.colorContainerShadowBottom,
    ),
  ];
  static final softShadowsLarge = [
    BoxShadow(
        color: ColorConstants.colorShadowBottom,
        offset: const Offset(4.0, 4.0),
        blurRadius: 6.0,
        spreadRadius: 2.0),
    BoxShadow(
        color: ColorConstants.colorShadowTop,
        offset: const Offset(-4.0, -4.0),
        blurRadius: 6.0,
        spreadRadius: 2.0),
  ];

  static final softShadowsInvert = [
    const BoxShadow(
        color: ColorConstants.lightShadow,
        offset: Offset(3.0, 2.0),
        blurRadius: 3.0,
        spreadRadius: 2.0),
    const BoxShadow(
        color: ColorConstants.darkShadow,
        offset: Offset(-3.0, -2.0),
        blurRadius: 3.0,
        spreadRadius: 2.0),
  ];

  static final neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5),
        spreadRadius: -5,
        offset: const Offset(-5, -5),
        blurRadius: 30),
    BoxShadow(
        color: Colors.blue[900]!.withOpacity(.2),
        spreadRadius: 2,
        offset: const Offset(7, 7),
        blurRadius: 20)
  ];
  //SIZE
  //space size
  static const double extraLargeSpace = 50.0;
  static const double largeSpace = 30.0;
  static const double mediumSpace = 20.0;
  static const double smallSpace = 15.0;
  static const double miniSpace = 10.0;
  static const double microSpace = 5.0;

  // image size
  static const double extraLargeImage = 200.0;
  static const double largeImage = 100.0;
  static const double mediumImage = 50.0;
  static const double smallImage = 25.0;
  static const double miniImage = 20.0;
  static const double microImage = 10.0;

  //font size
  static const double extraLargeText = 40.0;
  static const double largeText = 22.0;
  static const double mediumText = 16.0;
  static const double smallText = 14.0;
  static const double miniText = 12.0;
  static const double microText = 10.0;

  // BorderRadius

  static BorderRadius radius10 = BorderRadius.circular(10);
  static BorderRadius radius20 = BorderRadius.circular(20);
  static BorderRadius radius30 = BorderRadius.circular(30);

  // Radius
  static const radiusContainer = 14.0;
  static const radiusOuval = 30.0;

  static final icons = <String, IconData>{
    'attendance': Icons.alarm_on_outlined,
    'attendances-today': Icons.alarm_add_outlined,
    'attendances-update': Icons.alarm_on_outlined,
    'overtime': Icons.alarm_add_outlined,
    'shift_schedules-overtime': Icons.alarm_add_outlined,
    'leave': Icons.alarm_off_outlined,
    'shift_schedules-leave': Icons.alarm_off_outlined,
    'switch': Icons.switch_account,
    'approval': Icons.approval_outlined,
    'calendar': Icons.calendar_today,
    'shift_schedules-switch': Icons.switch_account,
    'shift_schedules-subtitute': Icons.add_to_photos_outlined,
    'shift_schedules-update': Icons.today_outlined,
    'schedule': Icons.date_range,
    'task-employee': Icons.assignment_outlined,
    'message': Icons.info_outline,
    'payroll': Icons.receipt_long_outlined,
    'tax': Icons.receipt_outlined,
    'advance': Icons.money_rounded,
    'statements-advance_new': Icons.money_rounded,
    'reimbursement': Icons.admin_panel_settings_outlined,
    'statements-reimbursement_new': Icons.admin_panel_settings_outlined,
    'loan': Icons.monetization_on_outlined,
    'statements-loan_new': Icons.monetization_on_outlined,
    'user': Icons.account_circle_outlined,
    'employee': Icons.perm_contact_calendar_sharp,
    'device': Icons.devices_other_outlined,
    'session': Icons.person_pin_circle_outlined,
    'other': Icons.grid_view,
    'cifs-update': Icons.fact_check_outlined,
    'tracking': Icons.location_history_outlined,
    'task-order': Icons.hail_rounded,
    'business_trip': Icons.business_center_outlined,
    'order': Icons.menu,
  };

  static final actionIcons = <String, IconData>{
    'view': Icons.list_alt,
    'edit': Icons.edit,
    'delete': Icons.delete_forever_outlined,
  };

  static final timeIcons = <String, IconData>{
    "attendance_time_start": Icons.alarm_on_outlined,
    "break_time_start": Icons.motion_photos_pause_outlined,
    "break_time_stop": Icons.motion_photos_on_outlined,
    "attendance_time_stop": Icons.alarm_off_outlined,
    "overtime_time_start": Icons.alarm_add_outlined,
    "overtime_time_stop": Icons.lock_clock,
  };

  static final attendanceIcons = <String, IconData>{
    'attendance': Icons.assignment_turned_in_sharp,
    'default': Icons.assignment_turned_in_sharp,
    'overtime': Icons.pending_actions_sharp,
    'switch': Icons.camera_front_sharp,
    'sick': Icons.sick_outlined,
    'permit': Icons.fact_check_outlined,
    'leave': Icons.run_circle_outlined,
    'absent': Icons.image_search_sharp,
    'holiday': Icons.insert_invitation_outlined,
  };
  static final contactIcons = <String, IconData>{
    'phone': Icons.phone_enabled_outlined,
    'mobile': Icons.phone_android_outlined,
    'fax': Icons.print_outlined,
    'email': Icons.email_outlined,
  };

  static const spaceMicro = 2.0;
  static const spaceMini = 4.0;
  static const spaceSmall = 8.0;
  static const spaceMedium = 16.0;
  static const spaceLarge = 32.0;
  static const spaceExtraLarge = 40.0;
  static double srwSmall(BuildContext context) {
    return SizeUtil(context).calcularWidth(spaceSmall);
  }

  static double srwMedium(BuildContext context) {
    return SizeUtil(context).calcularWidth(spaceMedium);
  }

  static double srwLarge(BuildContext context) {
    return SizeUtil(context).calcularWidth(spaceLarge);
  }

  static double srhSmall(BuildContext context) {
    return SizeUtil(context).calcularHeight(spaceSmall);
  }

  static double srhMedium(BuildContext context) {
    return SizeUtil(context).calcularHeight(spaceMedium);
  }

  static double srhLarge(BuildContext context) {
    return SizeUtil(context).calcularHeight(spaceLarge);
  }

  static TextStyle get textStyleHeading => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: ColorConstants.colorBlue1,
      );

  static const textStyleTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorConstants.colorBlue1,
  );

  static final textStyleSubTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: ColorConstants.colorTextButton,
  );

  static final textStyleGiant = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorConstants.colorText,
  );

  static final textStyleHuge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorConstants.colorText,
  );

  static final textStyleExtraLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorConstants.colorText,
  );

  static final textStyleLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ColorConstants.colorText,
  );

  static final textStyleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: ColorConstants.colorText,
  );

  static final textStyleSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorConstants.colorText,
  );

  static final textStyleMini = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: ColorConstants.colorText,
  );

  static final textStyleMicro = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: ColorConstants.colorText,
  );

  static final textStyleNano = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w600,
    color: ColorConstants.colorText,
  );

  static final textStyleShaddow = TextStyle(
    color: ColorConstants.colorText,
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.3,
    shadows: const [
      Shadow(
        blurRadius: 1.0,
        color: ColorConstants.darkShadow,
        offset: Offset(1.0, 1.0),
      ),
    ],
  );

  static final buttonOuvalDecoration = BoxDecoration(
    color: ColorConstants.colorAccent,
    borderRadius: const BorderRadius.all(
      Radius.circular(30.0),
    ),
    boxShadow: softShadows,
  );

  static final panelBottomRadiusDecoration = BoxDecoration(
    color: ColorConstants.colorPrimary,
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
    boxShadow: [
      BoxShadow(
        blurRadius: 5.0,
        color: ColorConstants.colorShadowBottom,
        spreadRadius: 5.0,
      ),
    ],
  );

  static EdgeInsets layoutContainerPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      vertical: srwSmall(context),
      horizontal: srwMedium(context),
    );
  }
}
