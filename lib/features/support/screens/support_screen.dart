import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../support/widgets/chat_bubble.dart';
import '../../support/widgets/chat_status_indicator.dart';
import '../../support/widgets/message_composer.dart';

// A simple data model for a chat message
class ChatMessage {
  final String message;
  final String time;
  final bool isSender;
  final String? agentImageUrl;

  ChatMessage({
    required this.message,
    required this.time,
    required this.isSender,
    this.agentImageUrl,
  });
}

class SupportScreen extends StatefulWidget {
  static const routeName = '/support';

  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Manage the list of messages in state
  final List<ChatMessage> _messages = [
    ChatMessage(
      message: 'Hi! I\'m Sarah from customer support. How can I help you today?',
      time: '2:34 PM',
      isSender: false,
      agentImageUrl: 'assets/images/sarah.png',
    ),
    ChatMessage(
      message:
          'I\'m having trouble with my recent order. It shows as delivered but I haven\'t received it.',
      time: '2:35 PM',
      isSender: true,
    ),
    ChatMessage(
      message:
          'I understand your concern. Let me check your order details. Can you please provide your order number?',
      time: '2:36 PM',
      isSender: false,
      agentImageUrl: 'assets/images/sarah.png',
    ),
  ];

  void _handleSendPressed() {
    final text = _textController.text;
    if (text.trim().isEmpty) {
      return;
    }

    final newMessage = ChatMessage(
      message: text,
      time: DateFormat('h:mm a').format(DateTime.now()), // Get current time
      isSender: true,
    );

    setState(() {
      _messages.add(newMessage);
    });

    _textController.clear();

    // Scroll to the bottom of the list after sending a message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading:
              const IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
          title: const Text('Support'),
          actions: [
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.primaryGreen,
            labelColor: AppColors.primaryGreen,
            unselectedLabelColor: AppColors.textBody,
            tabs: [
              Tab(text: 'Live Chat'),
              Tab(text: 'FAQs'),
              Tab(text: 'Contact'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Live Chat Tab
            Column(
              children: [
                const ChatStatusIndicator(statusText: 'Agent available'),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      return ChatBubble(
                        message: msg.message,
                        time: msg.time,
                        isSender: msg.isSender,
                        agentImageUrl: msg.agentImageUrl,
                      );
                    },
                  ),
                ),
                MessageComposer(
                  controller: _textController,
                  onSendPressed: _handleSendPressed,
                ),
              ],
            ),

            // FAQs Tab (Placeholder)
            const Center(child: Text('FAQs will be displayed here')),

            // Contact Tab (Placeholder)
            const Center(child: Text('Contact information will be here')),
          ],
        ),
      ),
    );
  }
}

