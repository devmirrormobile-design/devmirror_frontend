import 'package:flutter/material.dart';
import 'package:devmirrorui/core/utils/dimensions.dart';

class InterviewFeedbackScreen extends StatelessWidget {
  const InterviewFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Interview Feedback', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimensions.w(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Dimensions.h(20)),
              Text('Overall Performance', style: TextStyle(fontSize: Dimensions.sp(18), fontWeight: FontWeight.bold)),
              SizedBox(height: Dimensions.h(20)),
              
              // Radial Gauge
              SizedBox(
                width: Dimensions.w(180),
                height: Dimensions.w(180),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: Dimensions.w(160),
                      height: Dimensions.w(160),
                      child: CircularProgressIndicator(
                        value: 0.85,
                        strokeWidth: 12,
                        backgroundColor: const Color(0xFFE2E8F0),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF6B00)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('85%', style: TextStyle(fontSize: Dimensions.sp(36), fontWeight: FontWeight.bold)),
                        Text('Excellent', style: TextStyle(fontSize: Dimensions.sp(14), color: Colors.grey[700])),
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: Dimensions.h(40)),
              
              _buildFeedbackSection('Strengths', ['Clear communication', 'Good understanding of System Design', 'Optimal algorithm choices'], Colors.green),
              SizedBox(height: Dimensions.h(20)),
              _buildFeedbackSection('Areas to Improve', ['Could be faster on coding edge cases', 'Consider space complexity earlier'], Colors.orange),
              
              SizedBox(height: Dimensions.h(40)),
              
              SizedBox(
                width: double.infinity,
                height: Dimensions.h(56),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFFF6B00),
                    side: const BorderSide(color: Color(0xFFFF6B00)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.w(12))),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text('Return to Dashboard', style: TextStyle(fontSize: Dimensions.sp(18), fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackSection(String title, List<String> points, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimensions.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.w(12)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics, color: color, size: 20),
              SizedBox(width: 8),
              Text(title, style: TextStyle(fontSize: Dimensions.sp(16), fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: Dimensions.h(12)),
          ...points.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(child: Text(p, style: TextStyle(color: Colors.black87, height: 1.4))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
