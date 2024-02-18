import 'package:flutter_test/flutter_test.dart';
import 'package:frame_vault/screens/add_product.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('must fill in at least title', (WidgetTester tester) async {
    // Build your widget tree.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AddProduct(), // Instantiate your AddProduct widget
      ),
    ));
    Finder textFieldFinder = find.byKey(ValueKey('nameKey'));
    // Simulate input on the TextField.
    await tester.enterText(textFieldFinder, 'Test Value');

    // Assert the value of the TextField.
    expect(find.text('Test Value'), findsOneWidget);
  });
}
