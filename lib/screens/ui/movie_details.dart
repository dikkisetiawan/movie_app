import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../theme.dart';
import '../widgets/title_divider.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(children: [
        HeaderWidget(),
        const MovieRatingAndWhishlistWidget(),
        movieSynopsisWidget(),
        pemeranWidget(),
        SkorMovieWidget()
      ]),
    );
  }

  Widget pemeranWidget() {
    return Column(
      children: [
        TitleDivider(title: 'Pemeran', buttonTitle: 'Lainnya'),
        Container(
          width: double.infinity,
          height: 300,
          child: ListView(
            padding:
                EdgeInsets.only(left: defaultMargin, bottom: defaultMargin),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              pemeranItemWidget(),
              pemeranItemWidget(),
              pemeranItemWidget(),
              pemeranItemWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Column pemeranItemWidget() {
    return Column(
      children: [
        MovieImage(imagePath: 'wakanda.jpg'),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: defaultMargin),
          child: Text(
            'Letitia Wrigth',
            style: blackTextStyle,
          ),
        ),
        Text(
          'Shuri',
          style: greyTextStyle,
        ),
      ],
    );
  }

  Widget movieSynopsisWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: defaultMargin, horizontal: defaultMargin),
      child: Column(
        children: [
          Text(
            'Sinopsis'.toUpperCase(),
            style: blackTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Rakyat Wakanda kali ini akan berjuang untuk melindungi negerinya dari campur tangan kekuatan dunia setelah kematian sang Raja TChalla',
            style: blackTextStyle.copyWith(fontWeight: light, fontSize: 16),
          ),
          Divider(
            thickness: 2.0,
            color: kGreyColor,
          )
        ],
      ),
    );
  }
}

class SkorMovieWidget extends StatelessWidget {
  const SkorMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skor Film',
            style: blackTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ratingList(5.0),
                  ratingList(4.0),
                  ratingList(3.0),
                  ratingList(2.0),
                  ratingList(1.0)
                ],
              ),
              Text('9.3',
                  style: blackTextStyle.copyWith(
                      color: Colors.amber, fontSize: 28)),
              Column(
                children: [
                  Chip(
                      backgroundColor: kPrimaryColor,
                      label: Text(
                        'Rating'.toUpperCase(),
                        style: whiteTextStyle,
                      )),
                  Text('9.111 Vote')
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget ratingList(double rating) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
        ),
        Text(
          '  81%',
          style: greyTextStyle,
        )
      ],
    );
  }
}

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(boxShadow: [kShadow]),
      width: 140,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultCircular),
        child: Image.asset(
          'assets/$imagePath',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MovieRatingAndWhishlistWidget extends StatelessWidget {
  const MovieRatingAndWhishlistWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: kGreyColor,
          thickness: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              movieRating(),
              Container(
                width: 5,
                height: 50,
                color: kGreyColor,
              ),
              watchList()
            ],
          ),
        ),
        Divider(
          color: kGreyColor,
          thickness: 7.0,
        ),
      ],
    );
  }

  Column movieRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '5.0  ',
              style: blackTextStyle.copyWith(color: Colors.amber, fontSize: 18),
            ),
            RatingBarIndicator(
              rating: 2.75,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
        Text(
          '9.111 Vote >',
          style: greyTextStyle.copyWith(fontSize: 14, fontWeight: bold),
        )
      ],
    );
  }

  Column watchList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.heart_broken,
              color: kDarkGreyColor,
            ),
            Text('   WATCHLIST'),
          ],
        ),
        Text(
          '36.436 Orang',
          style: greyTextStyle.copyWith(fontSize: 14, fontWeight: bold),
        )
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    Key? key,
  }) : super(key: key);

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
          backButton(context),
          playButton(),
          Positioned(
            bottom: 35,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieImage(imagePath: 'wakanda.jpg'),
                MovieTitleAndDescription()
              ],
            ),
          )
        ],
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

  Positioned backButton(BuildContext context) {
    return Positioned(
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_rounded,
              size: 40,
              color: kSecondaryColor,
              shadows: [kShadow],
            )));
  }
}

class MovieTitleAndDescription extends StatelessWidget {
  MovieTitleAndDescription({
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
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10),
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            Text(
              'Black Panther: Wakanda \nForever',
              style: blackTextStyle.copyWith(letterSpacing: -1),
            ),
            const SizedBox(
              height: 5.0,
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
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Container(
                  padding: item == 'SU' ? const EdgeInsets.all(2.0) : null,
                  decoration: item == 'SU'
                      ? BoxDecoration(
                          color: kBlackColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5.0))
                      : null,
                  child: Text(
                    item,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, letterSpacing: -1),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Column movieDescriptionTitles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: movieDescriptionContent.keys
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  item,
                  style:
                      greyTextStyle.copyWith(fontSize: 14, letterSpacing: -1),
                ),
              ))
          .toList(),
    );
  }
}
