import 'package:devmirrorui/login/LoginPage.dart';
import 'package:devmirrorui/login/SignInPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      body: SafeArea(
        child: Stack(
          children: [

            // =========================================================
            // DECORATIVE BACKGROUND - TOP RIGHT
            // =========================================================

            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFB693).withOpacity(0.20),
                ),
              ),
            ),

            // =========================================================
            // DECORATIVE BACKGROUND - BOTTOM LEFT
            // =========================================================

            Positioned(
              bottom: -80,
              left: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEEF2FF).withOpacity(0.60),
                ),
              ),
            ),

            // =========================================================
            // MAIN CONTENT
            // =========================================================

            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 480,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      // =================================================
                      // ILLUSTRATION
                      // =================================================

                      Container(
                        width: 320,
                        height: 320,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 20,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),

                          child: Stack(
                            children: [

                              // -----------------------------------------
                              // IMAGE
                              // -----------------------------------------

                              Positioned.fill(
                                child: Image.network(
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuA7foXFDB4JPXMIRGUe8DNItTMlGAScCaoOc-4uHbeRshIAblcAkWeOOIHozGfxq8gvOkv-_WpUMBlliZCtSLq3lAPd6USGGOdj4bZ7-PTfTi4ITA6N0gZTrMScbw1WJdAqNAMaOAXdIdmebm-c45PdVuq_fd7_DTEkhC8D4qMTQZFbT_DL7h0TAOd_9fA66ulKG1trdW7BLY3XAtvMAnflKmdx7Wl2TD8QD2w5HV7YYXLt0c8ChCytaA',
                                  fit: BoxFit.cover,

                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Container(
                                      color: const Color(0xFFF8FAFC),
                                      child: const Center(
                                        child: Icon(
                                          Icons.auto_awesome,
                                          size: 80,
                                          color: Color(0xFFFF6B00),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // -----------------------------------------
                              // GLASS OVERLAY
                              // -----------------------------------------

                              Positioned.fill(
                                child: Container(
                                  color: Colors.white.withOpacity(0.20),
                                ),
                              ),

                              // -----------------------------------------
                              // AI READY BADGE
                              // -----------------------------------------

                              Positioned(
                                bottom: 16,
                                right: 16,

                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),

                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.90),
                                    borderRadius:
                                        BorderRadius.circular(50),

                                    border: Border.all(
                                      color:
                                          const Color(0xFFE2E8F0),
                                    ),

                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),

                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      // Orange dot
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFF6B00),
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      const Text(
                                        'AI Ready',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.65,
                                          color: Color(0xFF131B2E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // =================================================
                      // SPACE AFTER IMAGE
                      // =================================================

                      const SizedBox(height: 40),

                      // =================================================
                      // TITLE + DESCRIPTION
                      // =================================================

                      Column(
                        children: [

                          const Text(
                            'Your AI Placement Companion',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 32,
                              height: 1.25,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.32,
                              color: Color(0xFF131B2E),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const SizedBox(
                            width: 380,

                            child: Text(
                              'Build skills, practice interviews, identify gaps, and become placement ready.',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 16,
                                height: 1.625,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5A4136),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // =================================================
                      // SPACE BEFORE BUTTON
                      // =================================================

                      const SizedBox(height: 64),

                      // =================================================
                      // GET STARTED BUTTON
                      // =================================================

                      SizedBox(
                        width: double.infinity,
                        height: 56,

                        child: ElevatedButton(
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFFF6B00),

                            foregroundColor: Colors.white,

                            elevation: 4,

                            shadowColor:
                                const Color(0x33FF6B00),

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),
                          ),

                          child: const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,

                            children: [

                              Text(
                                'Get Started',

                                style: TextStyle(
                                  fontSize: 20,
                                  height: 1.4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(width: 8),

                              Icon(
                                Icons.arrow_forward,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // =================================================
                      // LOGIN
                      // =================================================

                      const SizedBox(height: 16),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },

                        child: RichText(
                          textAlign: TextAlign.center,

                          text: const TextSpan(
                            children: [

                              TextSpan(
                                text:
                                    'Already have an account? ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5A4136),
                                ),
                              ),

                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF5A4136),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}