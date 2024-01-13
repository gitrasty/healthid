import 'package:flutter/material.dart';
import 'package:healthid/component/next_screen.dart';
import 'package:healthid/component/showPDF.dart';

class labtest extends StatefulWidget {
  const labtest({super.key});

  @override
  State<labtest> createState() => _labtestState();
}

class _labtestState extends State<labtest> {

  List ListLabtest=[
    {
      'name':'Blood',
      'namelab':'Health ID',
      'datetime':'1/1/2024'
    },
    {
      'name':'CBC',
      'namelab':'Health ID',
      'datetime':'1/1/2024'
    } ,  {
      'name':'ALT',
      'namelab':'Health ID',
      'datetime':'1/1/2024'
    } ,
    {
      'name':'Anti CCP',
      'namelab':'Health ID',
      'datetime':'1/1/2024'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Lab'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: ListLabtest.length,
          itemBuilder: (context, index) {
            var data=ListLabtest[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  nextScreen(context, showPDF(title: data['name'],path: 'assets/pdf/Health-ID-lab-test.pdf',));
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
                                    'assets/images/lab.png',
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
                          width: 110,
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
        ));
  }
}
