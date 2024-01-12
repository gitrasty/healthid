import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthid/component/next_screen.dart';
import 'package:healthid/pages/labteat.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 7,
            ),
            child: Column(
              children: const [
                // User Info Area .
                UserInfo(),
                // SearchMedical Area.
                SearchMedical(),
                // Services Area .
                Services(),
                // GetBestMedicalService
                GetBestMedicalService(),
              ],
            ),
          ),
          // Upcoming Appointments
          const UpcomingAppointments()
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 7),
        child: Text("Hello!"),
      ),
      subtitle: Text(
        "Rasty abubakr",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: Container(
        width: 48.0,
        height: 48.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/user.png'),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            // Container(
            //   width: 18.0,
            //   height: 18.0,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.grey,
            //     border: Border.all(
            //       color: Colors.white,
            //       width: 3.0,
            //       style: BorderStyle.solid,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

TextEditingController search = TextEditingController();

class SearchMedical extends StatelessWidget {
  const SearchMedical({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 3),
      child: TextField(
        controller: search,
        decoration: InputDecoration(
          filled: true,
          // prefixIcon: CupertinoButton(
          //   onPressed: () {},
          //   child: Center()),
          // suffixIcon: CupertinoButton(
          //   onPressed: () {},
          //   child: Center()
          // ),
          hintText: "Search Docotr ..",
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Services",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, letterSpacing: 1),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: servicesList
              .map((e) => CupertinoButton(
                  onPressed: () {
                    nextScreen(context, labtest());
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
                        children: [
                          Image.asset(
                            e.image,
                            height: 50,
                            width: 40,
                          ),
                          Text(
                            e.name,
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ))))
              .toList(),
        ),
      ],
    );
  }
}

class GetBestMedicalService extends StatelessWidget {
  const GetBestMedicalService({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffDCEDF9),
              borderRadius: BorderRadius.all(Radius.circular(28.0)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal! * 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Patient Histore Profile ", // \nMedical Service",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1),
                        Text(
                          "Clinical case medical histore ", //\ntext of the printing",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                    fontSize: 11.0,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical! * 2),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/histore.jpg'))),
                        height: 100,
                        width: 100,
                      )
                      // Image.asset(AppStyle.image1
                      // ),
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 7,
          ),
          child: Text(
            "Upcoming Appointments",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700, letterSpacing: 1),
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 2),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Row(children: [
                // upcomingAppointmentsList
                //     .map(
                //       (e) =>
                CupertinoButton(
                  onPressed: () {},
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 17,
                    width: SizeConfig.blockSizeHorizontal! * 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: 71.46,
                          height: 99.03,
                          decoration: const BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(26.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '12/2',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '12:40 PM',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                            ),
                            Text(
                              'dr. Ahmed',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.8,
                                    letterSpacing: 1,
                                  ),
                            ),
                            Text(
                              'subTitle',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    letterSpacing: 1,
                                    height: 1.8,
                                    color: Colors.white60,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ])
              //    .toList(),
              ),
        ),
      ],
    );
  }
}

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
    name: 'V Scince',
    image: 'assets/images/lab.png',
    color: const Color(0xffD6F6FF),
  ),
];
