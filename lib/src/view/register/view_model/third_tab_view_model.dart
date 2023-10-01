import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThirdTabViewModel extends StateNotifier<int> {
  ThirdTabViewModel() : super(-1);

  void updateSelectedContainerIndex(int newIndex) {
    state = newIndex;
  }

  String indexToTrainingHardness(int index) {
    switch (index) {
      case 0:
        return 'low';
      case 1:
        return 'medium';
      case 2:
        return 'high';
      default:
        return 'Undefined Hardness';
    }
  }
}

final thirdTabViewModelProvider =
    StateNotifierProvider<ThirdTabViewModel, int>((ref) {
  return ThirdTabViewModel();
});
