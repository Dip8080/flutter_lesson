import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lesson/main.dart';

void main() {
  testWidgets('HomeScreen loads properly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}
