import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';
import 'package:pretium_app/presentation/home_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  void _onNavTap(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return Text(
              'Transactions',
              style: TextStyle(
                color: AppColors.black,
                fontSize: width * 0.06, // 6% of screen width
                fontWeight: FontWeight.w400,
              ),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          // Calculate relative sizes
          final iconSize = width * 0.18; // 18% of screen width
          final textFontSize = width * 0.05; // 5% of screen width
          final spacing = height * 0.02; // 2% of screen height

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long,
                  size: iconSize,
                  color: AppColors.grey300,
                ),
                SizedBox(height: spacing),
                Text(
                  'No transactions yet',
                  style: TextStyle(
                    color: AppColors.black54,
                    fontSize: textFontSize,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
