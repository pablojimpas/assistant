import 'package:assistant/src/settings/settings_controller.dart';
import 'package:assistant/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_settings_service.dart';

void main() {
  group('SettingsView', () {
    testWidgets('should inform the controller of the value',
        (WidgetTester tester) async {
      final service = FakeSettingsService();
      final controller = SettingsController(service);
      await controller.loadSettings();

      // gets the flutter test environment into a fake flutter runtime
      // and fully hydrate this widget. Code that's breathing live into this widget.
      await tester
          .pumpWidget(MaterialApp(home: SettingsView(controller: controller)));

      await tester.tap(find.byType(DropdownButton<ThemeMode>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Theme').last);
      await tester.pumpAndSettle();
      expect(controller.themeMode, ThemeMode.dark);

      await tester.tap(find.byType(DropdownButton<ThemeMode>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Light Theme').last);
      await tester.pumpAndSettle();
      expect(controller.themeMode, ThemeMode.light);

      await tester.tap(find.byType(DropdownButton<ThemeMode>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('System Theme').last);
      await tester.pumpAndSettle();
      expect(controller.themeMode, ThemeMode.system);
    });
  });
}
