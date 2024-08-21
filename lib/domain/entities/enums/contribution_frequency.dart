enum ContributionFrequency {
  weekly,
  biWeekly,
  monthly;

  String toShortString() {
    switch (this) {
      case weekly:
        return "semains";
      case biWeekly:
        return "2 semains";
      case monthly:
        return "mois";
      default:
        return "";
    }
  }

  // Convert enum to JSON
  String toJson() {
    return this.toString().split('.').last; // Convert enum to string
  }

  // Convert JSON to enum
  static ContributionFrequency fromJson(String jsonString) {
    return ContributionFrequency.values.firstWhere(
      (e) => e.toString().split('.').last == jsonString,
      orElse: () => ContributionFrequency.weekly, // Default value if not found
    );
  }
}