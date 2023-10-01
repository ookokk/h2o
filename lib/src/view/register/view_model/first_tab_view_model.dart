import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstTabViewModel extends ChangeNotifier {}

final isCheckedProvider = StateProvider<bool>((ref) => false);
