class NICDecoder {
  static Map<String, dynamic>? decode(String nic) {
    if (nic.length == 10 && (nic.endsWith('V') || nic.endsWith('X'))) {
      return _decodeOldNIC(nic);
    } else if (nic.length == 12 && RegExp(r'^\d{12}$').hasMatch(nic)) {
      return _decodeNewNIC(nic);
    }
    return null;
  }

  static Map<String, dynamic> _decodeOldNIC(String nic) {
    int birthYear = 1900 + int.parse(nic.substring(0, 2));
    int dayOfYear = int.parse(nic.substring(2, 5));
    String gender = dayOfYear > 500 ? "Female" : "Male";
    if (dayOfYear > 500) dayOfYear -= 500;
    DateTime birthDate = _calculateDate(birthYear, dayOfYear);
    int age = DateTime.now().year - birthYear;
    String voteEligibility = nic.endsWith('V') ? "Can Vote" : "Cannot Vote";

    return {
      "Birth Year": birthYear,
      "Date of Birth": "${birthDate.year}-${birthDate.month}-${birthDate.day}",
      "Weekday": _getWeekdayName(birthDate.weekday),
      "Age": age,
      "Gender": gender,
      "Serial Number": nic.substring(5, 9),
      "Voting Eligibility": voteEligibility,
    };
  }

  static Map<String, dynamic> _decodeNewNIC(String nic) {
    int birthYear = int.parse(nic.substring(0, 4));
    int dayOfYear = int.parse(nic.substring(4, 7));
    String gender = dayOfYear > 500 ? "Female" : "Male";
    if (dayOfYear > 500) dayOfYear -= 500;
    DateTime birthDate = _calculateDate(birthYear, dayOfYear);
    int age = DateTime.now().year - birthYear;

    return {
      "Birth Year": birthYear,
      "Date of Birth": "${birthDate.year}-${birthDate.month}-${birthDate.day}",
      "Weekday": _getWeekdayName(birthDate.weekday),
      "Age": age,
      "Gender": gender,
      "Serial Number": nic.substring(7),
    };
  }

  static DateTime _calculateDate(int year, int dayOfYear) {
    return DateTime(year, 1, 1).add(Duration(days: dayOfYear - 1));
  }

  static String _getWeekdayName(int weekday) {
    return [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ][weekday - 1];
  }
}
