class CalculateDailyWaterIntake {
  double calculateWaterIntake(
      String? trainingHardness, int? weight, String? gender) {
    if (trainingHardness == null || weight == null || gender == null) {
      return 0.0;
    }

    double baseWaterNeed = 0.0;

    if (gender == "male") {
      baseWaterNeed = weight * 35.0;
    } else if (gender == "female") {
      baseWaterNeed = weight * 31.0;
    }

    if (trainingHardness == "low") {
      baseWaterNeed *= 1.2;
    } else if (trainingHardness == "medium") {
      baseWaterNeed *= 1.5;
    } else if (trainingHardness == "high") {
      baseWaterNeed *= 2.0;
    }

    return baseWaterNeed;
  }
}
