import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  // ============================================================
  // COLORS
  // ============================================================

  static const Color primary = Color(0xFFFF6B00);
  static const Color primaryDark = Color(0xFFA04100);
  static const Color secondary = Color(0xFF4B41E1);

  static const Color background = Color(0xFFFAF8FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color muted = Color(0xFFF1F5F9);

  static const Color textColor = Color(0xFF131B2E);
  static const Color secondaryText = Color(0xFF5A4136);
  static const Color borderColor = Color(0xFFE2E8F0);

  // ============================================================
  // STATE
  // ============================================================

  int selectedIndex = 1;

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop = constraints.maxWidth >= 900;

        return Scaffold(
          backgroundColor: background,

          // Desktop AppBar
          appBar: desktop ? _desktopAppBar() : null,

          // Mobile Bottom Navigation
          bottomNavigationBar:
              desktop ? null : _mobileNavigation(),

          body: SafeArea(
            bottom: desktop,
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
                      _header(desktop),

                      const SizedBox(height: 24),

                      _dailyChallenge(desktop),

                      const SizedBox(height: 28),

                      _aiRecommendations(),

                      const SizedBox(height: 28),

                      _practiceCategories(desktop),

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
      backgroundColor: surface,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 40,
      title: Row(
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

          const SizedBox(width: 25),

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
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 20),

          _profile(),
        ],
      ),
    );
  }

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
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
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
  // HEADER
  // ============================================================

  Widget _header(bool desktop) {
    if (desktop) {
      return Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: const [
          Text(
            "Practice",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),

          SizedBox(height: 6),

          Text(
            "Improve the skills that matter for your placement.",
            style: TextStyle(
              fontSize: 14,
              color: secondaryText,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: const [
        Text(
          "Practice",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),

        SizedBox(height: 6),

        Text(
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

  Widget _dailyChallenge(bool desktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        desktop ? 24 : 20,
      ),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circle
          Positioned(
            right: -35,
            top: -35,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
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
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color:
                          Colors.white.withOpacity(0.20),
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

              const SizedBox(height: 14),

              const Text(
                "Array Manipulation & Hashmaps",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 17,
                    color:
                        Colors.white.withOpacity(0.80),
                  ),

                  const SizedBox(width: 6),

                  Text(
                    "45 mins",
                    style: TextStyle(
                      color:
                          Colors.white.withOpacity(0.80),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showMessage(
                      "Starting today's challenge...",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: primary,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 13,
                    ),
                    shape:
                        RoundedRectangleBorder(
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
        Row(
          children: [
            const Icon(
              Icons.smart_toy_outlined,
              color: secondary,
              size: 23,
            ),

            const SizedBox(width: 8),

            const Text(
              "AI Recommendations",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

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
            color: const Color(0xFFEEF2FF),
            borderRadius:
                BorderRadius.circular(10),
            border: Border.all(
              color: borderColor,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 58,
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius:
                      BorderRadius.circular(4),
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Review Linked Lists",
                      style: TextStyle(
                        color: secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "High priority for upcoming mock",
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {
                  _showMessage(
                    "Opening Linked Lists practice...",
                  );
                },
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

  Widget _practiceCategories(bool desktop) {
    final cards = [
      _practiceCard(
        title: "Aptitude",
        icon: Icons.calculate_outlined,
        description:
            "Quantitative Aptitude, Logical Reasoning, Verbal Ability",
        firstLabel: "Completed",
        firstValue: "120/500 Qs",
        secondLabel: "Score",
        secondValue: "85/100",
        buttonText: "Practice Now",
      ),

      _practiceCard(
        title: "Coding",
        icon: Icons.code,
        description:
            "Data Structures, Algorithms, Problem Solving",
        firstLabel: "Solved",
        firstValue: "45 Problems",
        secondLabel: "Score",
        secondValue: "780",
        buttonText: "Start Coding",
      ),

      _practiceCard(
        title: "Technical",
        icon: Icons.memory_outlined,
        description:
            "Core Java, Database, OOP, Computer Science fundamentals",
        firstLabel: null,
        firstValue: null,
        secondLabel: null,
        secondValue: null,
        buttonText: "Practice Technical",
      ),
    ];

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          "Practice Categories",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),

        const SizedBox(height: 14),

        if (desktop)
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: 16),
              Expanded(child: cards[1]),
              const SizedBox(width: 16),
              Expanded(child: cards[2]),
            ],
          )
        else
          Column(
            children: [
              cards[0],
              const SizedBox(height: 14),
              cards[1],
              const SizedBox(height: 14),
              cards[2],
            ],
          ),
      ],
    );
  }

  // ============================================================
  // PRACTICE CARD
  // ============================================================

  Widget _practiceCard({
    required String title,
    required IconData icon,
    required String description,
    String? firstLabel,
    String? firstValue,
    String? secondLabel,
    String? secondValue,
    required String buttonText,
  }) {
    final bool hasStats =
        firstLabel != null &&
        firstValue != null &&
        secondLabel != null &&
        secondValue != null;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surface,
        borderRadius:
            BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // Title + Icon
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
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

          const SizedBox(height: 10),

          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.45,
              color: secondaryText,
            ),
          ),

          const SizedBox(height: 14),

          // Statistics
          if (hasStats)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: muted,
                borderRadius:
                    BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _statItem(
                      firstLabel!,
                      firstValue!,
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 45,
                    color: borderColor,
                  ),

                  Expanded(
                    child: _statItem(
                      secondLabel!,
                      secondValue!,
                    ),
                  ),
                ],
              ),
            ),

          if (hasStats)
            const SizedBox(height: 14),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showMessage(
                  "$buttonText selected",
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: muted,
                foregroundColor: primaryDark,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 14,
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
  // STAT ITEM
  // ============================================================

  Widget _statItem(
    String label,
    String value,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: secondaryText,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
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
  // MOBILE NAVIGATION
  // ============================================================

  Widget _mobileNavigation() {
    return NavigationBar(
      selectedIndex: selectedIndex,
      backgroundColor: surface,
      indicatorColor: const Color(0xFFFFE9DC),

      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },

      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
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

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}