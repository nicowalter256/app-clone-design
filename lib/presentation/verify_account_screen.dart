import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';
import 'package:pretium_app/presentation/login_screen.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  String? _selectedCountry;
  final TextEditingController _codeController = TextEditingController();
  final List<String> _countries = [
    'Kenya',
    'Uganda',
    'Nigeria',
    'Ghana',
    'Malawi',
    'Zambia',
    'Rwanda',
    'Global Users [全球用户]',
  ];
  bool _isLoading = false;

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              // Calculate relative sizes
              final handleWidth = width * 0.1; // 10% of screen width
              final handleHeight = height * 0.005; // 0.5% of screen height
              final titleFontSize = width * 0.055; // 5.5% of screen width
              final spacing = height * 0.02; // 2% of screen height

              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    top: 0,
                    left: 0,
                    right: 0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: spacing),
                        Container(
                          width: handleWidth,
                          height: handleHeight,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(height: spacing),
                        Text(
                          'Select Country',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: spacing),
                        ..._countries.map(
                          (country) => ListTile(
                            title: Text(
                              country,
                              style: TextStyle(
                                color:
                                    _selectedCountry == country
                                        ? AppColors.primary
                                        : AppColors.black,
                                fontWeight:
                                    _selectedCountry == country
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                            trailing:
                                _selectedCountry == country
                                    ? const Icon(
                                      Icons.check,
                                      color: AppColors.primary,
                                    )
                                    : null,
                            onTap: () => Navigator.of(context).pop(country),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
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
                      'Verify Account',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: spacing * 0.5),
                    // Subtitle
                    Text(
                      'Enter the verification code sent to your email',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: AppColors.black54,
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Country dropdown
                    GestureDetector(
                      onTap: _showCountryPicker,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedCountry ?? 'Select Country',
                              style: TextStyle(
                                color:
                                    _selectedCountry != null
                                        ? AppColors.primary
                                        : AppColors.black54,
                                fontSize: inputFontSize,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.black54,
                              size: iconSize,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: spacing),
                    // Code input
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                      ),
                      child: TextField(
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
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
                          hintText: 'Enter 6-digit code',
                          counterText: '',
                        ),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: inputFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Verify Account Button
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed:
                            _isLoading
                                ? null
                                : () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await Future.delayed(
                                    const Duration(seconds: 1),
                                  );
                                  if (mounted) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const LoginScreen(),
                                      ),
                                    );
                                  }
                                },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child:
                            _isLoading
                                ? SizedBox(
                                  width: width * 0.06,
                                  height: width * 0.06,
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          AppColors.white,
                                        ),
                                    strokeWidth: 3,
                                  ),
                                )
                                : Text(
                                  'Verify Account',
                                  style: TextStyle(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                ),
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    // Resend code
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive the code? ",
                          style: TextStyle(
                            color: AppColors.black54,
                            fontSize: width * 0.04,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Resend Code',
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
