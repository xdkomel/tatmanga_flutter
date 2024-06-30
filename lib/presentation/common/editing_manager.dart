import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditingModeOnManager extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;

  void edit() => state = true;
  void stopEditing() => state = false;
}
