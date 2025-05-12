import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';
import 'package:pretium_app/presentation/home_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final List<String> _pin = [];

  void _onKeyTap(String value) {
    if (_pin.length < 4) {
      setState(() {
        _pin.add(value);
      });
      if (_pin.length == 4) {
        // Automatically navigate to HomeScreen after a short delay
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        });
      }
    }
  }

  void _onBackspace() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin.removeLast();
      });
    }
  }

  Widget _buildPinCircles(BuildContext context, double width) {
    final circleSize = width * 0.05; // 5% of screen width
    final circleSpacing = width * 0.03; // 3% of screen width

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        bool filled = index < _pin.length;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: circleSpacing),
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 2),
            color: filled ? AppColors.white : Colors.transparent,
          ),
        );
      }),
    );
  }

  Widget _buildKey(
    BuildContext context,
    String value, {
    VoidCallback? onTap,
    IconData? icon,
  }) {
    final width = MediaQuery.of(context).size.width;
    final keyWidth = width * 0.2; // 20% of screen width
    final keyHeight = width * 0.15; // 15% of screen width
    final keyFontSize = width * 0.08; // 8% of screen width
    final iconSize = width * 0.08; // 8% of screen width

    return GestureDetector(
      onTap: onTap ?? () => _onKeyTap(value),
      child: Container(
        alignment: Alignment.center,
        width: keyWidth,
        height: keyHeight,
        child:
            icon == null
                ? Text(
                  value,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: keyFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                )
                : Icon(icon, color: AppColors.white, size: iconSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            // Calculate relative sizes
            final topSpacing = height * 0.1; // 10% of screen height
            final iconSize = width * 0.15; // 15% of screen width
            final titleFontSize = width * 0.065; // 6.5% of screen width
            final subtitleFontSize = width * 0.045; // 4.5% of screen width
            final spacing = height * 0.03; // 3% of screen height
            final bottomSpacing = height * 0.05; // 5% of screen height

            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: topSpacing),
                    Icon(Icons.lock, color: AppColors.white, size: iconSize),
                    SizedBox(height: spacing),
                    Text(
                      'Create a 4-digit PIN',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: spacing),
                    _buildPinCircles(context, width),
                    SizedBox(height: spacing * 0.8),
                    Text(
                      'Your PIN will be required to access the app',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(bottom: bottomSpacing),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildKey(context, '1'),
                              _buildKey(context, '2'),
                              _buildKey(context, '3'),
                            ],
                          ),
                          SizedBox(height: spacing * 0.4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildKey(context, '4'),
                              _buildKey(context, '5'),
                              _buildKey(context, '6'),
                            ],
                          ),
                          SizedBox(height: spacing * 0.4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildKey(context, '7'),
                              _buildKey(context, '8'),
                              _buildKey(context, '9'),
                            ],
                          ),
                          SizedBox(height: spacing * 0.4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: width * 0.2),
                              _buildKey(context, '0'),
                              _buildKey(
                                context,
                                '',
                                onTap: _onBackspace,
                                icon: Icons.backspace_outlined,
                              ),
                            ],
                          ),
                        ],
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
