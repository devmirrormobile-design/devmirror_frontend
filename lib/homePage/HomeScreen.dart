import 'package:flutter/material.dart';
import 'package:devmirrorui/homePage/PracticeScreen.dart';
import 'package:devmirrorui/homePage/InterviewScreen.dart';
import 'package:devmirrorui/homePage/InterviewSetupScreen.dart';
import 'package:devmirrorui/homePage/ProgressScreen.dart';
import 'package:devmirrorui/core/utils/dimensions.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // ============================================================
  // COLORS
  // ============================================================

  static const primary = Color(0xFFFF6B00);
  static const secondary = Color(0xFF645EFB);
  static const background = Color(0xFFF8FAFC);
  static const textColor = Color(0xFF131B2E);
  static const secondaryText = Color(0xFF5A4136);
  static const borderColor = Color(0xFFE2E8F0);
  static const muted = Color(0xFFF1F5F9);

  // ============================================================
  // STATE / DASHBOARD DATA
  // ============================================================

  String userName = "Jayaprakash";

  int readiness = 75;
  int aptitude = 92;
  int coding = 78;
  int technical = 65;
  int communication = 88;

  int selectedIndex = 0;

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop = constraints.maxWidth >= 900;

        return Scaffold(
          backgroundColor: background,

          appBar: desktop ? _desktopAppBar() : null,

          bottomNavigationBar: desktop ? null : _mobileNavigation(),

          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: desktop ? 40 : 16,
                vertical: 24,
              ),

              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      if (!desktop) _mobileHeader(),

                      if (desktop) _desktopGreeting(),

                      _readinessCard(),

                      const SizedBox(height: 30),

                      _skillsSection(),

                      const SizedBox(height: 30),

                      _mainContent(desktop),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // DESKTOP APP BAR
  // ============================================================

  PreferredSizeWidget _desktopAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 40,

      title: Row(
        children: [
          const Icon(Icons.code, color: primary, size: 30),

          const SizedBox(width: 8),

          const Text(
            "DevMirror",
            style: TextStyle(
              color: primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const Spacer(),

          _navItem(Icons.home, "Home", true, () {}),

          _navItem(Icons.fitness_center, "Practice", false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PracticePage()),
            );
          }),

          _navItem(Icons.video_camera_front, "Interview", false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InterviewSetupScreen()),
            );
          }),

          _navItem(Icons.trending_up, "Progress", false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProgressScreen()),
            );
          }),

          const SizedBox(width: 25),

          Stack(
            children: [
              const Icon(
                Icons.notifications_outlined,
                color: secondaryText,
                size: 26,
              ),

              Positioned(right: 0, top: 0, child: _notificationDot()),
            ],
          ),

          const SizedBox(width: 20),

          _profile(),
        ],
      ),
    );
  }

  // ============================================================
  // NAV ITEM
  // ============================================================

  Widget _navItem(
    IconData icon,
    String title,
    bool selected,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),

      child: InkWell(
        onTap: onTap,

        child: Row(
          children: [
            Icon(icon, size: 20, color: selected ? primary : secondaryText),

            const SizedBox(width: 5),

            Text(
              title,
              style: TextStyle(
                color: selected ? primary : secondaryText,
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE HEADER
  // ============================================================

  Widget _mobileHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),

      child: Row(
        children: [
          _profile(),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "Good Morning!",
                  style: TextStyle(fontSize: 13, color: secondaryText),
                ),

                const SizedBox(height: 3),

                Text(
                  "Ready for your next placement challenge?",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),

          Stack(
            children: [
              IconButton(
                onPressed: () {},

                icon: const Icon(
                  Icons.notifications_outlined,
                  color: secondaryText,
                ),
              ),

              Positioned(right: 8, top: 8, child: _notificationDot()),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // NOTIFICATION DOT
  // ============================================================

  Widget _notificationDot() {
    return Container(
      width: 8,
      height: 8,

      decoration: const BoxDecoration(color: primary, shape: BoxShape.circle),
    );
  }

  // ============================================================
  // PROFILE
  // ============================================================

  Widget _profile() {
    return Container(
      width: 42,
      height: 42,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),

      child: const CircleAvatar(
        backgroundColor: muted,

        child: Icon(Icons.person, color: secondaryText),
      ),
    );
  }

  // ============================================================
  // DESKTOP GREETING
  // ============================================================

  Widget _desktopGreeting() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Good Morning!",
            style: TextStyle(fontSize: 16, color: secondaryText),
          ),

          const SizedBox(height: 5),

          Text(
            "Ready for your next placement challenge, $userName?",

            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // READINESS CARD
  // ============================================================

  Widget _readinessCard() {
    return Card(
      color: Colors.white,
      elevation: 1,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

        side: const BorderSide(color: borderColor),
      ),

      child: Padding(
        padding: const EdgeInsets.all(24),

        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool small = constraints.maxWidth < 550;

            if (small) {
              return Column(
                children: [
                  _readinessInfo(),

                  const SizedBox(height: 25),

                  _progressCircle(),
                ],
              );
            }

            return Row(
              children: [
                Expanded(child: _readinessInfo()),

                const SizedBox(width: 30),

                _progressCircle(),
              ],
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // READINESS INFO
  // ============================================================

  Widget _readinessInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Placement Readiness",

          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "You are on track. Keep up the good work on data structures to boost your score.",

          style: TextStyle(fontSize: 15, height: 1.5, color: secondaryText),
        ),

        const SizedBox(height: 18),

        _statusChip(),

        const SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            // Navigate to progress page
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,

            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          child: const Text(
            "View Progress",

            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STATUS CHIP
  // ============================================================

  Widget _statusChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),

      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(30),
      ),

      child: const Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(Icons.verified, size: 17, color: secondary),

          SizedBox(width: 5),

          Text(
            "Placement Ready",

            style: TextStyle(
              color: secondary,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROGRESS CIRCLE
  // ============================================================

  Widget _progressCircle() {
    return SizedBox(
      width: 160,
      height: 160,

      child: Stack(
        alignment: Alignment.center,

        children: [
          SizedBox(
            width: 150,
            height: 150,

            child: CircularProgressIndicator(
              value: readiness / 100,
              strokeWidth: 10,
              backgroundColor: muted,

              valueColor: const AlwaysStoppedAnimation<Color>(primary),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "$readiness%",

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const Text(
                "Overall",

                style: TextStyle(fontSize: 13, color: secondaryText),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // YOUR SKILLS
  // ============================================================

  Widget _skillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          children: [
            const Text(
              "Your Skills",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {},

              child: const Text("View All", style: TextStyle(color: primary)),
            ),
          ],
        ),

        const SizedBox(height: 10),

        LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;

            // ==================================================
            // DESKTOP
            // ==================================================

            if (width >= 900) {
              return Row(
                children: [
                  Expanded(
                    child: _skillCard(
                      "Aptitude",
                      aptitude,
                      Icons.calculate_outlined,
                      5,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(child: _skillCard("Coding", coding, Icons.code, 8)),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _skillCard(
                      "Technical Core",
                      technical,
                      Icons.dns_outlined,
                      null,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _skillCard(
                      "Communication",
                      communication,
                      Icons.forum_outlined,
                      2,
                    ),
                  ),
                ],
              );
            }

            // ==================================================
            // MOBILE / TABLET
            // ==================================================

            return Wrap(
              spacing: 12,
              runSpacing: 12,

              children: [
                SizedBox(
                  width: (width - 12) / 2,

                  child: _skillCard(
                    "Aptitude",
                    aptitude,
                    Icons.calculate_outlined,
                    5,
                  ),
                ),

                SizedBox(
                  width: (width - 12) / 2,

                  child: _skillCard("Coding", coding, Icons.code, 8),
                ),

                SizedBox(
                  width: (width - 12) / 2,

                  child: _skillCard(
                    "Technical Core",
                    technical,
                    Icons.dns_outlined,
                    null,
                  ),
                ),

                SizedBox(
                  width: (width - 12) / 2,

                  child: _skillCard(
                    "Communication",
                    communication,
                    Icons.forum_outlined,
                    2,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  // ============================================================
  // SKILL CARD
  // ============================================================

  Widget _skillCard(String title, int score, IconData icon, int? increase) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: borderColor),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: muted,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Icon(icon, color: secondaryText, size: 22),
              ),

              const Spacer(),

              if (increase != null) _increaseChip(increase),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(fontSize: 12, color: secondaryText),
          ),

          const SizedBox(height: 3),

          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$score",

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                const TextSpan(
                  text: "/100",

                  style: TextStyle(fontSize: 12, color: secondaryText),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: LinearProgressIndicator(
              value: score / 100,
              minHeight: 5,
              backgroundColor: muted,

              valueColor: const AlwaysStoppedAnimation<Color>(primary),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INCREASE CHIP
  // ============================================================

  Widget _increaseChip(int value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),

      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        "+$value%",

        style: const TextStyle(
          color: secondary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ============================================================
  // MAIN CONTENT
  // ============================================================

  Widget _mainContent(bool desktop) {
    if (!desktop) {
      return Column(
        children: [
          _continuePreparation(),

          const SizedBox(height: 24),

          _recommendations(),

          const SizedBox(height: 24),

          _recentActivity(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Expanded(
          flex: 2,

          child: Column(
            children: [
              _continuePreparation(),

              const SizedBox(height: 24),

              _recommendations(),
            ],
          ),
        ),

        const SizedBox(width: 24),

        Expanded(child: _recentActivity()),
      ],
    );
  }

  // ============================================================
  // CONTINUE PREPARATION
  // ============================================================

  Widget _continuePreparation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Continue Preparation",

          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),

            border: Border.all(color: borderColor),
          ),

          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool small = constraints.maxWidth < 550;

              // ==================================================
              // MOBILE
              // ==================================================

              if (small) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        _topicIcon(),

                        const SizedBox(width: 14),

                        Expanded(child: _topicText()),
                      ],
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,

                      child: OutlinedButton(
                        onPressed: () {},

                        child: const Text("Resume"),
                      ),
                    ),
                  ],
                );
              }

              // ==================================================
              // DESKTOP / TABLET
              // ==================================================

              return Row(
                children: [
                  _topicIcon(),

                  const SizedBox(width: 16),

                  Expanded(child: _topicText()),

                  const SizedBox(width: 16),

                  OutlinedButton(onPressed: () {}, child: const Text("Resume")),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // ============================================================
  // TOPIC ICON
  // ============================================================

  Widget _topicIcon() {
    return Container(
      width: 64,
      height: 64,

      decoration: BoxDecoration(
        color: muted,
        borderRadius: BorderRadius.circular(10),
      ),

      child: const Icon(Icons.account_tree, color: primary, size: 32),
    );
  }

  // ============================================================
  // TOPIC TEXT
  // ============================================================

  Widget _topicText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          "NEXT RECOMMENDED TOPIC",

          style: TextStyle(
            fontSize: 11,
            letterSpacing: 1,
            color: secondaryText,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 5),

        Text(
          "Advanced Data Structures",

          maxLines: 2,
          overflow: TextOverflow.ellipsis,

          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),

        SizedBox(height: 4),

        Text(
          "Focus area: Graph Theory & Algorithms",

          maxLines: 2,
          overflow: TextOverflow.ellipsis,

          style: TextStyle(fontSize: 13, color: secondaryText),
        ),
      ],
    );
  }

  // ============================================================
  // RECOMMENDATIONS
  // ============================================================

  Widget _recommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Row(
          children: [
            Icon(Icons.auto_awesome, color: secondary, size: 22),

            SizedBox(width: 8),

            Text(
              "Recommended For You",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 205,

          child: ListView(
            scrollDirection: Axis.horizontal,

            children: [
              _recommendationCard(
                Icons.psychology,
                "Practice Weak Skills",
                "Focus on Technical Core concepts to improve your readiness score.",
                "Start Practice",
                true,
              ),

              const SizedBox(width: 12),

              _recommendationCard(
                Icons.code,
                "Coding Challenge",
                "Daily 30-min challenge: Dynamic Programming basics.",
                "Solve Now",
                false,
              ),

              const SizedBox(width: 12),

              _recommendationCard(
                Icons.video_camera_front,
                "AI Mock Interview",
                "Simulate a technical round with our AI recruiter.",
                "Schedule",
                false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // RECOMMENDATION CARD
  // ============================================================

  Widget _recommendationCard(
    IconData icon,
    String title,
    String description,
    String action,
    bool ai,
  ) {
    return SizedBox(
      width: 260,

      child: Card(
        color: ai ? const Color(0xFFF5F3FF) : Colors.white,

        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),

          side: const BorderSide(color: borderColor),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Icon(icon, color: ai ? secondary : secondaryText, size: 20),

                  if (ai) ...[
                    const SizedBox(width: 8),

                    const Text(
                      "AI INSIGHT",

                      style: TextStyle(
                        color: secondary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 12),

              Text(
                title,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 6),

              Expanded(
                child: Text(
                  description,

                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: secondaryText,
                  ),
                ),
              ),

              Row(
                children: [
                  Text(
                    action,

                    style: const TextStyle(
                      color: primary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 4),

                  const Icon(Icons.arrow_forward, color: primary, size: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // RECENT ACTIVITY
  // ============================================================

  Widget _recentActivity() {
    return Card(
      color: Colors.white,
      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),

        side: const BorderSide(color: borderColor),
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Recent Activity",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),

            const SizedBox(height: 22),

            _activity(
              Icons.assignment,
              "Today, 10:30 AM",
              "Quantitative Aptitude",
              "Assessment",
              "Score: 92",
              primary,
              false,
            ),

            _activity(
              Icons.terminal,
              "Yesterday",
              "String Manipulation",
              "Coding attempt",
              "Passed",
              Colors.green,
              false,
            ),

            _activity(
              Icons.group,
              "Oct 12",
              "Mock HR Round",
              "Interview",
              "Feedback: Excellent",
              secondary,
              true,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ACTIVITY
  // ============================================================

  Widget _activity(
    IconData icon,
    String date,
    String title,
    String type,
    String result,
    Color resultColor,
    bool last,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          width: 40,

          child: Column(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: muted,

                child: Icon(icon, size: 18, color: secondaryText),
              ),

              if (!last) Container(width: 1, height: 65, color: borderColor),
            ],
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  date,

                  style: const TextStyle(fontSize: 11, color: secondaryText),
                ),

                const SizedBox(height: 4),

                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 6),

                Wrap(
                  spacing: 6,
                  runSpacing: 5,

                  children: [
                    _tag(type, secondaryText),

                    _tag(result, resultColor),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // TAG
  // ============================================================

  Widget _tag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),

      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(5),
      ),

      child: Text(
        text,

        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE NAVIGATION
  // ============================================================

  Widget _mobileNavigation() {
    return NavigationBar(
      selectedIndex: selectedIndex,

      backgroundColor: Colors.white,

      indicatorColor: const Color(0xFFFFE9DC),
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });

        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PracticePage()),
          );
        }

        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InterviewSetupScreen()),
          );
        }

        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProgressScreen()),
          );
        }
      },

      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: "Home",
        ),

        NavigationDestination(
          icon: Icon(Icons.fitness_center_outlined),
          selectedIcon: Icon(Icons.fitness_center),
          label: "Practice",
        ),

        NavigationDestination(
          icon: Icon(Icons.video_camera_front_outlined),
          selectedIcon: Icon(Icons.video_camera_front),
          label: "Interview",
        ),

        NavigationDestination(
          icon: Icon(Icons.trending_up_outlined),
          selectedIcon: Icon(Icons.trending_up),
          label: "Progress",
        ),

        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
