enum ReceiverFrequency {
  monthly,
  biMonthly,
  quarterly;

  String toShortString() {
    switch (this) {
      case monthly:
        return "mois";
      case biMonthly:
        return "2 mois";
      case quarterly:
        return "4 mois";
      default:
        return "";
    }
  }

  // Convert enum to JSON
  String toJson() {
    return this.toString().split('.').last; // Convert enum to string
  }

  // Convert JSON to enum
  static ReceiverFrequency fromJson(String jsonString) {
    return ReceiverFrequency.values.firstWhere(
      (e) => e.toString().split('.').last == jsonString,
      orElse: () => ReceiverFrequency.monthly, // Default value if not found
    );
  }
}