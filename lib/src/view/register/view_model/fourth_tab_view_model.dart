import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FourthTabViewModel extends StateNotifier<int> {
  FourthTabViewModel() : super(-1);
}

final wakeUpTimeProvider = StateProvider<TimeOfDay?>((ref) => TimeOfDay.now());
final bedTimeProvider = StateProvider<TimeOfDay?>((ref) => TimeOfDay.now());
