import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pretium_app/presentation/widgets/wallet_card.dart';

void main() {
  testWidgets('WalletCard toggles balance visibility', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: WalletCard())),
    );

    // Initially, balance is hidden
    expect(find.text('****'), findsNWidgets(2)); // UGX and USD

    // Tap the eye icon to show balance
    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();

    // Now, balance is visible
    expect(find.text('0.00'), findsOneWidget);
    expect(find.text('24 0.00'), findsOneWidget);

    // Tap again to hide
    await tester.tap(find.byIcon(Icons.remove_red_eye_outlined));
    await tester.pump();

    // Balance is hidden again
    expect(find.text('****'), findsNWidgets(2));
  });
}
