import 'package:flutter/cupertino.dart';

class CupertinoPickerComponent extends StatelessWidget {
  int min;
  int max;
  int selected;
  ValueChanged<int> customOnChanged;
  double customFontSize;

  CupertinoPickerComponent({super.key,required this.max,required this.min,
    required this.selected,required this.customOnChanged,required this.customFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
        scrollController: FixedExtentScrollController(
            initialItem: selected - min),
        itemExtent: 40,
        looping: true,
        onSelectedItemChanged: customOnChanged,
        children: List.generate(max - min + 1, (index) {
          return Text("${index<10?(index+min)+0 : (index+min)}",style: TextStyle(fontSize: customFontSize,
          ),);
        },));
  }
}
