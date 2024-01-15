import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/next_screen.dart';
import '../patients/labteat.dart';
import '../patients/patientHistory.dart';

class profilePatient_doctor extends StatefulWidget {
  const profilePatient_doctor({super.key});

  @override
  State<profilePatient_doctor> createState() => _profilePatient_doctorState();
}

class _profilePatient_doctorState extends State<profilePatient_doctor> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Ali Ahmed', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '+9647710099000', CupertinoIcons.phone),
              const SizedBox(height: 10),
              itemProfile('Address', 'sulaymaniyah/bakrajo', CupertinoIcons.location),
              const SizedBox(height: 10),
              itemProfile('Email', 'rasty.devp@gmail.com', CupertinoIcons.mail),
              const SizedBox(height: 20,),
              Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Electronic Health Record (EHR)",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700, letterSpacing: 1, fontSize: 14),
                        ),
                        TextButton(onPressed: () {}, child: Text('show more'))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: servicesList
                          .map((e) => CupertinoButton(
                          onPressed: () {
                            if (e.name == 'Lab Test') {
                              nextScreen(context, labtest());
                            } else {
                              nextScreen(context, patientHistore());
                            }
                          },
                          padding: EdgeInsets.zero,
                          child: Container(
                              width: SizeConfig.blockSizeHorizontal! * 20,
                              height: SizeConfig.blockSizeHorizontal! * 20,
                              decoration: BoxDecoration(
                                color: e.color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      e.image,
                                      height: 50,
                                      width: 40,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      e.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )
                                ],
                              ))))
                          .toList(),
                    ),
                  ],
                ),
              )
           ,
           SizedBox(height: 100,),
            ],
          ),
        ),
      ],),
    );
  }
}

itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0.1),
              color: Colors.black38,//Colors.deepOrange.withOpacity(.2),
              spreadRadius: 1,
              blurRadius: 5
          )
        ]
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
      tileColor: Colors.white,
    ),
  );
}
class Servicesdata {
  final String name;
  final String image;
  final Color color;

  Servicesdata({
    required this.name,
    required this.image,
    required this.color,
  });
}

// Services List OF DATA

List<Servicesdata> servicesList = [
  Servicesdata(
    name: 'Lab Test',
    image: 'assets/images/lab.png',
    color: const Color(0xffDCEDF9),
  ),
  Servicesdata(
    name: 'Medication',
    image: 'assets/images/medication.png',
    color: const Color(0xffFAF0DB),
  ),
  Servicesdata(
    name: ' Patient History',
    image: 'assets/images/patientHistore.png',
    color: const Color(0xffD6F6FF),
  ),
];

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}
