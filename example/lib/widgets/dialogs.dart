import 'package:flutter/material.dart';

class DialogShowcase extends StatelessWidget {
  const DialogShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text('Open a dialog:'),
            ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('AlertDialog Title'),
                  content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Text('Show Dialog'),
            ),
          ],
        ),
        Column(
          children: [
            const Text('Open a modal bottom sheet:'),
            ElevatedButton(
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) => Container(
                  child: Column(
                    children: [
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              ),
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ],
    );
  }
}
