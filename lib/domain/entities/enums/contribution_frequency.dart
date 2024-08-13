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
}
