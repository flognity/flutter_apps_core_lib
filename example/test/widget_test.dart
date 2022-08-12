// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_apps_core_lib_example/widgets/buttons.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialAppCreator extends StatelessWidget {
  final Widget child;
  const MaterialAppCreator({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: child));
  }
}

//helper function to get the type of generic objects
Type typeOf<T>() => T;

void main() {
  testWidgets('ButtonShowcase Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialAppCreator(child: ButtonShowcase()));

    //Make sure there is at least one of each of the following widgets
    List<Type> _buttonList = [
      ElevatedButton,
      OutlinedButton,
      TextButton,
      FloatingActionButton,
      IconButton,
      CircleAvatar,
      typeOf<DropdownButton<String>>(),
      typeOf<PopupMenuButton<String>>(),
    ];
    _buttonList.forEach((Type widgetType) {
      expect(find.byType(widgetType), findsWidgets);
    });

    ///Make sure the DropDown and PopUp Buttons have some content
    //press the DropDown Button
    await tester.press(find.byType(typeOf<DropdownButton<String>>()).first);
    await tester.pump(); //kick off the animation
    //check if there are items to select from
    expect(find.byType(typeOf<DropdownMenuItem<String>>()), findsWidgets);
    //select one item to close the menu
    await tester.press(find.byType(typeOf<DropdownMenuItem<String>>()).first);
    await tester.pump(); //kick off the animation
    //press the PopUpMenu Button
    await tester.tap(find.byType(typeOf<PopupMenuButton<String>>()).first);
    await tester.pump(); //kick off the animation
    //check if there are items to select from
    expect(find.byType(typeOf<PopupMenuItem<String>>()), findsWidgets);
    //select one item to close the menu
    await tester.tap(find.byType(typeOf<PopupMenuItem<String>>()).first);
    await tester.pump(); //kick off the animation
  });
}
