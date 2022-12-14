import 'package:flutter/material.dart';

class ChipShowcase extends StatefulWidget {
  const ChipShowcase({Key? key}) : super(key: key);

  @override
  _ChipShowcaseState createState() => _ChipShowcaseState();
}

class _ChipShowcaseState extends State<ChipShowcase> {
  int? _selectedInputChip = 1;
  int? _selectedChoiceChip = 1;
  final List<String> _values = ['Input Chip 1', 'Input Chip 2'];
  final TextEditingController _textEditingController =
      new TextEditingController();

  void addChip(String newChipValue) {
    if (newChipValue != '') {
      setState(() {
        _values.add(newChipValue);
        _textEditingController.clear();
        //Close the keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text('Chips:'),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 0.0, // gap between lines
          children: [
            const Chip(
              label: Text('Chip'),
            ),
            const Chip(
              label: Text('Avatar Chip'),
              avatar: FlutterLogo(),
            ),
            InputChip(
              label: Text('Input Chip (button)'),
              avatar: FlutterLogo(),
              onPressed: () {},
              tooltip: 'This is an Input Chip',
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text('Choice Chips:'),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 0.0, // gap between lines
          children: List<Widget>.generate(
            2,
            (int index) {
              return ChoiceChip(
                label: Text('Choice Chip $index'),
                avatar: const CircleAvatar(
                  child: FlutterLogo(),
                ),
                //onPressed: () {},
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoiceChip = selected ? index : null;
                  });
                },
                selected: _selectedChoiceChip == index,
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text('Selectable Input Chips:'),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 0.0, // gap between lines
          children: List<Widget>.generate(
            3,
            (int index) {
              return InputChip(
                label: Text('Input Chip $index'),
                avatar: const FlutterLogo(),
                tooltip: 'This is Input Chip $index',
                onSelected: (bool selected) {
                  setState(() {
                    _selectedInputChip = selected ? index : null;
                  });
                },
                selected: _selectedInputChip == index,
              );
            },
          ),
        ),
        const Text('Deletable Input Chips:'),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 0.0, // gap between lines
          children: [
            for (int index = 0; index < _values.length; index++)
              InputChip(
                label: Text(_values[index]),
                avatar: const FlutterLogo(),
                tooltip: 'This is Input Chip $index',
                onDeleted: () {
                  setState(() {
                    _values.removeAt(index);
                  });
                },
              ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: addChip,
                key: const Key('TextFieldForChips'),
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Add more chips',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addChip(_textEditingController.text.toLowerCase());
                },
                child: const Text('add chip'))
          ],
        ),
      ],
    );
  }
}
