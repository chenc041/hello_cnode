import 'package:date_format/date_format.dart';

class FormatDate {
  static String date(DateTime time, String type) {
    return formatDate(
        time, [yyyy, '-', mm, '-', dd, '  ', hh, ':', mm, ':', ss]);
  }
}
