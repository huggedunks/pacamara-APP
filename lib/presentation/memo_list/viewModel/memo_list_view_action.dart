import 'package:pacamara_app/presentation/common/utils/view_action.dart';
import 'package:riverpod/riverpod.dart';

final memoListViewActionProvider = StateProvider.autoDispose<ViewAction>((ref) {
  return ViewAction();
});

class MemoListViewActionShowToastMessage extends ViewAction {
  MemoListViewActionShowToastMessage(this.message);

  final String message;
}
