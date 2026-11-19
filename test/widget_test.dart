import 'package:calculator/main.dart' as app;
import 'package:calculator/widgets/header_display.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('The labeled Delete key removes the last digit', (tester) async {
    tester.view.physicalSize = const Size(390, 780);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('1').last);
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();

    final display = find.byType(HeaderDisplay);
    expect(find.descendant(of: display, matching: find.text('12')),
        findsOneWidget);
    await tester.tap(find.text('Delete'));
    await tester.pump();
    expect(
        find.descendant(of: display, matching: find.text('1')), findsOneWidget);
  });
}
