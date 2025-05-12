import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({super.key});

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  bool _obscureBalance = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double padding = width * 0.05;
        double iconSize = width * 0.07;
        double labelFontSize = width * 0.04;
        double amountFontSize = width * 0.09;
        double currencyFontSize = width * 0.045;
        double usdFontSize = width * 0.04;
        double spacing = width * 0.04;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(iconSize * 0.21),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: AppColors.white,
                          size: iconSize,
                        ),
                      ),
                      SizedBox(height: spacing * 0.5),
                      Text(
                        'Wallet Balance',
                        style: TextStyle(
                          color: AppColors.white70,
                          fontSize: labelFontSize,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureBalance = !_obscureBalance;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(iconSize * 0.21),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _obscureBalance
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_outlined,
                        color: AppColors.white,
                        size: iconSize * 0.85,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'UGX',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: currencyFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: spacing * 0.5),
                  Text(
                    _obscureBalance ? '****' : '0.00',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: amountFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing * 0.5),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: padding * 0.6,
                  vertical: padding * 0.2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: AppColors.white70,
                      size: usdFontSize * 1.1,
                    ),
                    SizedBox(width: 4),
                    Text(
                      _obscureBalance ? '****' : '24 0.00',
                      style: TextStyle(
                        color: AppColors.white70,
                        fontSize: usdFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
