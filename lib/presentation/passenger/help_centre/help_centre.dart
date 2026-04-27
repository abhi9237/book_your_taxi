import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/color_constant/color_constant.dart';
import 'widgets/help_centre_faq_item_widget.dart';
import 'widgets/help_centre_header_widget.dart';

class HelpCentreScreen extends StatefulWidget {
  const HelpCentreScreen({super.key});

  @override
  State<HelpCentreScreen> createState() => _HelpCentreScreenState();
}

class _HelpCentreScreenState extends State<HelpCentreScreen> {
  int _selectedTab = 0;
  int _selectedCategory = 0;
  int _expandedIndex = 0;

  final List<String> _categories = const [
    'All',
    'Services',
    'General',
    'Account',
  ];

  final List<_FaqItemData> _faqItems = const [
    _FaqItemData(
      question: 'What if I need to cancel a booking?',
      answer:
          'You can cancel a booking from the trip details page before the driver arrives. Cancellation fees may apply depending on the trip status.',
    ),
    _FaqItemData(
      question: 'Is safe to use App?',
      answer:
          'Yes. We use secure trip handling, verified driver details, and in-app communication to keep every ride safer and easier to track.',
    ),
    _FaqItemData(
      question: 'How do I receive Booking Details?',
      answer:
          'Your booking details are shown right after confirmation and are also available in your booking history and ride notifications.',
    ),
    _FaqItemData(
      question: 'How can I edit my profile information?',
      answer:
          'Open your profile, tap edit, and update your name, phone number, email, or other account details from the profile screen.',
    ),
    _FaqItemData(
      question: 'How to cancel Taxi?',
      answer:
          'Go to your active ride, open the options menu, and select cancel. The app will show any applicable cancellation charges before you confirm.',
    ),
    _FaqItemData(
      question: 'Is Voice call or Chat Feature there?',
      answer:
          'Yes. You can contact the driver through in-app chat or call once the ride is confirmed and the trip is active.',
    ),
    _FaqItemData(
      question: 'How to see pre-booked Taxi?',
      answer:
          'Pre-booked rides appear in your bookings screen and upcoming trips section, where you can review the schedule and ride status.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            HelpCentreHeaderWidget(
              onBackTap: () => context.pop(),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSearchField(),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildTopTabs(),
            ),
            const SizedBox(height: 2),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFECECEC),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: _selectedTab == 0
                    ? _buildFaqTab()
                    : _buildContactUsTab(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: ColorConstant.appColor,
            size: 24,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: ColorConstant.blackGreyColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildTopTabs() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedTab = 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'FAQ',
                  style: TextStyle(
                    color: _selectedTab == 0
                        ? ColorConstant.appColor
                        : ColorConstant.blackGreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: 4,
                  width: 130,
                  decoration: BoxDecoration(
                    color: _selectedTab == 0
                        ? ColorConstant.appColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedTab = 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Contact Us',
                  style: TextStyle(
                    color: _selectedTab == 1
                        ? ColorConstant.appColor
                        : ColorConstant.blackGreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: 4,
                  width: 130,
                  decoration: BoxDecoration(
                    color: _selectedTab == 1
                        ? ColorConstant.appColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFaqTab() {
    return ListView(
      key: const ValueKey('faq_tab'),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      children: [
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final isSelected = index == _selectedCategory;
              return GestureDetector(
                onTap: () => setState(() => _selectedCategory = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorConstant.appColor
                        : const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    _categories[index],
                    style: TextStyle(
                      color: isSelected
                          ? ColorConstant.whiteColor
                          : ColorConstant.blackGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 18),
        ...List.generate(_faqItems.length, (index) {
          final item = _faqItems[index];
          final expanded = index == _expandedIndex;
          return Padding(
            padding: EdgeInsets.only(bottom: index == _faqItems.length - 1 ? 0 : 14),
            child: HelpCentreFaqItemWidget(
              question: item.question,
              answer: item.answer,
              expanded: expanded,
              onTap: () {
                setState(() {
                  _expandedIndex = expanded ? -1 : index;
                });
              },
            ),
          );
        }),
      ],
    );
  }

  Widget _buildContactUsTab() {
    return Center(
      key: const ValueKey('contact_tab'),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.support_agent_rounded,
              color: ColorConstant.appColor,
              size: 56,
            ),
            const SizedBox(height: 16),
            const Text(
              'Need more help?',
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Reach us by email, phone, or in-app chat and we will get back to you shortly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.blackGreyColor.withValues(alpha: 0.9),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqItemData {
  final String question;
  final String answer;

  const _FaqItemData({
    required this.question,
    required this.answer,
  });
}
