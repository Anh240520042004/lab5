import 'package:exam/main.dart';
import 'package:exam/ViewModel/CartService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('opens selected product detail page', (WidgetTester tester) async {
    CartService.instance.clear();

    await tester.pumpWidget(const MyApp());

    expect(find.text('Product Name: Iphone 14'), findsOneWidget);

    await tester.tap(find.text('Product Name: Iphone 14'));
    await tester.pumpAndSettle();

    expect(find.text('Product Detail'), findsOneWidget);
    expect(find.text('Iphone 14'), findsOneWidget);
    expect(find.text('Product ID: P01'), findsOneWidget);
  });

  testWidgets('adds product to cart and shows total', (WidgetTester tester) async {
    CartService.instance.clear();

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Add to cart').first);
    await tester.pump();

    await tester.tap(find.text('Cart'));
    await tester.pumpAndSettle();

    expect(find.text('Iphone 14'), findsOneWidget);
    expect(find.text('Items: 1'), findsOneWidget);
    expect(find.text('Total: 20000\$'), findsOneWidget);
  });
}
