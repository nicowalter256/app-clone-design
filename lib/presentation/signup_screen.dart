import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';
import 'package:pretium_app/presentation/verify_account_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            // Calculate relative sizes
            final horizontalPadding = width * 0.06; // 6% of screen width
            final verticalPadding = height * 0.04; // 4% of screen height
            final titleFontSize = width * 0.08; // 8% of screen width
            final subtitleFontSize = width * 0.045; // 4.5% of screen width
            final buttonHeight = height * 0.07; // 7% of screen height
            final buttonFontSize = width * 0.05; // 5% of screen width
            final spacing = height * 0.02; // 2% of screen height
            final inputFontSize = width * 0.045; // 4.5% of screen width
            final iconSize = width * 0.06; // 6% of screen width

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back arrow
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.primary,
                        size: iconSize,
                      ),
                    ),
                    SizedBox(height: spacing),
                    // Title
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: spacing * 0.5),
                    // Subtitle
                    Text(
                      'Sign up to get started',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: AppColors.black54,
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Full Name Field
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.02,
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: AppColors.primary,
                            size: iconSize,
                          ),
                          hintText: 'Full Name',
                        ),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: inputFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing),
                    // Email Field
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.02,
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.primary,
                            size: iconSize,
                          ),
                          hintText: 'Email',
                        ),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: inputFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing),
                    // Password Field
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                      ),
                      child: TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.02,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.primary,
                            size: iconSize,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.black54,
                              size: iconSize,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          hintText: 'Password',
                        ),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: inputFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing),
                    // Terms and Conditions
                    Row(
                      children: [
                        Checkbox(
                          value: _acceptTerms,
                          onChanged: (value) {
                            setState(() {
                              _acceptTerms = value ?? false;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        Flexible(
                          child: Text(
                            'I agree to the Terms and Conditions and Privacy Policy',
                            style: TextStyle(
                              color: AppColors.black54,
                              fontSize: width * 0.04,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Create Account Button
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed:
                            _acceptTerms
                                ? () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const VerifyAccountScreen(),
                                    ),
                                  );
                                }
                                : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          disabledBackgroundColor: AppColors.grey200,
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Already have an account? Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: AppColors.black54,
                            fontSize: width * 0.04,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
