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
}
