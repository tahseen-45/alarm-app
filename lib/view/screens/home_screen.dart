
import 'package:alarm_app/repository/alarm_repository.dart';
import 'package:alarm_app/res/colors.dart';
import 'package:alarm_app/view/screens/set_alarm_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AlarmRepository alarmRepository=AlarmRepository();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Alarm app",style: TextStyle(
              fontSize: 21,fontWeight: FontWeight.bold,color: AppColor.white),
          ),
        ),
        backgroundColor: AppColor.mediumBlue,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<(int?,int?,String?)>(stream: alarmRepository.getAlarmData(),
              builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator())
                ],
              );
            }
            if(snapshot.hasError){
             return const Center(child: Text("Error"));
            }
            else{
             return TweenAnimationBuilder(tween: Tween(begin: 0.0,end: 1.0),
                 duration: const Duration(seconds: 1), builder: (context, value, child) {
               return Opacity(
                 opacity: value,
                 child: snapshot.data!=null? Column(
                     children: [
                       const Center(child: Text("Alarm is set for",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                       Center(child: Text("${snapshot.data!.$1!<10? snapshot.data!.$1.toString().padLeft(2, '0') : snapshot.data!.$1}"
                           " : ${snapshot.data!.$2!<10? snapshot.data!.$2.toString().padLeft(2, '0') : snapshot.data!.$2} : ${snapshot.data!.$3==null?"" : snapshot.data!.$3}",
                         style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                       ),
                     ],
                   ) : const Column(
                   children: [
                     Center(child: Text("Alarm is set for",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                     Center(child: Text("00 : 00",
                       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                     ),
                   ],
                 ),
               );
                 },);

            }
              },)

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SetAlarmScreen(),));
      },
        backgroundColor: AppColor.mediumBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
