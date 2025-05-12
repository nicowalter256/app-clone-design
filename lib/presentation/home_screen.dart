import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';
import 'package:pretium_app/presentation/transactions_screen.dart';
import 'package:pretium_app/presentation/notifications_screen.dart';
import 'package:pretium_app/presentation/widgets/wallet_card.dart';
import 'package:pretium_app/presentation/widgets/financial_services_card.dart';
import 'package:pretium_app/presentation/widgets/recent_transactions.dart';
import 'package:pretium_app/presentation/widgets/section_header.dart';
import 'package:pretium_app/presentation/widgets/bottom_sheet_actions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const _ProfileDrawer(),
      appBar: const _HomeAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          // Calculate relative sizes
          final horizontalPadding = width * 0.03; // 3% of screen width
          final verticalPadding = height * 0.02; // 2% of screen height

          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            children: [
              const WalletCard(),
              const SizedBox(height: 18),
              const FinancialServicesCard(),
              const SizedBox(height: 18),
              SectionHeader(
                title: 'Recent transactions',
                actionText: 'See all',
                onActionTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TransactionsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              const RecentTransactions(),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          // Calculate relative sizes
          final navHeight = height * 0.09; // 9% of screen height
          final iconSize = width * 0.08; // 8% of screen width
          final spacing = width * 0.12; // 12% of screen width

          return BottomAppBar(
            color: AppColors.white,
            elevation: 0,
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              height: navHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: AppColors.primary,
                      size: iconSize,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: spacing), // Space for FAB
                  IconButton(
                    icon: Icon(
                      Icons.receipt_long,
                      color: AppColors.grey,
                      size: iconSize,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TransactionsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final iconSize = width * 0.08; // 8% of screen width

          return FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder:
                    (context) => SafeArea(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final spacing = width * 0.04;
                          final actionTitleFontSize = width * 0.045;
                          final actionSubtitleFontSize = width * 0.035;
                          final iconCircleSize = width * 0.11;
                          final iconSize = width * 0.06;

                          Widget quickAction({
                            required IconData icon,
                            required Color iconColor,
                            required String title,
                            required String subtitle,
                          }) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: spacing * 0.4,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: iconCircleSize,
                                    height: iconCircleSize,
                                    decoration: BoxDecoration(
                                      color: AppColors.accent.withOpacity(0.18),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        icon,
                                        color: iconColor,
                                        size: iconSize,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: spacing * 0.8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: actionTitleFontSize,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(height: spacing * 0.1),
                                        Text(
                                          subtitle,
                                          style: TextStyle(
                                            fontSize: actionSubtitleFontSize,
                                            color: AppColors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Container(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: spacing,
                              vertical: spacing,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: width * 0.1,
                                  height: 4,
                                  margin: EdgeInsets.only(bottom: spacing),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                quickAction(
                                  icon: Icons.arrow_downward,
                                  iconColor: AppColors.primary,
                                  title: 'Deposit',
                                  subtitle:
                                      'Send crypto to your Pretium wallet',
                                ),
                                quickAction(
                                  icon: Icons.add,
                                  iconColor: AppColors.primary,
                                  title: 'Fund account',
                                  subtitle: 'Buy crypto with mobile money',
                                ),
                                quickAction(
                                  icon: Icons.north_east,
                                  iconColor: AppColors.primary,
                                  title: 'Withdraw',
                                  subtitle:
                                      'Transfer crypto from your Pretium wallet',
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
              );
            },
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.qr_code_scanner,
              color: AppColors.white,
              size: iconSize,
            ),
            elevation: 0,
            shape: const CircleBorder(),
            mini: false,
            tooltip: 'Scan QR',
          );
        },
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Calculate relative sizes
        final avatarSize = width * 0.12; // 12% of screen width
        final titleFontSize = width * 0.055; // 5.5% of screen width
        final iconSize = width * 0.07; // 7% of screen width

        return AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          leading: Builder(
            builder:
                (context) => Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: Text(
                        'N',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                  ),
                ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, Nico ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                  color: AppColors.white,
                ),
              ),
              Text('👋', style: TextStyle(fontSize: titleFontSize)),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: AppColors.white,
                size: iconSize,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _ProfileDrawer extends StatelessWidget {
  const _ProfileDrawer();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        // Calculate relative sizes
        final avatarSize = width * 0.16; // 16% of screen width
        final titleFontSize = width * 0.055; // 5.5% of screen width
        final subtitleFontSize = width * 0.04; // 4% of screen width
        final iconSize = width * 0.07; // 7% of screen width
        final spacing = height * 0.02; // 2% of screen height
        final buttonFontSize = width * 0.04; // 4% of screen width

        return Drawer(
          width: width,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                    top: width * 0.02,
                    bottom: width * 0.02,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                      size: iconSize,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.025),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: avatarSize / 2,
                        backgroundColor: AppColors.accent,
                        child: Text(
                          'NW',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Coming Soon',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: titleFontSize,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Icon(
                                Icons.edit,
                                size: iconSize * 0.6,
                                color: AppColors.black54,
                              ),
                            ],
                          ),
                          SizedBox(height: spacing * 0.2),
                          Text(
                            'gidudunicholas11@gmail.com',
                            style: TextStyle(
                              color: AppColors.black54,
                              fontSize: subtitleFontSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                _DrawerTile(
                  icon: Icons.grid_on,
                  title: 'Currency',
                  trailing: Text(
                    'UGX',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ),
                _DrawerTile(
                  icon: Icons.account_balance_wallet_rounded,
                  title: 'Assets',
                ),
                _DrawerTile(icon: Icons.swap_horiz, title: 'Wallet Address'),
                _DrawerTile(
                  icon: Icons.send,
                  title: 'Contact Support',
                  trailing: Icon(
                    Icons.open_in_new,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ),
                _DrawerTile(
                  icon: Icons.description,
                  title: 'Terms and Conditions',
                  trailing: Icon(
                    Icons.open_in_new,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ),
                _DrawerTile(
                  icon: Icons.privacy_tip,
                  title: 'Privacy Policy',
                  trailing: Icon(
                    Icons.open_in_new,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ),
                _DrawerTile(
                  icon: Icons.phone_android,
                  title: 'App Version',
                  trailing: Text(
                    '1.0.0+16',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _DrawerTile(icon: Icons.logout, title: 'Sign out'),
                _DrawerTile(icon: Icons.delete, title: 'Delete Account'),
                const Spacer(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: spacing * 1.5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.06,
                          vertical: height * 0.01,
                        ),
                        child: Text(
                          'Rate App 👍',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: buttonFontSize,
                          ),
                        ),
                      ),
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

class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  const _DrawerTile({required this.icon, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final iconSize = width * 0.06; // 6% of screen width
        final titleFontSize = width * 0.04; // 4% of screen width

        return ListTile(
          leading: Icon(icon, color: AppColors.primary, size: iconSize),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: titleFontSize,
            ),
          ),
          trailing: trailing,
          onTap: () {},
        );
      },
    );
  }
}
