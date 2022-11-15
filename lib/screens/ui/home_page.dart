import 'package:carousel_slider/carousel_slider.dart';
import '/screens/ui/movie_details.dart';

import '../widgets/title_divider.dart';
import '/screens/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: kAppBar(context),
      body: ListView(children: [
        locationDropdown(),
        Banner(),
        TitleDivider(
          title: 'Sedang Tayang',
          buttonTitle: 'Semua',
        ),
        const KtabBar(),
        const KtabBarView(),
        const VoucherDeal(),
        TitleDivider(
          title: 'Akan Datang',
          buttonTitle: 'Semua',
        ),
        const KtabBarView(),
        bottomHint()
      ]),
    );
  }

  Widget locationDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      color: kGreyColor,
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.pin_drop,
                color: kDarkGreyColor,
              )),
          Text(
            'Surabaya'.toUpperCase(),
            style: blackTextStyle,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_down,
                color: kDarkGreyColor,
              ))
        ],
      ),
    );
  }

  AppBar kAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      centerTitle: true,
      title: searchField(),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildAboutDialog(context),
              );
            },
            icon: Icon(
              Icons.account_circle,
              color: kPrimaryColor,
              size: 30.0,
            ))
      ],
    );
  }

  Widget searchField() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: whiteTextStyle,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: kPrimaryColor,
          ),
          filled: true,
          fillColor: kGreyColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultCircular),
              borderSide: BorderSide(color: kWhiteColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultCircular),
              borderSide: BorderSide(color: kWhiteColor)),
          hintText: 'Search',
          hintStyle: greyTextStyle,
        ),
      ),
    );
  }

  Widget bottomHint() {
    return Padding(
      padding: const EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.movie_creation),
          Text(
            'Dan...Cut! Yuks coba lihat lagi dari paling atas.',
            textAlign: TextAlign.center,
            style: greyTextStyle,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Kembali ke atas',
            style: buttonTextStyle,
          ),
        ],
      ),
    );
  }

  _buildAboutDialog(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Dini Aryani 20200040030',
        style: blackTextStyle,
      ),
    );
  }
}

//Section Banner
class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultMargin),
      decoration: BoxDecoration(boxShadow: [kShadow]),
      child: Stack(
        children: [
          CarouselSlider(
              items: [
                bannerItem('sriasih.jpg', context),
                bannerItem('wakanda.jpg', context),
                bannerItem('wakanda.jpg', context),
              ],
              options: CarouselOptions(
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 500))),
          dots()
        ],
      ),
    );
  }

  Widget dots() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dot(),
          dot(),
          dot(),
          dot(),
          dot(),
        ],
      ),
    );
  }

  Widget dot() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: kSecondaryColor, shape: BoxShape.circle),
    );
  }

  Widget bannerItem(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MovieDetails()),
        );
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultCircular),
            child: Image.asset(
              'assets/$imagePath',
              fit: BoxFit.cover, //agar rounded corner imagenya
            )),
      ),
    );
  }
}

//Section Voucher Deal dan Komponen Childnya
class VoucherDeal extends StatelessWidget {
  const VoucherDeal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultMargin),
          child: Divider(
            color: kGreyColor,
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin - 10),
          child: Text(
            'Voucher Deal!',
            style: blackTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            'Lebih Hemat untuk hiburan Nontonmu',
            style: greyTextStyle.copyWith(fontSize: 16),
          ),
        ),
        dealList(),
        Divider(
          color: kGreyColor,
          thickness: 1.0,
        ),
      ],
    );
  }

  Widget dealList() {
    return Container(
      padding: EdgeInsets.only(bottom: defaultMargin),
      height: 320, //dapat juga untuk atur besar kecil moviebox
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [dealItem(), dealItem(), dealItem(), dealItem()],
      ),
    );
  }

  Widget dealItem() {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultMargin,
        top: defaultMargin,
      ), //mengatur margi
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultCircular),
                      topRight: Radius.circular(defaultCircular)),
                  child: Image.asset(
                    'assets/wakanda.jpg',
                    fit: BoxFit.fill, //agar rounded corner imagenya
                  )),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    boxShadow: [kShadow],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(defaultCircular),
                        bottomRight: Radius.circular(defaultCircular))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Black Panther: Wakanda Aksesoris',
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Periode Tukar 7 Hari',
                          style: greyTextStyle.copyWith(fontSize: 11),
                        ),
                        Text(
                          'Rp 120.000',
                          style: blackTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Section TabBarView dan Komponen Childnya
class KtabBarView extends StatelessWidget {
  const KtabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        movieList(context),
        Text(
          'Black Panther: Wakanda Forever'.toUpperCase(),
          style: blackTextStyle.copyWith(fontSize: 20),
        ),
        movieTheater()
      ],
    );
  }

  Widget movieTheater() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Chip(
            backgroundColor: kRedColor,
            label: Text(
              'CGV',
              style: whiteTextStyle.copyWith(fontSize: 11),
            )),
        const SizedBox(
          width: 5.0,
        ),
        Chip(
            backgroundColor: kPrimaryColor,
            label:
                Text('Cinepolis', style: whiteTextStyle.copyWith(fontSize: 11)))
      ],
    );
  }

  Widget movieList(BuildContext context) {
    return Container(
      height: 400, //dapat juga untuk atur besar kecil moviebox
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          movieItem(context),
          movieItem(context),
          movieItem(context),
          movieItem(context)
        ],
      ),
    );
  }

  Widget movieItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MovieDetails()),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
            left: defaultMargin,
            top: defaultMargin,
            bottom: defaultMargin), //mengatur margin antar moviebox
        child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultCircular),
            child: Image.asset(
              'assets/wakanda.jpg',
              fit: BoxFit.fill, //agar rounded corner imagenya
            )),
      ),
    );
  }
}

class KtabBar extends StatelessWidget {
  const KtabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              indicatorPadding: const EdgeInsets.only(left: 0.0),
              tabs: [
                kTabChip('Semua Bioskop', kBlueColor),
                kTabChip('XXI', kGreyColor),
                kTabChip('CGV', kGreyColor),
                kTabChip('Cinepolis', kGreyColor),
              ]),
        ],
      ),
    );
  }

  Widget kTabChip(String title, Color color) {
    return Container(
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: color),
          borderRadius: const BorderRadius.all(Radius.circular(
                  defaultCircular) //         <--- border radius here
              ),
        ),
        child: Text(
          title,
          style: buttonTextStyle,
        ));
  }
}
