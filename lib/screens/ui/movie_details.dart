import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/rounded_top_right_container.dart';
import '../widgets/title_divider.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(children: [
        Header(),
      ]),
    );
  }
}

class Header extends StatelessWidget {
  Header({
    Key? key,
  }) : super(key: key);

  Map<String, String> movieDescriptionContent = {
    'Genre': 'Action, Adventure, Drama',
    'Durasi': '2 jam 41 menit',
    'Sutradara': 'Ryan Coogler',
    'Rating': 'SU'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/wakanda.jpg'),
                    fit: BoxFit.cover)),
          ),
          backButton(),
          playButton(),
          Positioned(
            bottom: 35,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [movieImage(), movieDescription()],
            ),
          )
        ],
      ),
    );
  }

  Widget movieDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10),
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            Text(
              'Black Panther: Wakanda Forever',
              style: blackTextStyle.copyWith(letterSpacing: -1),
            ),
            const SizedBox(
              height: 20.0,
            ),
            movieDescriptionView()
          ],
        ),
      ),
    );
  }

  SingleChildScrollView movieDescriptionView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          movieDescriptionTitles(),
          const SizedBox(
            width: 10.0,
          ),
          movieDescriptionTitlesContent()
        ],
      ),
    );
  }

  Column movieDescriptionTitlesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: movieDescriptionContent.values
          .map((item) => Text(
                item,
                style: blackTextStyle.copyWith(fontSize: 14, letterSpacing: -1),
              ))
          .toList(),
    );
  }

  Column movieDescriptionTitles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: movieDescriptionContent.keys
          .map((item) => Text(
                item,
                style: greyTextStyle.copyWith(fontSize: 14, letterSpacing: -1),
              ))
          .toList(),
    );
  }

  Widget movieImage() {
    return Container(
      decoration: BoxDecoration(boxShadow: [kShadow]),
      width: 120,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultCircular),
        child: Image.asset(
          'assets/wakanda.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Positioned playButton() {
    return Positioned(
        left: 0,
        right: 0,
        top: 50,
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_circle_fill_rounded,
              size: 80,
              color: kWhiteColor.withOpacity(0.8),
              shadows: [kShadow],
            )));
  }

  Positioned backButton() {
    return Positioned(
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_circle_left_rounded,
              size: 40,
              color: kSecondaryColor,
              shadows: [kShadow],
            )));
  }
}
