import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              CircleAvatar(radius: 16, backgroundColor: AppColors.grey300),
              const SizedBox(width: 12),
              Container(width: 80, height: 12, color: AppColors.grey300),
              const SizedBox(width: 12),
              Container(width: 40, height: 12, color: AppColors.grey200),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 16),
              CircleAvatar(radius: 16, backgroundColor: AppColors.grey300),
              const SizedBox(width: 12),
              Container(width: 80, height: 12, color: AppColors.grey300),
              const SizedBox(width: 12),
              Container(width: 40, height: 12, color: AppColors.grey200),
            ],
          ),
        ],
      ),
    );
  }
}
