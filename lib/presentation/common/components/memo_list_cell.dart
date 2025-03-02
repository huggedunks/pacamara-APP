import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacamara_app/presentation/common/theme/theme_constants.dart';
import 'package:pacamara_app/presentation/memo_list/viewModel/memo_list_view_model.dart';

class MemoListCell extends StatelessWidget {
  const MemoListCell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer(builder: (context, ref, _) {
        return TextButton(
          onPressed: () {
            ref.read(memoListViewModelProvider).buttonPressed(5);
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
                '파카마라, 파라이소, 베켈레',
                style: context.bodyMedium?.copyWith(color: context.theme.pacaWhite),
              ),
              Text(
                '2025년 2월 27일 (목)',
                style: context.bodySmall?.copyWith(color: context.theme.pacaWhite),
              ),
            ],
          ),
        );
      }),
    );
  }
}
