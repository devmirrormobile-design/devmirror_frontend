import 'package:flutter/material.dart';

class InterviewPage extends StatefulWidget {
  const InterviewPage({super.key});

  @override
  State<InterviewPage> createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  // ============================================================
  // COLORS
  // ============================================================

  static const primary = Color(0xFFFF6B00);
  static const secondary = Color(0xFF4B41E1);
  static const background = Color(0xFFF8FAFC);
  static const textColor = Color(0xFF131B2E);
  static const secondaryText = Color(0xFF5A4136);
  static const borderColor = Color(0xFFE2E8F0);
  static const muted = Color(0xFFF1F5F9);
  static const aiBackground = Color(0xFFEEF2FF);

  int selectedIndex = 1;

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool desktop = constraints.maxWidth >= 900;

            return Column(
              children: [
                if (desktop) _desktopHeader(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: desktop ? 40 : 16,
                      vertical: desktop ? 32 : 24,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1200,
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            if (!desktop) _mobileHeader(),

                            _pageTitle(),

                            const SizedBox(height: 24),

                            _dailyChallenge(),

                            const SizedBox(height: 28),

                            _aiRecommendations(),

                            const SizedBox(height: 28),

                            _practiceCategories(),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

      bottomNavigationBar: MediaQuery.of(context).size.width < 900
          ? _mobileNavigation()
          : null,
    );
  }

  // ============================================================
  // DESKTOP HEADER
  // ============================================================

  Widget _desktopHeader() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.code,
            color: primary,
            size: 30,
          ),

          const SizedBox(width: 8),

          const Text(
            "DevMirror",
            style: TextStyle(
              color: primary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          _desktopNavItem(
            Icons.home_outlined,
            "Home",
            false,
          ),

          _desktopNavItem(
            Icons.fitness_center,
            "Practice",
            true,
          ),

          _desktopNavItem(
            Icons.video_camera_front_outlined,
            "Interview",
            false,
          ),

          _desktopNavItem(
            Icons.trending_up,
            "Progress",
            false,
          ),

          const SizedBox(width: 20),

          Stack(
            children: [
              const Icon(
                Icons.notifications_outlined,
                color: secondaryText,
                size: 26,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: _notificationDot(),
              ),
            ],
          ),

          const SizedBox(width: 20),

          _profile(),
        ],
      ),
    );
  }

  // ============================================================
  // DESKTOP NAV ITEM
  // ============================================================

  Widget _desktopNavItem(
    IconData icon,
    String title,
    bool selected,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          if (title == "Home") {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color:
                    selected ? primary : secondaryText,
              ),

              const SizedBox(width: 5),

              Text(
                title,
                style: TextStyle(
                  color:
                      selected ? primary : secondaryText,
                  fontWeight: selected
                      ? FontWeight.bold
                      : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE HEADER
  // ============================================================

  Widget _mobileHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: textColor,
            ),
          ),

          const SizedBox(width: 4),

          const Expanded(
            child: Text(
              "Practice",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
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

              Positioned(
                right: 8,
                top: 8,
                child: _notificationDot(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PAGE TITLE
  // ============================================================

  Widget _pageTitle() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          "Practice",
          style: TextStyle(
            fontSize:
                MediaQuery.of(context).size.width >= 900
                    ? 36
                    : 24,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          "Improve the skills that matter for your placement.",
          style: TextStyle(
            fontSize: 14,
            color: secondaryText,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DAILY CHALLENGE
  // ============================================================

  Widget _dailyChallenge() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Today's Challenge",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.20),
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Medium",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              const Text(
                "Array Manipulation & Hashmaps",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: const [
                  Icon(
                    Icons.schedule,
                    color: Colors.white70,
                    size: 17,
                  ),

                  SizedBox(width: 6),

                  Text(
                    "45 mins",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: primary,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 13,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Start Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // AI RECOMMENDATIONS
  // ============================================================

  Widget _aiRecommendations() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.smart_toy,
              color: secondary,
              size: 23,
            ),

            SizedBox(width: 8),

            Text(
              "AI Recommendations",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        const Text(
          "Based on your competency gaps",
          style: TextStyle(
            fontSize: 14,
            color: secondaryText,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: aiBackground,
            borderRadius:
                BorderRadius.circular(10),
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 55,
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius:
                      BorderRadius.circular(5),
                ),
              ),

              const SizedBox(width: 14),

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Review Linked Lists",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: secondary,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "High priority for upcoming mock",
                      style: TextStyle(
                        fontSize: 13,
                        color: secondaryText,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  color: secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PRACTICE CATEGORIES
  // ============================================================

  Widget _practiceCategories() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop =
            constraints.maxWidth >= 900;

        final cards = [
          _categoryCard(
            "Aptitude",
            "Quantitative Aptitude, Logical Reasoning, Verbal Ability",
            Icons.calculate_outlined,
            "120/500 Qs",
            "85/100",
            "Practice Now",
          ),

          _categoryCard(
            "Coding",
            "Data Structures, Algorithms, Problem Solving",
            Icons.code,
            "45 Problems",
            "780",
            "Start Coding",
          ),

          _categoryCard(
            "Technical",
            "Core Java, Database, OOP, Computer Science fundamentals",
            Icons.memory,
            null,
            null,
            "Practice Technical",
          ),
        ];

        if (desktop) {
          return Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: 16),
              Expanded(child: cards[1]),
              const SizedBox(width: 16),
              Expanded(child: cards[2]),
            ],
          );
        }

        return Column(
          children: [
            cards[0],
            const SizedBox(height: 16),
            cards[1],
            const SizedBox(height: 16),
            cards[2],
          ],
        );
      },
    );
  }

  // ============================================================
  // CATEGORY CARD
  // ============================================================

  Widget _categoryCard(
    String title,
    String description,
    IconData icon,
    String? completed,
    String? score,
    String buttonText,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(14),
        border: Border.all(
          color: borderColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),

              Icon(
                icon,
                color: secondaryText,
                size: 24,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: secondaryText,
            ),
          ),

          if (completed != null &&
              score != null) ...[
            const SizedBox(height: 16),

            Container(
              padding:
                  const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: muted,
                borderRadius:
                    BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: 11,
                            color: secondaryText,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          completed,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight:
                                FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 35,
                    color: borderColor,
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Score",
                          style: TextStyle(
                            fontSize: 11,
                            color: secondaryText,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          score,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight:
                                FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),
          ] else
            const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: muted,
                foregroundColor: primary,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
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
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: const CircleAvatar(
        backgroundColor: muted,
        child: Icon(
          Icons.person,
          color: secondaryText,
        ),
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
      decoration: const BoxDecoration(
        color: primary,
        shape: BoxShape.circle,
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
      indicatorColor:
          const Color(0xFFFFE9DC),

      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });

        if (index == 0) {
          Navigator.pop(context);
        }
      },

      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.home_outlined,
          ),
          selectedIcon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),

        NavigationDestination(
          icon: Icon(
            Icons.fitness_center_outlined,
          ),
          selectedIcon: Icon(
            Icons.fitness_center,
          ),
          label: "Practice",
        ),

        NavigationDestination(
          icon: Icon(
            Icons.video_camera_front_outlined,
          ),
          selectedIcon: Icon(
            Icons.video_camera_front,
          ),
          label: "Interview",
        ),

        NavigationDestination(
          icon: Icon(
            Icons.trending_up_outlined,
          ),
          selectedIcon: Icon(
            Icons.trending_up,
          ),
          label: "Progress",
        ),

        NavigationDestination(
          icon: Icon(
            Icons.person_outline,
          ),
          selectedIcon: Icon(
            Icons.person,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}