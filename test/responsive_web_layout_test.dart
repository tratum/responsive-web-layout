import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

void main() {
  group('ResponsiveWebLayout Tests', () {
    testWidgets('Desktop Layout Test', (WidgetTester tester) async {
      bool isQuadHDLayoutExpected = false;
      bool isFullHDLayoutExpected = false;
      bool isHDLayoutExpected = false;
      bool isSDLayoutExpected = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                isQuadHDLayoutExpected =
                    ResponsiveWebLayout.isQuadHDLayout(context: context);
                isFullHDLayoutExpected =
                    ResponsiveWebLayout.isFullHDLayout(context: context);
                isHDLayoutExpected =
                    ResponsiveWebLayout.isHdLayout(context: context);
                isSDLayoutExpected =
                    ResponsiveWebLayout.isSdLayout(context: context);
                return ResponsiveWebLayout.buildDesktopLayout(
                  context: context,
                  quadHDLayout: _buildContainer('Quad HD Layout', Colors.red),
                  fullHDLayout: _buildContainer('Full HD Layout', Colors.green),
                  hdLayout: _buildContainer('HD Layout', Colors.blue),
                  sdLayout: _buildContainer('SD Layout', Colors.yellow),
                );
              },
            ),
          ),
        ),
      );
      if (isQuadHDLayoutExpected) {
        expect(find.text("Quad HD Layout"), findsOneWidget);
      }
      if (isFullHDLayoutExpected) {
        expect(find.text('Full HD Layout'), findsOneWidget);
      }
      if (isHDLayoutExpected) {
        expect(find.text('HD Layout'), findsOneWidget);
      }
      if (isSDLayoutExpected) {
        expect(find.text('SD Layout'), findsOneWidget);
      }
    });

    testWidgets('Tablet Layout Test', (WidgetTester tester) async {
      bool isHighResTabletExpected = false;
      bool isStandardResTabletExpected = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                isHighResTabletExpected =
                    ResponsiveWebLayout.isHighResTabletLayout(context: context);
                isStandardResTabletExpected =
                    ResponsiveWebLayout.isStandardTabletLayout(
                        context: context);
                return ResponsiveWebLayout.buildTabletLayout(
                  context: context,
                  highResTabletLayout:
                      _buildContainer('High Res Tablet Layout', Colors.orange),
                  standardTabletLayout:
                      _buildContainer('Standard Tablet Layout', Colors.purple),
                );
              },
            ),
          ),
        ),
      );
      if (isHighResTabletExpected) {
        expect(find.text('High Res Tablet Layout'), findsOneWidget);
      }
      if (isStandardResTabletExpected) {
        expect(find.text('Standard Tablet Layout'), findsOneWidget);
      }
    });

    testWidgets('Mobile Layout Test', (WidgetTester tester) async {
      bool isLargeMobileLayoutExpected = false;
      bool isMediumMobileLayoutExpected = false;
      bool isSmallMobileLayoutExpected = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                isLargeMobileLayoutExpected =
                    ResponsiveWebLayout.isLargeMobileLayout(context: context);
                isMediumMobileLayoutExpected =
                    ResponsiveWebLayout.isMediumMobileLayout(context: context);
                isSmallMobileLayoutExpected =
                    ResponsiveWebLayout.isSmallMobileLayout(context: context);
                return ResponsiveWebLayout.buildMobileLayout(
                  context: context,
                  largeMobileLayout:
                      _buildContainer('Large Mobile Layout', Colors.pink),
                  mediumMobileLayout:
                      _buildContainer('Medium Mobile Layout', Colors.teal),
                  smallMobileLayout:
                      _buildContainer('Small Mobile Layout', Colors.indigo),
                );
              },
            ),
          ),
        ),
      );
      if (isLargeMobileLayoutExpected) {
        expect(find.text('Large Mobile Layout'), findsOneWidget);
      }
      if (isMediumMobileLayoutExpected) {
        expect(find.text('Medium Mobile Layout'), findsOneWidget);
      }
      if (isSmallMobileLayoutExpected) {
        expect(find.text('Small Mobile Layout'), findsOneWidget);
      }
    });

    testWidgets('Platform Specific Layout Test', (WidgetTester tester) async {
      bool isQuadHDLayoutExpected = false;
      bool isFullHDLayoutExpected = false;
      bool isHDLayoutExpected = false;
      bool isSDLayoutExpected = false;
      bool isHighResTabletExpected = false;
      bool isStandardResTabletExpected = false;
      bool isLargeMobileLayoutExpected = false;
      bool isMediumMobileLayoutExpected = false;
      bool isSmallMobileLayoutExpected = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                // Get the expected layout types
                 isQuadHDLayoutExpected =
                ResponsiveWebLayout.isQuadHDLayout(context: context);
                 isFullHDLayoutExpected =
                ResponsiveWebLayout.isFullHDLayout(context: context);
                 isHDLayoutExpected =
                ResponsiveWebLayout.isHdLayout(context: context);
                 isSDLayoutExpected =
                ResponsiveWebLayout.isSdLayout(context: context);
                 isHighResTabletExpected =
                ResponsiveWebLayout.isHighResTabletLayout(context: context);
                 isStandardResTabletExpected =
                ResponsiveWebLayout.isStandardTabletLayout(
                    context: context);
                 isLargeMobileLayoutExpected =
                ResponsiveWebLayout.isLargeMobileLayout(context: context);
                 isMediumMobileLayoutExpected =
                ResponsiveWebLayout.isMediumMobileLayout(context: context);
                 isSmallMobileLayoutExpected =
                ResponsiveWebLayout.isSmallMobileLayout(context: context);

                // Build the layout based on the expected types
                return ResponsiveWebLayout.buildPlatformSpecificLayout(
                  context: context,
                  quadHDLayout: _buildContainer('Quad HD Layout', Colors.red),
                  fullHDLayout: _buildContainer('Full HD Layout', Colors.green),
                  hdLayout: _buildContainer('HD Layout', Colors.blue),
                  sdLayout: _buildContainer('SD Layout', Colors.yellow),
                  largeMobileLayout:
                  _buildContainer('Large Mobile Layout', Colors.pink),
                  mediumMobileLayout:
                  _buildContainer('Medium Mobile Layout', Colors.teal),
                  smallMobileLayout:
                  _buildContainer('Small Mobile Layout', Colors.indigo),
                  highResTabletLayout:
                  _buildContainer('High Res Tablet Layout', Colors.orange),
                  standardTabletLayout:
                  _buildContainer('Standard Tablet Layout', Colors.purple),
                );
              },
            ),
          ),
        ),
      );

      // Verify the presence of each layout type if expected
      expect(find.text('Quad HD Layout'),
          isQuadHDLayoutExpected ? findsOneWidget : findsNothing);
      expect(find.text('Full HD Layout'),
          isFullHDLayoutExpected ? findsOneWidget : findsNothing);
      expect(find.text('HD Layout'), isHDLayoutExpected ? findsOneWidget : findsNothing);
      expect(find.text('SD Layout'), isSDLayoutExpected ? findsOneWidget : findsNothing);
      expect(find.text('High Res Tablet Layout'),
          isHighResTabletExpected ? findsOneWidget : findsNothing);
      // expect(find.text('Standard Tablet Layout'),
      //     isStandardResTabletExpected ? findsOneWidget : findsNothing);
      expect(find.text('Large Mobile Layout'),
          isLargeMobileLayoutExpected ? findsOneWidget : findsNothing);
      expect(find.text('Medium Mobile Layout'),
          isMediumMobileLayoutExpected ? findsOneWidget : findsNothing);
      expect(find.text('Small Mobile Layout'),
          isSmallMobileLayoutExpected ? findsOneWidget : findsNothing);
    });
  });
}

Widget _buildContainer(String text, Color color) {
  return Container(
    alignment: Alignment.center,
    color: color,
    child: Text(
      text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
