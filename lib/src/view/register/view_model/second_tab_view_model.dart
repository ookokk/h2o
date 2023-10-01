import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondTabViewModel extends ChangeNotifier {}

final weightProvider = StateProvider<int>((ref) {
  return 70;
});
