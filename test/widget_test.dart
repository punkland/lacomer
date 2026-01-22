import 'package:flutter_test/flutter_test.dart';
import 'package:lacomer/main.dart';

void main() {
  testWidgets('App builds', (tester) async {
    await tester.pumpWidget(const LaComerApp());
    await tester.pumpAndSettle();
    expect(find.text('Iniciar Sesion'), findsWidgets);
  });
}
