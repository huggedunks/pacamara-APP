import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:pacamara_app/presentation/common/theme/theme_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacamara_app/presentation/memo_list/viewModel/memo_list_view_action.dart';
import 'package:pacamara_app/presentation/memo_list/viewModel/memo_list_view_model.dart';

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
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                ref.read(memoListViewModelProvider).buttonPressed(index);
              },
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                overlayColor: context.theme.pacaAccent500,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "파카마라, 파라이소, 베켈레",
                    style: context.bodyMedium?.copyWith(color: context.theme.pacaWhite),
                  ),
                  Text(
                    "2025년 2월 27일 (목)",
                    style: context.bodySmall?.copyWith(color: context.theme.pacaWhite),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: context.theme.pacaGray600);
          },
        ),
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
