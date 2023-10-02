import 'package:flutter_test/flutter_test.dart';
import 'package:h2o_flutter/src/product/calculate/calculate_daily_water_intake.dart';

void main() {
  group('CalculateDailyWaterIntake', () {
    test('Calculate water intake for male with low training hardness', () {
      CalculateDailyWaterIntake calculator = CalculateDailyWaterIntake();
      double waterIntake = calculator.calculateWaterIntake("low", 70, "male");
      expect(waterIntake, 2450.0);
    });

    test('Calculate water intake for female with medium training hardness', () {
      CalculateDailyWaterIntake calculator = CalculateDailyWaterIntake();
      double waterIntake =
          calculator.calculateWaterIntake("medium", 60, "female");
      expect(waterIntake, 2790.0);
    });

    test('Calculate water intake with missing data', () {
      CalculateDailyWaterIntake calculator = CalculateDailyWaterIntake();
      double waterIntake = calculator.calculateWaterIntake(null, null, null);
      expect(waterIntake, 0.0); // Beklenen sonuç
    });
  });
}
