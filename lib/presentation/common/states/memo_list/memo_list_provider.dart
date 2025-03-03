import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacamara_app/dependency/memo_list/memo_list_provider.dart';
import 'package:pacamara_app/domain/usecase/memo_list/get_memo_list_usecase.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class MemoEntity {
  MemoEntity(this.id);
  final int id;
}

class MemoListNotifier extends PagedNotifier<int, MemoEntity> {
  // ignore: unused_field
  final GetMemoListUsecase _getMemoListUsecase;

  MemoListNotifier(
    this._getMemoListUsecase,
  ) : super(
          //load is a required method of PagedNotifier
          load: (page, limit) {
            return _getMemoListUsecase(GetMemoListUsecaseParam(page));
          },

          //nextPageKeyBuilder is a required method of PagedNotifier
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );

  // Example of custom methods you are free to implement in StateNotifier
  void add(MemoEntity entity) {
    state = state.copyWith(records: [...(state.records ?? []), entity]);
  }

  void delete(MemoEntity entity) {
    state = state.copyWith(records: [...(state.records ?? [])]..remove(entity));
  }
}

//create a global provider as you would normally in riverpod:
final memoListProvider = StateNotifierProvider<MemoListNotifier, PagedState<int, MemoEntity>>(
  (ref) => MemoListNotifier(
    ref.watch(getMemoListUsecaseProvider),
  ),
);
