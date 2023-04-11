import 'package:intl/intl.dart';

class Helper {
  static String localDate(DateTime date) {
    var formattedDate = DateFormat("dd/MM/yyyy").format(date).toString();

    return formattedDate;
  }
}
