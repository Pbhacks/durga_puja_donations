import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:durga_puja_donations/starter_screen.dart';
// Import your main app which includes HomePage

void main() {
  testWidgets('StarterScreen navigates to HomePage on swipe up from third page',
      (WidgetTester tester) async {
    // Build the StarterScreen widget
    await tester.pumpWidget(MaterialApp(home: StarterScreen()));

    // Swipe left to go to the second page
    await tester.drag(find.byType(PageView), const Offset(-400.0, 0.0));
    await tester.pumpAndSettle(); // Wait for the animation to complete

    // Swipe left to go to the third page
    await tester.drag(find.byType(PageView), const Offset(-400.0, 0.0));
    await tester.pumpAndSettle(); // Wait for the animation to complete

    // Swipe up to navigate to HomePage
    await tester.drag(find.byType(PageView), const Offset(0.0, -400.0));
    await tester.pumpAndSettle(); // Wait for the navigation to complete

    // Verify that HomePage is displayed
    expect(find.text('Durga Puja Donations'),
        findsOneWidget); // Adjust the text to something unique from your HomePage
  });
}
