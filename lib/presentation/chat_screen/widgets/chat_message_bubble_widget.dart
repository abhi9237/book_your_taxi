import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class ChatDateLabel extends StatelessWidget {
  final String label;

  const ChatDateLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: ColorConstant.blackGreyColor.withValues(alpha: 0.75),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.6,
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final String senderName;
  final bool isOutgoing;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.senderName,
    required this.isOutgoing,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isOutgoing ? ColorConstant.appColor : ColorConstant.whiteColor;
    final textColor = isOutgoing ? ColorConstant.whiteColor : ColorConstant.blackColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.72,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.circular(14),
                border: isOutgoing
                    ? null
                    : Border.all(
                        color: ColorConstant.lightGreyColor.withValues(alpha: 0.1),
                      ),
                boxShadow: isOutgoing
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.55,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _ChatMetaRow(
            senderName: senderName,
            time: time,
            isOutgoing: isOutgoing,
          ),
        ],
      ),
    );
  }
}

class VoiceChatBubble extends StatelessWidget {
  final String time;
  final String senderName;

  const VoiceChatBubble({
    super.key,
    required this.time,
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.72,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              decoration: BoxDecoration(
                color: ColorConstant.appColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: ColorConstant.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: ColorConstant.appColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(18, (index) {
                          final heights = <double>[7, 14, 10, 16, 9, 18, 12, 15, 8, 17, 11, 13, 18, 9, 14, 10, 16, 8];
                          return Container(
                            width: 2.6,
                            height: heights[index],
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: index > 12 ? 0.32 : 0.9),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '0:13',
                    style: TextStyle(
                      color: ColorConstant.whiteColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          _ChatMetaRow(
            senderName: senderName,
            time: time,
            isOutgoing: true,
          ),
        ],
      ),
    );
  }
}

class _ChatMetaRow extends StatelessWidget {
  final String senderName;
  final String time;
  final bool isOutgoing;

  const _ChatMetaRow({
    required this.senderName,
    required this.time,
    required this.isOutgoing,
  });

  @override
  Widget build(BuildContext context) {
    final nameParts = senderName.trim().split(RegExp(r'\s+'));
    final initials = nameParts.isEmpty
        ? 'U'
        : nameParts.take(2).map((part) => part.isNotEmpty ? part[0] : '').join();

    final avatar = CircleAvatar(
      radius: 11,
      backgroundColor: ColorConstant.blackGreyColor.withValues(alpha: 0.18),
      child: Text(
        initials.toUpperCase(),
        style: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w700,
          color: ColorConstant.blackColor,
        ),
      ),
    );

    final text = Text(
      senderName,
      style: TextStyle(
        color: ColorConstant.blackGreyColor.withValues(alpha: 0.92),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );

    final timeText = Text(
      time,
      style: TextStyle(
        color: ColorConstant.appColor.withValues(alpha: 0.88),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );

    if (isOutgoing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          timeText,
          Row(
            children: [
              avatar,
              const SizedBox(width: 6),
              text,
            ],
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            avatar,
            const SizedBox(width: 6),
            text,
          ],
        ),
        timeText,
      ],
    );
  }
}
