import 'package:intl/intl.dart';

class AppUtils {
  //e.g 23 March, 2021
  static String dayWithSuffixMonthAndYear(DateTime date) {
    return DateFormat("d MMM y").format(date);
  }

  //e.g 23rd March, 2021
  static String dayMonthYear(DateTime date) {
    var suffix = "th";

    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("d'$suffix' MMM y").format(date);
  }

  ///format currency
  static String formatAmount({required double amount}) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    String formattedAmount = oCcy.format(amount);
    return formattedAmount;
  }

  static String getInitialsFromFullname(String fullname) {
    String initials = "";
    String firstName;
    String lastName;

    List<String> names = fullname.split(" ");
    if (names.isNotEmpty) {
      firstName = names[0];
      initials += firstName.substring(0, 1);
    }
    if (names.length > 1) {
      lastName = names[1];
      initials += lastName.substring(0, 1);
    }

    return initials.toUpperCase();
  }

  static String capitalizeText(String text, {String? seperator}) {
    seperator = seperator ?? "''";
    String res = "";
    List<String> words = text.split(seperator);
    for (String w in words) {
      res += " ${w.substring(0, 1).toUpperCase()}${w.substring(1)}";
    }
    return res.trim();
  }

  static bool isToday(DateTime d) {
    final now = DateTime.now();
    return now.year == d.year && now.month == d.month && now.day == d.day;
  }

  static bool isYesterday(DateTime d) {
    final now = DateTime.now().subtract(const Duration(days: 1));
    return now.year == d.year && now.month == d.month && now.day == d.day;
  }
}
