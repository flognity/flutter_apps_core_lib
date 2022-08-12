import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../widgets/chips.dart';
import '../widgets/data_tables.dart';
import '../widgets/dialogs.dart';
import '../widgets/progress_indicators.dart';
import '../widgets/tabbar.dart';
import '../widgets/toggles.dart';

class WidgetWrapper extends StatelessWidget {
  final String name;
  final Widget child;
  const WidgetWrapper({Key? key, required this.name, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class MaterialShowcaseScreen {
  static List<WidgetWrapper> getWidgetList(BuildContext context) {
    return <WidgetWrapper>[
      WidgetWrapper(
        name: 'Chips, Checkboxes and Radios',
        child: ListView(
          children: const [
            ChipShowcase(),
            SizedBox(
              height: 20.0,
            ),
            TogglesShowcase(),
          ],
        ),
      ),
      WidgetWrapper(
        name: 'Buttons and Dialogs',
        child: ListView(
          children: [
            Text(
              'Buttons and Dialogs',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const ButtonShowcase(),
            const Divider(
              thickness: 8,
            ),
            const DialogShowcase(),
            const Divider(
              thickness: 8,
            ),
            const ProgressIndicatorsShowcase(),
          ],
        ),
      ),
      WidgetWrapper(
        name: 'Tab Bar',
        child: ListView(
          children: [
            Text(
              'Tab Bar',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const TabBarShowcase(),
          ],
        ),
      ),
      WidgetWrapper(
        name: 'Data Table',
        child: ListView(
          children: [
            Text(
              'Data Table',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const DataTableShowcase(),
          ],
        ),
      ),
    ];
  }
}
