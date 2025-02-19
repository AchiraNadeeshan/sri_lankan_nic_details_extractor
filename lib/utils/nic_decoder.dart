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
    int age = DateTime.now().year - birthDate.year;
    String voteEligibility = nic.endsWith('V') ? "Can Vote" : "Cannot Vote";

    return {
      "NIC Format": "Old NIC",
      "Date of Birth": _formatDate(birthDate),
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
    int age = DateTime.now().year - birthDate.year;

    return {
      "NIC Format": "New NIC",
      "Date of Birth": _formatDate(birthDate),
      "Weekday": _getWeekdayName(birthDate.weekday),
      "Age": age,
      "Gender": gender,
      "Serial Number": nic.substring(7),
    };
  }

  static DateTime _calculateDate(int year, int dayOfYear) {
    // Always use leap year calculation (29 days in February)
    const List<int> monthDays = [
      31,
      29,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];

    int month = 1;
    while (dayOfYear > monthDays[month - 1]) {
      dayOfYear -= monthDays[month - 1];
      month++;
    }

    return DateTime(year, month, dayOfYear);
  }

  static String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
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
    ][weekday % 7];
  }
}
