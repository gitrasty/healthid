import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../component/next_screen.dart';
import '../../component/showPDF.dart';
import '../HomePage.dart';

class patientHistore extends StatefulWidget {
  const patientHistore({super.key});

  @override
  State<patientHistore> createState() => _patientHistoreState();
}

class _patientHistoreState extends State<patientHistore> {

  // Allergy /Immunization date
  List patientHistore=[
    {
      'name':'patient history',
      'namelab':'Health ID',
      'datetime':'1/1/2024'
    },
    // {
    //   'name':'CBC',
    //   'namelab':'Health ID',
    //   'datetime':'1/1/2024'
    // } ,  {
    //   'name':'ALT',
    //   'namelab':'Health ID',
    //   'datetime':'1/1/2024'
    // } ,
    // {
    //   'name':'Anti CCP',
    //   'namelab':'Health ID',
    //   'datetime':'1/1/2024'
    // }
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('patient history'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                  CupertinoButton(
                      onPressed: () {

                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                          width: SizeConfig.blockSizeHorizontal! * 20,
                          height: SizeConfig.blockSizeHorizontal! * 20,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.handDots,size: 40,),
                              // Expanded(
                              //   child: Image.asset(
                              //     e.image,
                              //     height: 50,
                              //     width: 40,
                              //   ),
                              // ),
                              Expanded(
                                child: Text(
                                  'Allergy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ))),
                    CupertinoButton(
                        onPressed: () {

                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                            width: SizeConfig.blockSizeHorizontal! * 20,
                            height: SizeConfig.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.handDots,size: 45,),
                                // Expanded(
                                //   child: Image.asset(
                                //     e.image,
                                //     height: 50,
                                //     width: 40,
                                //   ),
                                // ),
                                Expanded(
                                  child: Text(
                                    'Immunization date',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            )))

                ],),
              ),
Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: patientHistore.length,
                  itemBuilder: (context, index) {
                    var data=patientHistore[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          nextScreen(context, showPDF(title: data['name'],path: 'assets/pdf/Patient_history.pdf',));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(0, 0.5),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/patientHistore.png',
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Text(
                                      data['namelab'],
                                      style: TextStyle(color: Colors.grey.shade700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  data['datetime'],
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
