import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_header_widget.dart';
import 'widgets/chat_input_widget.dart';
import 'widgets/chat_message_bubble_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = <Widget>[
      const ChatBubble(
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '08:04 pm',
        senderName: 'Jenny Wilson',
        isOutgoing: false,
      ),
      const ChatBubble(
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '08:04 pm',
        senderName: 'Esther Howard',
        isOutgoing: true,
      ),
      const ChatBubble(
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '08:04 pm',
        senderName: 'Jenny Wilson',
        isOutgoing: false,
      ),
      const VoiceChatBubble(
        time: '08:04 pm',
        senderName: 'Esther Howard',
      ),
      const ChatBubble(
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '08:04 pm',
        senderName: 'Jenny Wilson',
        isOutgoing: false,
      ),
    ];

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 185,
              width: double.infinity,
              color: ColorConstant.appColor,
            ),
            Column(
              children: [
                const SizedBox(height: 12),
                ChatHeaderWidget(
                  onBackTap: () => Navigator.pop(context),
                  onCallTap: () {},
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        const ChatDateLabel(label: 'TODAY'),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                            children: messages,
                          ),
                        ),
                         ChatInputWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
