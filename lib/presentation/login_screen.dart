import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';
import 'package:pretium_app/presentation/pin_verification_screen.dart';
import 'package:pretium_app/presentation/signup_screen.dart';
import 'package:pretium_app/presentation/home_screen.dart';
import 'package:pretium_app/presentation/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

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
            final iconSize = width * 0.1; // 10% of screen width
            final containerSize = width * 0.18; // 18% of screen width
            final titleFontSize = width * 0.08; // 8% of screen width
            final subtitleFontSize = width * 0.045; // 4.5% of screen width
            final buttonHeight = height * 0.07; // 7% of screen height
            final buttonFontSize = width * 0.05; // 5% of screen width
            final spacing = height * 0.02; // 2% of screen height

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: spacing),
                    // Wallet Icon in rounded square
                    Container(
                      width: containerSize,
                      height: containerSize,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F1EF),
                        borderRadius: BorderRadius.circular(
                          containerSize * 0.28,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: AppColors.primary,
                          size: iconSize,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Welcome Text
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: spacing * 0.5),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: AppColors.black54,
                      ),
                      textAlign: TextAlign.center,
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
                            size: width * 0.06,
                          ),
                          hintText: 'Email',
                        ),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: width * 0.045,
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
                            size: width * 0.06,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.black54,
                              size: width * 0.06,
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
                          fontSize: width * 0.045,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing),
                    // Remember me and Forgot Password
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: AppColors.black54,
                            fontSize: width * 0.04,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder:
                                  (context) => const PinVerificationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Sign Up prompt
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: AppColors.black54,
                            fontSize: width * 0.04,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
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
