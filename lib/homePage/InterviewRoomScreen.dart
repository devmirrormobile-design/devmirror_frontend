import 'package:flutter/material.dart';
import 'package:devmirrorui/core/utils/dimensions.dart';
import 'package:devmirrorui/homePage/InterviewFeedbackScreen.dart';

class InterviewRoomScreen extends StatefulWidget {
  const InterviewRoomScreen({super.key});

  @override
  State<InterviewRoomScreen> createState() => _InterviewRoomScreenState();
}

class _InterviewRoomScreenState extends State<InterviewRoomScreen> {
  final TextEditingController _chatController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {"sender": "ai", "text": "Hello! I'm your AI interviewer today. Are you ready to begin?"}
  ];

  void _sendMessage() {
    if (_chatController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({"sender": "user", "text": _chatController.text.trim()});
        _chatController.clear();
      });
      // Mock AI response
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _messages.add({"sender": "ai", "text": "That's a great approach. Let's move on to the next question."});
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildVideoGrid(),
            _buildChatWindow(),
            _buildControlBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoGrid() {
    return Expanded(
      flex: 5,
      child: Stack(
        children: [
          // AI Video Placeholder
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFF1E293B),
            child: const Center(
              child: Icon(Icons.person, size: 100, color: Colors.grey),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
              child: const Text('AI Interviewer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          
          // User Video Placeholder
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: Dimensions.w(100),
              height: Dimensions.h(140),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white24),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatWindow() {
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(Dimensions.w(16)),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isUser = msg["sender"] == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.h(12)),
                      padding: EdgeInsets.all(Dimensions.w(12)),
                      constraints: BoxConstraints(maxWidth: Dimensions.screenWidth * 0.75),
                      decoration: BoxDecoration(
                        color: isUser ? const Color(0xFFFF6B00) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        msg["text"]!,
                        style: TextStyle(color: isUser ? Colors.white : Colors.black87),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.w(16), vertical: Dimensions.h(12)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _chatController,
              decoration: InputDecoration(
                hintText: 'Type your response...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                filled: true,
                fillColor: const Color(0xFFF1F5F9),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          SizedBox(width: Dimensions.w(8)),
          CircleAvatar(
            backgroundColor: const Color(0xFFFF6B00),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 20),
              onPressed: _sendMessage,
            ),
          ),
          SizedBox(width: Dimensions.w(8)),
          CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
              icon: const Icon(Icons.call_end, color: Colors.white, size: 20),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InterviewFeedbackScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
