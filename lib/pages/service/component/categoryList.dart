 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85),
        itemBuilder: (context, index) => CategoryCard(
          product: products[index],
        ));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: product.color, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           product.icon,
            // Image.asset(
            //   product.image,
            //   height: 100,
            // ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.title, textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,

                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Text(
            //     "${product.courses} courses",
            //     textAlign: TextAlign.center,
            //     style: const TextStyle(
            //       fontSize: 14,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}



class Product {
  final String image, title;
  final int id, courses;
  final Color color;
  final Icon icon;
  Product({
    required this.image,
    required this.title,
    required this.courses,
    required this.color,
    required this.id,
    required this.icon
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Medical Courses ",
    icon: Icon(FontAwesomeIcons.kitMedical,size: 40,),
    image: "assets/logo.png",
    color: Color(0xFF71b8ff),
    courses: 16,
  ),
  Product(
    id: 2,
    title: "Dr. Online",
    icon: Icon(FontAwesomeIcons.userDoctor,size: 40,),
    image: "assets/logo.png",
    color: Color(0xFFff6374),
    courses: 22,
  ),
  Product(
    id: 3,
    title: "Ambulance Delivery ",
    icon: Icon(FontAwesomeIcons.truckMedical,size: 40,),
    image: "assets/logo.png",
    color: Colors.purple,
    courses: 15,
  ),
  Product(
    id: 3,
    title: "Unique healthcare professionals- offers",
    icon: Icon(FontAwesomeIcons.suitcaseMedical,size: 40,),
    image: "assets/logo.png",
    color: Colors.cyanAccent,
    courses: 15,
  ),
  Product(
    id: 3,
    title: "Virtual consultations and appointments ",
    icon: Icon(FontAwesomeIcons.calendarCheck,size: 40,),
    image: "assets/logo.png",
    color: Colors.lightBlue,
    courses: 15,
  ),
  Product(
    id: 3,
    title: "Pharmaceutical Companies",
    icon: Icon(FontAwesomeIcons.prescriptionBottleMedical,size: 40,),
    image: "assets/logo.png",
    color: Colors.lightGreen,
    courses: 15,
  ),
 
];