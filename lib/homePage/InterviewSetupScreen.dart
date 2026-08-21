import 'package:flutter/material.dart';
import 'package:devmirrorui/core/utils/dimensions.dart';
import 'package:devmirrorui/homePage/InterviewRoomScreen.dart';

class InterviewSetupScreen extends StatefulWidget {
  const InterviewSetupScreen({super.key});

  @override
  State<InterviewSetupScreen> createState() => _InterviewSetupScreenState();
}

class _InterviewSetupScreenState extends State<InterviewSetupScreen> {
  String selectedRole = 'Software Development Engineer';
  String selectedDifficulty = 'Medium';
  List<String> selectedTopics = ['Data Structures', 'System Design'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Configure Mock Interview', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimensions.w(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Target Role', style: TextStyle(fontSize: Dimensions.sp(16), fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.h(10)),
              _buildDropdown(['Software Development Engineer', 'Frontend Engineer', 'Backend Engineer'], selectedRole, (val) {
                setState(() => selectedRole = val!);
              }),
              SizedBox(height: Dimensions.h(24)),
              
              Text('Difficulty Level', style: TextStyle(fontSize: Dimensions.sp(16), fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.h(10)),
              _buildDropdown(['Easy', 'Medium', 'Hard'], selectedDifficulty, (val) {
                setState(() => selectedDifficulty = val!);
              }),
              SizedBox(height: Dimensions.h(24)),

              Text('Focus Topics', style: TextStyle(fontSize: Dimensions.sp(16), fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.h(10)),
              Wrap(
                spacing: Dimensions.w(8),
                runSpacing: Dimensions.h(8),
                children: [
                  _buildTopicChip('Data Structures'),
                  _buildTopicChip('Algorithms'),
                  _buildTopicChip('System Design'),
                  _buildTopicChip('Behavioral'),
                ],
              ),
              
              SizedBox(height: Dimensions.h(40)),
              
              SizedBox(
                width: double.infinity,
                height: Dimensions.h(56),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.w(12))),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const InterviewRoomScreen()));
                  },
                  child: Text('Start Interview', style: TextStyle(fontSize: Dimensions.sp(18), fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(List<String> items, String value, Function(String?) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.w(8)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildTopicChip(String label) {
    final isSelected = selectedTopics.contains(label);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            selectedTopics.add(label);
          } else {
            selectedTopics.remove(label);
          }
        });
      },
      selectedColor: const Color(0xFFFF6B00).withOpacity(0.2),
      checkmarkColor: const Color(0xFFFF6B00),
      labelStyle: TextStyle(color: isSelected ? const Color(0xFFFF6B00) : Colors.black87),
    );
  }
}
