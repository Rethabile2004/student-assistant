import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_assistant/app_theme.dart';

void main() {
  testWidgets('App theme renders Material widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.theme,
        home: const Scaffold(
          body: Center(
            child: Text('Student Assistant'),
          ),
        ),
      ),
    );

    expect(find.text('Student Assistant'), findsOneWidget);
  });
}
