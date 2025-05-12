import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: spacing * 0.5),
                    // Subtitle
                    Text(
                      'Enter your email to reset your password',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: AppColors.black54,
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Email Field
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                      ),
                      child: TextField(
                        controller: _emailController,
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
                    SizedBox(height: spacing * 1.5),
                    // Send Reset Code button
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Send Reset Code',
                          style: TextStyle(
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
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
