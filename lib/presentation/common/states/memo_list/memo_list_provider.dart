import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class MemoEntity {
  MemoEntity(this.id);
  final int id;
}

class MemoListNotifier extends PagedNotifier<int, MemoEntity> {
  MemoListNotifier()
      : super(
          //load is a required method of PagedNotifier
          load: (page, limit) => Future.delayed(const Duration(seconds: 2), () {
            // This simulates a network call to an api that returns paginated posts
            return [
              MemoEntity(1),
              MemoEntity(2),
              MemoEntity(3),
            ];
          }),

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
final memoListProvider =
    StateNotifierProvider<MemoListNotifier, PagedState<int, MemoEntity>>((_) => MemoListNotifier());
