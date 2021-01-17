import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  DropDownMenu({Key key}) : super(key: key);

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

/// This is the private State class that goes with DropDownMenu.
class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: DropdownButton<String>(
        underline: null,
        isExpanded: true,
        value: dropdownValue,
        iconSize: 24,
        elevation: 16,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
      ),
    );
  }
}
