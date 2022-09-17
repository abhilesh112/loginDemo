import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/image_slider_model.dart';
import '../widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xff002c7b)));
    return Scaffold(
        backgroundColor: const Color(0xffecf8ff),
        appBar: appBar(),
        body: _bodyItem());
  }

  Widget _bodyItem() {
    return CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(child: _getListOfImageCarsule()),
      const SliverToBoxAdapter(
        child: SizedBox(height: 10),
      ),
      SliverToBoxAdapter(child: _getTransferWidget()),
      SliverToBoxAdapter(child: _getofferWidget()),
      SliverToBoxAdapter(child: _getSponserLink()),
      SliverToBoxAdapter(child: _getListOfImageCarsule()),
      const SliverToBoxAdapter(
        child: SizedBox(height: 10),
      ),
    ]);
  }

  Widget _getListOfImageCarsule() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width / 2.5,
          width: MediaQuery.of(context).size.width,
          // margin: EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 13),
                child: CarouselSlider(
                  options: CarouselOptions(
                    // height: 400.0,
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                  ),
                  items: CarouselSliderList(_getImageSliderList()),
                )),
          ),
        ),
        Positioned(
          bottom: 5.0,
          right: 0.0,
          left: 0.0,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (int index) {
                return dots(_currentIndex, index);
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getofferWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _getOtherWidget("assets/icons/offers.png", "Offers", () {}),
          _getOtherWidget("assets/icons/rewards.png", "Rewards", () {}),
          _getOtherWidget("assets/icons/refer.png", "Refer & Earn", () {}),
        ],
      ),
    );
  }

  Widget _getTransferWidget() {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Transer Money",
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getTransferMoneyList(
                    "assets/icons/mobileno.png", "To Mobile\nNumber"),
                _getTransferMoneyList(
                    "assets/icons/wallet.png", "To Wallet\nAddress"),
                _getTransferMoneyList(
                    "assets/icons/bank.png", "Check Bank\nBalance")
              ],
            ),
            const Spacer(),
            Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xffCCEDFF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0)),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "My UPI ID:",
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            color: const Color(0xff455056),
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "  1234567890@upi,",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffb1b1b1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _getSponserLink() {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 140,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Sponsored Links",
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getSponserButton("assets/icons/swiggy.png", "Swiggy", () {}),
                _getSponserButton("assets/icons/ixigo.png", "ixigo", () {}),
                _getSponserButton(
                    "assets/icons/flipkart.png", "Flipkart", () {}),
                _getSponserButton(
                    "assets/icons/Group40.png", "My11Circle", () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getSponserButton(String image, String text, Function onclick) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 30,
          width: 30,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: GoogleFonts.lato(
              fontSize: 12,
              color: const Color(0xffb1b1b1),
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _getOtherWidget(String image, String title, Function callback) {
    return GestureDetector(
      onTap: () => callback,
      child: Container(
        height: 70,
        width: 115,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xff329CD7)),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 30,
                width: 30,
              ),
              Text(
                title,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTransferMoneyList(String image, String title) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff012878)),
          child: Center(
              child: Image.asset(
            image,
            height: 40,
            width: 20,
          )),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: const Color(0xffb1b1b1),
          ),
        ),
      ],
    );
  }

  List<ImageSliderModel> _getImageSliderList() {
    List<ImageSliderModel> list = [];
    list.add(ImageSliderModel("assets/icons/images.jpg"));
    list.add(ImageSliderModel("assets/icons/images.jpg"));
    list.add(ImageSliderModel("assets/icons/images.jpg"));

    return list;
  }

  CarouselSliderList(List<ImageSliderModel> getImageSliderList) {
    return getImageSliderList.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  Widget dots(int current, index) {
    if (current != index) {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor(index),
          ));
    } else {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: dotColor(index)));
    }
  }

  Widget imageSliderItem(ImageSliderModel i) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.30,
        margin: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: MediaQuery.of(context).size.width / 1.05,
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            i.path,
            fit: BoxFit.fill,
          ),
        ));
  }

  Color dotColor(int index) {
    return _currentIndex == index ? Colors.grey : const Color(0xff29285b);
  }
}
