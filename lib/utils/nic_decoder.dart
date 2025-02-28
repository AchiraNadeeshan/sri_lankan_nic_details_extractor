/// A utility class for decoding Sri Lankan NIC (National Identity Card) numbers.
class NICDecoder {
  /// Decodes a given NIC number and returns a map of extracted details.
  ///
  /// - Supports both old (10-digit) and new (12-digit) NIC formats.
  /// - If the NIC is invalid, returns `null`.
  ///
  /// Example usage:
  /// ```dart
  /// var details = NICDecoder.decode("200012345678");
  /// print(details);
  /// ```
  static Map<String, dynamic>? decode(String nic) {
    if (nic.length == 10 && (nic.endsWith('V') || nic.endsWith('X'))) {
      return _decodeOldNIC(nic);
    } else if (nic.length == 12 && RegExp(r'^\d{12}$').hasMatch(nic)) {
      return _decodeNewNIC(nic);
    }
    return null;
  }

  /// Decodes an old NIC (10-digit format).
  ///
  /// Extracts details such as:
  /// - Date of birth
  /// - Gender
  /// - Age (years, months, and days)
  /// - Serial number
  /// - Voting eligibility (based on last character)
  static Map<String, dynamic> _decodeOldNIC(String nic) {
    int birthYear = 1900 + int.parse(nic.substring(0, 2));
    int dayOfYear = int.parse(nic.substring(2, 5));
    String gender = dayOfYear > 500 ? "Female" : "Male";
    if (dayOfYear > 500) dayOfYear -= 500;
    DateTime birthDate = _calculateDate(birthYear, dayOfYear);

    // Calculate age in years, months, and days
    DateTime today = DateTime.now();
    int ageInYears = today.year - birthDate.year;
    int ageInMonths = today.month - birthDate.month;
    int ageInDays = today.day - birthDate.day;

    if (ageInMonths < 0) {
      ageInYears--;
      ageInMonths += 12;
    }
    if (ageInDays < 0) {
      ageInMonths--;
      ageInDays += DateTime(today.year, today.month, 0).day;
    }

    String voteEligibility = nic.endsWith('V') ? "Can Vote" : "Cannot Vote";

    return {
      "NIC Format": "Old NIC",
      "Date of Birth": _formatDate(birthDate),
      "Weekday": _getWeekdayName(birthDate.weekday),
      "Age": "$ageInYears years, $ageInMonths months, $ageInDays days",
      "Gender": gender,
      "Serial Number": nic.substring(5, 9),
      "Voting Eligibility": voteEligibility,
    };
  }

  /// Decodes a new NIC (12-digit format).
  ///
  /// Extracts details such as:
  /// - Date of birth
  /// - Gender
  /// - Age (years, months, and days)
  /// - Serial number
  static Map<String, dynamic> _decodeNewNIC(String nic) {
    int birthYear = int.parse(nic.substring(0, 4));
    int dayOfYear = int.parse(nic.substring(4, 7));
    String gender = dayOfYear > 500 ? "Female" : "Male";
    if (dayOfYear > 500) dayOfYear -= 500;
    DateTime birthDate = _calculateDate(birthYear, dayOfYear);

    // Calculate age in years, months, and days
    DateTime today = DateTime.now();
    int ageInYears = today.year - birthDate.year;
    int ageInMonths = today.month - birthDate.month;
    int ageInDays = today.day - birthDate.day;

    if (ageInMonths < 0) {
      ageInYears--;
      ageInMonths += 12;
    }
    if (ageInDays < 0) {
      ageInMonths--;
      ageInDays += DateTime(today.year, today.month, 0).day;
    }

    return {
      "NIC Format": "New NIC",
      "Date of Birth": _formatDate(birthDate),
      "Weekday": _getWeekdayName(birthDate.weekday),
      "Age": "$ageInYears years, $ageInMonths months, $ageInDays days",
      "Gender": gender,
      "Serial Number": nic.substring(7),
    };
  }

  /// Calculates the exact date of birth given the birth year and day of the year.
  ///
  /// Uses a fixed leap-year assumption (February has 29 days).
  static DateTime _calculateDate(int year, int dayOfYear) {
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

  /// Formats a [DateTime] object into a YYYY-MM-DD string.
  static String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  /// Returns the name of the weekday for a given weekday index.
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
