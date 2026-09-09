import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_namer_modernized/main.dart';

void main() {
  testWidgets('uses Material 3 navigation on a narrow screen', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsNothing);

    await tester.tap(find.text('Favorites'));
    await tester.pumpAndSettle();

    expect(find.text('No favorites yet.'), findsOneWidget);
  });
}
