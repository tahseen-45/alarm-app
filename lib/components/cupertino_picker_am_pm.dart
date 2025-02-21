import 'package:flutter/cupertino.dart';

class CupertinoPickerAmPm extends StatelessWidget {
  String? selectedPeriod;
  ValueChanged<int> customOnChanged;
  CupertinoPickerAmPm({super.key,this.selectedPeriod,required this.customOnChanged});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: selectedPeriod=="AM"? 0 : 1),
        itemExtent: 40,
        onSelectedItemChanged: customOnChanged,
        children: const [
          Text("AM",style: TextStyle(fontSize: 24),),
          Text("PM",style: TextStyle(fontSize: 24),),
        ]);
  }
}
