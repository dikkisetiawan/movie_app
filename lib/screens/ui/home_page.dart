import 'dart:math';

import '../widgets/title_divider.dart';
import '../widgets/rounded_top_right_container.dart';
import '/screens/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: kAppBar(),
      body: ListView(children: [
        locationDropdown(),
        banner(),
        TitleDivider(
          title: 'Sedang Tayang',
          buttonTitle: 'Semua',
        ),
        kTabBar(),
        kTabBarView(),
        // RoundedTopRightContainer(child: mainStat()),
        // TitleDivider(
        //   title: 'Meals Today',
        //   buttonTitle: 'Customize',
        // ),
        // mealListCategory(),
        // TitleDivider(
        //   title: 'Body Measurements',
        //   buttonTitle: 'Today',
        // ),
      ]),
    );
  }

  Widget banner() {
    return Container(
      width: double.infinity,
      height: 200,
      color: kSecondaryColor,
      child: Text('banner'),
    );
  }

  Widget locationDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
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
          Spacer(),
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

  AppBar kAppBar() {
    return AppBar(
      backgroundColor: kBackgroundColor,
      centerTitle: true,
      title: Text(
        'nama nim title',
        style: blackTextStyle,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: kPrimaryColor,
              size: 30.0,
            ))
      ],
    );
  }
}

class kTabBarView extends StatelessWidget {
  const kTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        movieList(),
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
        SizedBox(
          width: 5.0,
        ),
        Chip(
            backgroundColor: kPrimaryColor,
            label:
                Text('Cinepolis', style: whiteTextStyle.copyWith(fontSize: 11)))
      ],
    );
  }

  Widget movieList() {
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [movieItem(), movieItem(), movieItem(), movieItem()],
      ),
    );
  }

  Widget movieItem() {
    return Container(
      padding: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          bottom: defaultMargin), //mengatur margin antar moviebox
      child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultCircular),
          child: Image.asset(
            'assets/wakanda.jpg',
            fit: BoxFit.fill, //agar rounded corner imagenya
          )),
    );
  }
}

class kTabBar extends StatelessWidget {
  const kTabBar({
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
              physics: BouncingScrollPhysics(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              indicatorPadding: EdgeInsets.only(left: 0.0),
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
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: color),
          borderRadius: BorderRadius.all(Radius.circular(
                  defaultCircular) //         <--- border radius here
              ),
        ),
        child: Text(
          title,
          style: buttonTextStyle,
        ));
  }
}

Widget mainStat() {
  return Column(
    children: [
      Row(
        children: [
          Column(
            children: [
              consumedWiget(
                  'Eaten', 1127, 'assets/undraw_Video_streaming_re_v3qg.png'),
              consumedWiget(
                  'Burned', 102, 'assets/undraw_Video_streaming_re_v3qg.png')
            ],
          ),
          const Spacer(),
        ],
      ),
      Divider(
        height: 50.0,
        color: kGreyColor.withOpacity(0.5),
        thickness: 1.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          indicatorWidget('Carbs', 12, kPrimaryColor),
          indicatorWidget('Protein', 30, kSecondaryColor),
          indicatorWidget('Fat', 10, kRedColor)
        ],
      )
    ],
  );
}

Widget indicatorWidget(String title, int number, Color mainColor) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: blackTextStyle.copyWith(fontSize: 18.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        '${number}g left',
        style: greyTextStyle.copyWith(fontSize: 14),
      )
    ],
  );
}

Widget consumedWiget(String title, int number, String assetName) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15.0),
          width: 3.0,
          height: 40.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                kPrimaryColor.withOpacity(0.4),
                kSecondaryColor.withOpacity(0.4)
              ])),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: greyTextStyle.copyWith(fontSize: 14.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Image(width: 20, height: 20, image: AssetImage(assetName)),
                Text(
                  '  $number  ',
                  style: blackTextStyle.copyWith(fontSize: 18.0),
                ),
                Text(
                  ' kcal',
                  style: greyTextStyle.copyWith(fontSize: 12.0),
                )
              ],
            )
          ],
        ),
      ],
    ),
  );
}
