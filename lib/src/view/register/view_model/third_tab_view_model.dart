import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThirdTabViewModel extends StateNotifier<int> {
  ThirdTabViewModel() : super(-1);

  void updateSelectedContainerIndex(int newIndex) {
    state = newIndex;
  }
}

final thirdTabViewModelProvider =
    StateNotifierProvider<ThirdTabViewModel, int>((ref) {
  return ThirdTabViewModel();
});
