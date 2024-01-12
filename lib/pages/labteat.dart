import 'package:flutter/material.dart';

class labtest extends StatefulWidget {
  const labtest({super.key});

  @override
  State<labtest> createState() => _labtestState();
}

class _labtestState extends State<labtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 0.5),
                          blurRadius: 5,
                          spreadRadius: 1)
                    ]),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.0,right: 20),
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
                                  'assets/images/lab.png',
                                ),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text('Lab Code : 101',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          Text("LAB TEST name",style: TextStyle(color: Colors.grey.shade700),),
                        ],
                      ),
                      Text("1/1/2024",style: TextStyle(color: Colors.grey.shade700),),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
