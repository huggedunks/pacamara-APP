import 'package:pacamara_app/presentation/memo_list/viewModel/memo_list_view_action.dart';
import 'package:riverpod/riverpod.dart';

final memoListViewModelProvider = StateProvider.autoDispose<MemoListViewModel>((ref) {
  return MemoListViewModel(ref);
});

class MemoListViewModel {
  MemoListViewModel(this.ref);

  final Ref ref;

  void buttonPressed(int index) {
    ref.read(memoListViewActionProvider.notifier).update((_) => MemoListViewActionShowToastMessage(index.toString()));
  }
}
