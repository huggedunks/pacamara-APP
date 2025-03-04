import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacamara_app/presentation/common/theme/theme_constants.dart';

class MemoEditView extends ConsumerStatefulWidget {
  const MemoEditView({super.key});

  @override
  ConsumerState<MemoEditView> createState() => _MemoEditViewState();
}

class _MemoEditViewState extends ConsumerState<MemoEditView> {
  final listKey = GlobalKey<AnimatedListState>();
  final bubbleListController = ScrollController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Expanded(
              child: Text('Content Area'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Divider(height: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '처리중',
                        style: context.labelMedium?.copyWith(color: context.theme.pacaGray600),
                      ),
                    ),
                    const Expanded(
                      child: Divider(height: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  constraints: const BoxConstraints(maxHeight: 150),
                  child: AnimatedList(
                    controller: bubbleListController,
                    key: listKey,
                    itemBuilder: (context, index, animation) {
                      return FadeTransition(opacity: animation, child: ChatMessageBubble(message: messages[index]));
                      // ChatMessageBubble(message: '이렇게 메시지를 쓰면'),
                      // ChatMessageBubble(message: '내용이 줄줄 길어지면 이렇게 길게 생성이 됩니다. 근데근데 혹시 글이 너무 길어지면 이렇게 여러 줄로 나오기도 합니다.')
                    },
                    initialItemCount: messages.length,
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Expanded(
                  child: ChatTextField(),
                ),
                ChatSendButton(
                  onPressed: () {
                    final index = messages.length;
                    messages.add('world ${index + 1}');
                    listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 400));
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      bubbleListController.animateTo(
                        bubbleListController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                      );
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          color: context.theme.pacaAccent300,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          message,
          style: context.bodyMedium?.copyWith(
            color: context.theme.pacaWhite,
          ),
        ),
      ),
    );
  }
}

class ChatSendButton extends StatelessWidget {
  const ChatSendButton({
    required this.onPressed,
    super.key,
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        onPressed();
      },
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
