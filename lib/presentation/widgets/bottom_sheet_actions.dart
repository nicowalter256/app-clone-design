import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';

class BottomSheetActions extends StatelessWidget {
  const BottomSheetActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SheetAction(
            icon: Icons.arrow_downward,
            title: 'Deposit',
            description: 'Send crypto to your Pretium wallet',
          ),
          const SheetAction(
            icon: Icons.add,
            title: 'Fund account',
            description: 'Buy crypto with mobile money',
          ),
          const SheetAction(
            icon: Icons.arrow_upward,
            title: 'Withdraw',
            description: 'Transfer crypto from your Pretium wallet',
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class SheetAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const SheetAction({
    required this.icon,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.accent,
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
      onTap: () {},
    );
  }
}
