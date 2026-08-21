import 'package:flutter/material.dart';
import 'package:devmirrorui/core/utils/dimensions.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Progress Analytics', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
              Text('Placement Readiness', style: TextStyle(fontSize: Dimensions.sp(20), fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.h(20)),
              
              Center(
                child: SizedBox(
                  width: Dimensions.w(200),
                  height: Dimensions.w(200),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: Dimensions.w(180),
                        height: Dimensions.w(180),
                        child: CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 14,
                          backgroundColor: const Color(0xFFE2E8F0),
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF6B00)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('75%', style: TextStyle(fontSize: Dimensions.sp(40), fontWeight: FontWeight.bold)),
                          Text('Overall Score', style: TextStyle(fontSize: Dimensions.sp(14), color: Colors.grey[700])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: Dimensions.h(40)),
              Text('Skill Breakdown', style: TextStyle(fontSize: Dimensions.sp(18), fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.h(16)),
              
              _buildSkillBar('Data Structures', 0.85),
              SizedBox(height: Dimensions.h(12)),
              _buildSkillBar('System Design', 0.60),
              SizedBox(height: Dimensions.h(12)),
              _buildSkillBar('Behavioral', 0.90),
              SizedBox(height: Dimensions.h(12)),
              _buildSkillBar('Aptitude', 0.72),
              
              SizedBox(height: Dimensions.h(40)),
              Text('Recent Milestones', style: TextStyle(fontSize: Dimensions.sp(18), fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.h(16)),
              
              _buildMilestoneCard('Completed 10 Mock Interviews', Icons.check_circle, Colors.green),
              SizedBox(height: Dimensions.h(12)),
              _buildMilestoneCard('Reached 85% in Data Structures', Icons.star, Colors.amber),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillBar(String skill, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(skill, style: TextStyle(fontSize: Dimensions.sp(14), fontWeight: FontWeight.w500)),
            Text('${(progress * 100).toInt()}%', style: TextStyle(fontSize: Dimensions.sp(14), fontWeight: FontWeight.bold, color: const Color(0xFFFF6B00))),
          ],
        ),
        SizedBox(height: Dimensions.h(8)),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: Dimensions.h(8),
            backgroundColor: const Color(0xFFE2E8F0),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF6B00)),
          ),
        ),
      ],
    );
  }

  Widget _buildMilestoneCard(String title, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(Dimensions.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.w(12)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          SizedBox(width: Dimensions.w(12)),
          Expanded(child: Text(title, style: TextStyle(fontSize: Dimensions.sp(15), fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
