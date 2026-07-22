import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/main.dart';

void main() {
  testWidgets('Home screen displays health check title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our title is present.
    expect(find.text('Backend Health Check'), findsOneWidget);
    
    // Check if loading or error states might be showing (since we mock nothing)
    // At minimum we expect the refresh button to be present.
    expect(find.text('Refresh'), findsOneWidget);
  });
}
