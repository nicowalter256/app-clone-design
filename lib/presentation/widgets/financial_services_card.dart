import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';

class FinancialServicesCard extends StatelessWidget {
  const FinancialServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Financial Services',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: const [
                  Text(
                    'Uganda',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 22,
                    backgroundImage: const AssetImage('assets/airtel.png'),
                  ),
                  const SizedBox(height: 4),
                  const Text('Airtel', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.phone_android,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Airtime', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
