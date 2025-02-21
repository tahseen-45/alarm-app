import 'package:alarm_app/components/cupertino_picker.dart';
import 'package:alarm_app/components/cupertino_picker_am_pm.dart';
import 'package:alarm_app/repository/alarm_repository.dart';
import 'package:alarm_app/res/colors.dart';
import 'package:alarm_app/view/screens/home_screen.dart';
import 'package:alarm_app/viewmodel/hourviewviewmodel.dart';
import 'package:alarm_app/viewmodel/minutesviewviewmodel.dart';
import 'package:alarm_app/viewmodel/periodviewviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetAlarmScreen extends StatefulWidget {

  const SetAlarmScreen({super.key});

  @override
  State<SetAlarmScreen> createState() => _SetAlarmScreenState();
}

class _SetAlarmScreenState extends State<SetAlarmScreen> {
  AlarmRepository alarmRepository=AlarmRepository();

  @override
  Widget build(BuildContext context) {
    double HeightX=MediaQuery.of(context).size.height;
    double WidthY=MediaQuery.of(context).size.width;
    final hourViewViewModel=Provider.of<HourViewViewModel>(context,listen: false);
    final minutesViewViewModel=Provider.of<MinutesViewViewModel>(context,listen: false);
    final periodViewViewModel=Provider.of<PeriodViewViewModel>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Set Alarm",style: TextStyle(
              fontSize: 21,fontWeight: FontWeight.bold,color: AppColor.white),
          ),
        ),
        backgroundColor: AppColor.mediumBlue,
        leading: InkWell(onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        },
            child: Icon(CupertinoIcons.back,color: AppColor.white,)),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<HourViewViewModel>(builder: (context, vm, child) {
                return Container(
                  height: HeightX*0.4,
                width: WidthY*0.2,
                child: CupertinoPickerComponent(max: 12, min: 1,
                    selected: vm.selectedHour,
                  customOnChanged: (value) {
                    vm.setSelectedHour=value+1;
                    },
                    customFontSize: 24,),
              );
              },),
              Consumer<MinutesViewViewModel>(builder: (context, vm, child) {
                return Container(
                  height: HeightX*0.4,
                  width: WidthY*0.2,
                  child: CupertinoPickerComponent(max: 59, min: 0,
                    selected: vm.selectedMinute, customOnChanged: (value) {
                      vm.setSelectedMinute=value;
                      },
                    customFontSize: 24,),
                );
              },),
              Consumer<PeriodViewViewModel>(builder: (context, vm, child) {
                return Container(
                  height: HeightX*0.1,
                  width: WidthY*0.2,
                  child: CupertinoPickerAmPm(
                    selectedPeriod: vm.selectedPeriod,
                    customOnChanged: (value) {
                      vm.setSelectedPeriod=value==0? "AM" : "PM";
                      },
                  ),
                );
              },),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: HeightX*0.19),
            child: InkWell(onTap: () {
              alarmRepository.setAlarm(hourViewViewModel.selectedHour,
                  minutesViewViewModel.selectedMinute,
                  periodViewViewModel.selectedPeriod);
            },
              child: Container(
                width: WidthY*0.54,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.mediumBlue,
                ),
                child: Center(
                  child: Text("Set Alarm",style: TextStyle(
                      fontSize: 21,fontWeight: FontWeight.bold,color: AppColor.white),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
