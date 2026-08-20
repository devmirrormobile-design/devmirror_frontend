import 'package:devmirrorui/login/LoginPage.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // ------------------------------------------------------------
  // COLORS
  // ------------------------------------------------------------

  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color primaryColor = Color(0xFFFF6B00);
  static const Color textColor = Color(0xFF131B2E);
  static const Color secondaryText = Color(0xFF5A4136);
  static const Color borderColor = Color(0xFFE2E8F0);

  // ------------------------------------------------------------
  // CONTROLLERS
  // ------------------------------------------------------------

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final institutionController = TextEditingController();
  final courseController = TextEditingController();

  // ------------------------------------------------------------
  // VALUES
  // ------------------------------------------------------------

  String? graduationYear;
  String? targetRole;

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // ------------------------------------------------------------
  // DISPOSE
  // ------------------------------------------------------------

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    institutionController.dispose();
    courseController.dispose();

    super.dispose();
  }

  // ------------------------------------------------------------
  // BUILD
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Stack(
          children: [
            // Background decoration
            _backgroundDecoration(),

            // Main content
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),

                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 560,
                  ),

                  child: _buildContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // BACKGROUND
  // ------------------------------------------------------------

  Widget _backgroundDecoration() {
    return Stack(
      children: [
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.05),
            ),
          ),
        ),

        Positioned(
          bottom: -150,
          left: -120,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF645EFB).withOpacity(0.05),
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // MAIN CONTENT
  // ------------------------------------------------------------

  Widget _buildContent() {
    return Column(
      children: [
        _buildHeader(),

        const SizedBox(height: 32),

        _buildSignupCard(),

        const SizedBox(height: 24),

        _buildLoginText(),
      ],
    );
  }

  // ------------------------------------------------------------
  // HEADER
  // ------------------------------------------------------------

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(4),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),

            child: Image.network(
              'https://lh3.googleusercontent.com/aida/AP1WRLu3ri5J3uEzxL1Z_h6nofvLNS4zuBLekAk2ijhC6JZylXDu6wMbbb6Aq96JwkabF2pOY2ElAWJoEliK0LJ8wbJLz0ZabTUyZfZprmo7f8kngZdsQCM0IUMBBwnH_b8QU0S4iW0MwQb1phpWrUO6urjk5xj80Ukrqb8NQWdVyo066RtMwcZ8wx5u_z6Tm0pf8S_k64pIFyX055q49TkLxhCZFdZRJ7jXtMQuYfFmFzNsojy9Q7xCiG9Vxaw',

              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.code,
                  color: primaryColor,
                  size: 32,
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Title
        const Text(
          'Create Your Account',
          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        const Text(
          'Start your personalized placement preparation journey.',
          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: secondaryText,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // SIGNUP CARD
  // ------------------------------------------------------------

  Widget _buildSignupCard() {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: borderColor,
        ),

        boxShadow: const [
          BoxShadow(
            color: Color(0x050F172A),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          // Orange top line
          Container(
            height: 4,

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  Color(0xFFFF9E00),
                ],
              ),

              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
          ),

          // Card content
          Padding(
            padding: const EdgeInsets.all(20),

            child: _buildForm(),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // FORM
  // ------------------------------------------------------------

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Full name
        _buildLabel('Full Name'),

        _buildTextField(
          controller: fullNameController,
          hint: 'Jane Doe',
          icon: Icons.person_outline,
        ),

        const SizedBox(height: 20),

        // Email
        _buildLabel('Email Address'),

        _buildTextField(
          controller: emailController,
          hint: 'jane@university.edu',
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 20),

        // Password fields
        _buildPasswordSection(),

        const SizedBox(height: 20),

        const Divider(
          color: borderColor,
        ),

        const SizedBox(height: 20),

        // Institution
        _buildLabel('College / Institution'),

        _buildTextField(
          controller: institutionController,
          hint: 'Enter your college name',
          icon: Icons.school_outlined,
        ),

        const SizedBox(height: 20),

        // Course + Year
        _buildCourseAndYear(),

        const SizedBox(height: 20),

        // Target role
        _buildLabel('Target Job Role'),

        _buildRoleDropdown(),

        const SizedBox(height: 24),

        // Terms
        _buildTerms(),

        const SizedBox(height: 20),

        // Button
        _buildCreateButton(),
      ],
    );
  }

  // ------------------------------------------------------------
  // PASSWORD SECTION
  // ------------------------------------------------------------

  Widget _buildPasswordSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Small phone
        if (constraints.maxWidth < 430) {
          return Column(
            children: [
              _buildPasswordField(
                label: 'Password',
                controller: passwordController,
                obscure: hidePassword,

                onVisibilityTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),

              const SizedBox(height: 20),

              _buildPasswordField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                obscure: hideConfirmPassword,

                onVisibilityTap: () {
                  setState(() {
                    hideConfirmPassword =
                        !hideConfirmPassword;
                  });
                },
              ),
            ],
          );
        }

        // Tablet / desktop
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: _buildPasswordField(
                label: 'Password',
                controller: passwordController,
                obscure: hidePassword,

                onVisibilityTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: _buildPasswordField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                obscure: hideConfirmPassword,

                onVisibilityTap: () {
                  setState(() {
                    hideConfirmPassword =
                        !hideConfirmPassword;
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // ------------------------------------------------------------
  // COURSE + YEAR
  // ------------------------------------------------------------

  Widget _buildCourseAndYear() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 430) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Course'),

              _buildTextField(
                controller: courseController,
                hint: 'B.Tech Computer Science',
              ),

              const SizedBox(height: 20),

              _buildLabel('Graduation Year'),

              _buildGraduationDropdown(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  _buildLabel('Course'),

                  _buildTextField(
                    controller: courseController,
                    hint: 'B.Tech Computer Science',
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  _buildLabel('Graduation Year'),

                  _buildGraduationDropdown(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // ------------------------------------------------------------
  // LABEL
  // ------------------------------------------------------------

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),

      child: Text(
        text,

        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // TEXT FIELD
  // ------------------------------------------------------------

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      style: const TextStyle(
        fontSize: 14,
        color: textColor,
      ),

      decoration: _inputDecoration(
        hint: hint,
        icon: icon,
      ),
    );
  }

  // ------------------------------------------------------------
  // PASSWORD FIELD
  // ------------------------------------------------------------

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onVisibilityTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        _buildLabel(label),

        TextField(
          controller: controller,
          obscureText: obscure,

          style: const TextStyle(
            fontSize: 14,
            color: textColor,
          ),

          decoration: _inputDecoration(
            hint: '••••••••',
            icon: Icons.lock_outline,

            suffix: IconButton(
              onPressed: onVisibilityTap,

              icon: Icon(
                obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,

                size: 20,
                color: secondaryText,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // INPUT DECORATION
  // ------------------------------------------------------------

  InputDecoration _inputDecoration({
    required String hint,
    IconData? icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,

      hintStyle: const TextStyle(
        fontSize: 14,
        color: secondaryText,
      ),

      prefixIcon: icon == null
          ? null
          : Icon(
              icon,
              size: 21,
              color: secondaryText.withOpacity(0.7),
            ),

      suffixIcon: suffix,

      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),

        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),

        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),

        borderSide: const BorderSide(
          color: primaryColor,
          width: 1.5,
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // GRADUATION DROPDOWN
  // ------------------------------------------------------------

  Widget _buildGraduationDropdown() {
    return DropdownButtonFormField<String>(
      value: graduationYear,

      isExpanded: true,

      decoration: _dropdownDecoration(
        hint: 'Select Year',
      ),

      items: const [
        DropdownMenuItem(
          value: '2024',
          child: Text('2024'),
        ),
        DropdownMenuItem(
          value: '2025',
          child: Text('2025'),
        ),
        DropdownMenuItem(
          value: '2026',
          child: Text('2026'),
        ),
        DropdownMenuItem(
          value: '2027',
          child: Text('2027'),
        ),
      ],

      onChanged: (value) {
        setState(() {
          graduationYear = value;
        });
      },
    );
  }

  // ------------------------------------------------------------
  // ROLE DROPDOWN
  // ------------------------------------------------------------

  Widget _buildRoleDropdown() {
    return DropdownButtonFormField<String>(
      value: targetRole,

      isExpanded: true,

      decoration: _dropdownDecoration(
        hint: 'What role are you preparing for?',
        icon: Icons.work_outline,
      ),

      items: const [
        DropdownMenuItem(
          value: 'sde',
          child: Text(
            'Software Development Engineer (SDE)',
            overflow: TextOverflow.ellipsis,
          ),
        ),

        DropdownMenuItem(
          value: 'frontend',
          child: Text('Frontend Developer'),
        ),

        DropdownMenuItem(
          value: 'backend',
          child: Text('Backend Developer'),
        ),

        DropdownMenuItem(
          value: 'data',
          child: Text('Data Scientist / Analyst'),
        ),

        DropdownMenuItem(
          value: 'product',
          child: Text('Product Manager'),
        ),
      ],

      onChanged: (value) {
        setState(() {
          targetRole = value;
        });
      },
    );
  }

  // ------------------------------------------------------------
  // DROPDOWN DECORATION
  // ------------------------------------------------------------

  InputDecoration _dropdownDecoration({
    required String hint,
    IconData? icon,
  }) {
    return InputDecoration(
      hintText: hint,

      hintStyle: const TextStyle(
        fontSize: 14,
        color: secondaryText,
      ),

      prefixIcon: icon == null
          ? null
          : const Icon(
              Icons.work_outline,
              size: 21,
              color: secondaryText,
            ),

      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),

        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),

        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),

        borderSide: const BorderSide(
          color: primaryColor,
          width: 1.5,
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // TERMS
  // ------------------------------------------------------------

  Widget _buildTerms() {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text:
                'By creating an account, you agree to our ',
          ),

          const TextSpan(
            text: 'Terms of Service',
            style: TextStyle(
              color: primaryColor,
            ),
          ),

          const TextSpan(
            text: ' and ',
          ),

          const TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: primaryColor,
            ),
          ),

          const TextSpan(
            text: '.',
          ),
        ],
      ),

      textAlign: TextAlign.center,

      style: const TextStyle(
        fontSize: 14,
        height: 1.5,
        color: secondaryText,
      ),
    );
  }

  // ------------------------------------------------------------
  // CREATE BUTTON
  // ------------------------------------------------------------

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,

      child: ElevatedButton(
        onPressed: _createAccount,

        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,

          elevation: 2,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'Create Account',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(width: 8),

            Icon(
              Icons.arrow_forward,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // LOGIN
  // ------------------------------------------------------------

  Widget _buildLoginText() {
    return Wrap(
      alignment: WrapAlignment.center,

      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(
            fontSize: 14,
            color: secondaryText,
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },

          child: const Text(
            'Login',

            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // CREATE ACCOUNT
  // ------------------------------------------------------------

  void _createAccount() {
    if (fullNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        institutionController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty ||
        graduationYear == null ||
        targetRole == null) {
      _showMessage(
        'Please fill all the required fields',
      );
      return;
    }

    if (passwordController.text !=
        confirmPasswordController.text) {
      _showMessage(
        'Passwords do not match',
      );
      return;
    }

    _showMessage(
      'Account created successfully!',
    );
  }

  // ------------------------------------------------------------
  // MESSAGE
  // ------------------------------------------------------------

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }
}