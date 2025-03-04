import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacamara_app/presentation/common/theme/theme_constants.dart';

class MemoEditView extends ConsumerWidget {
  const MemoEditView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(memoListViewActionProvider, (_, action) {
    //   switch (action.runtimeType) {
    //     case const (MemoListViewActionShowToastMessage):
    //       action as MemoListViewActionShowToastMessage;
    //     // DO ACTION
    //   }
    // });

    return Scaffold(
      backgroundColor: context.theme.pacaBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: context.theme.pacaAccent500,
        title: Text(
          '무엇이든 기록하세요',
          style: context.titleMedium?.copyWith(color: context.theme.pacaAccent500),
        ),
      ),
      body: const SafeArea(
        minimum: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Text('Chat Area'),
            ),
            Row(
              children: [
                Expanded(
                  child: ChatTextField(),
                ),
                ChatSendButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatSendButton extends StatelessWidget {
  const ChatSendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {},
      style: IconButton.styleFrom(backgroundColor: context.theme.pacaAccent500),
      icon: Icon(
        Icons.arrow_upward,
        color: context.theme.pacaBlack,
      ),
    );
  }
}

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.theme.pacaAccent500,
      style: context.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.theme.pacaGray200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Container(
          padding: const EdgeInsets.all(10.0),
          child: IconButton.filled(
            color: context.theme.pacaBlack,
            style: IconButton.styleFrom(
              backgroundColor: context.theme.pacaGray800,
            ),
            icon: const Icon(
              Icons.graphic_eq_outlined,
              size: 16,
            ),
            onPressed: () {},
          ),
        ),
        suffixIconConstraints: BoxConstraints.tight(
          const Size.fromRadius(26),
        ),
      ),
    );
  }
}
