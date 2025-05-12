import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';

class PretiumBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback onWalletTap;
  final VoidCallback onTransactionsTap;
  final double? fabSize;

  const PretiumBottomAppBar({
    Key? key,
    required this.selectedIndex,
    required this.onWalletTap,
    required this.onTransactionsTap,
    this.fabSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final iconSize = width * 0.08;
        final gap = fabSize ?? width * 0.15;

        return BottomAppBar(
          color: AppColors.white,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: height * 0.09,
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.account_balance_wallet_rounded,
                        color:
                            selectedIndex == 0
                                ? AppColors.primary
                                : AppColors.grey,
                        size: iconSize,
                      ),
                      onPressed: onWalletTap,
                    ),
                  ),
                ),
                SizedBox(width: gap),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.receipt_long,
                        color:
                            selectedIndex == 1
                                ? AppColors.primary
                                : AppColors.grey,
                        size: iconSize,
                      ),
                      onPressed: onTransactionsTap,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
