import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pacamara_app/presentation/common/components/memo_list_cell.dart';
import 'package:pacamara_app/presentation/common/states/memo_list/memo_list_provider.dart';
import 'package:pacamara_app/presentation/common/theme/theme_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacamara_app/presentation/memo_list/viewModel/memo_list_view_action.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class MemoListView extends ConsumerWidget {
  const MemoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(memoListViewActionProvider, (_, action) {
      switch (action.runtimeType) {
        case const (MemoListViewActionShowToastMessage):
          action as MemoListViewActionShowToastMessage;
        // DO ACTION
      }
    });

    return Scaffold(
      backgroundColor: context.theme.pacaBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          '파카마라 노트',
          style: context.titleMedium?.copyWith(color: context.theme.pacaAccent500),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: Consumer(builder: (context, ref, _) {
          return RiverPagedBuilder<int, MemoEntity>(
            firstPageKey: 0,
            limit: 3,
            provider: memoListProvider,
            itemBuilder: (context, item, index) => Column(
              children: [
                if (index != 0) Divider(color: context.theme.pacaGray600),
                const MemoListCell(),
              ],
            ),
            pagedBuilder: (controller, builder) => PagedListView(
              pagingController: controller,
              builderDelegate: builder,
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        color: context.theme.pacaGray200,
        height: 60,
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.edit_square,
                color: context.theme.pacaAccent500,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
