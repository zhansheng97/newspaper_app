import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newspaper_app/common/text_theme.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';
import 'package:newspaper_app/presentation/journey/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final NewsEntity articles;

  const DetailScreen({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* ---------------------
                //* App Bar
                //* ---------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomIconButton(
                      icon: Icons.link,
                      onTap: () async {
                        print(articles.url);
                        var url = articles.url!;
                        if (await canLaunch(url)) {
                          await launch(url, forceWebView: true);
                        } else {
                          print("cant load");
                          print(articles.url);
                        }
                      },
                    ),
                  ],
                ),

                //* -------------------------------
                //* Big Image for Article
                //* -------------------------------

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.0),
                    child: CachedNetworkImage(
                      imageUrl: articles.urlToImage ??
                          "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                      height: size.height * .3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Text(
                  articles.title ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          articles.urlToImage ??
                              "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        articles.author == "" ? "No Author" : articles.author!,
                        style: PoppinsTextTheme.subTitleTextStyle,
                      ),
                      Spacer(),
                      Text(
                        dateTimeFormat(articles.publishedAt!),
                        style: PoppinsTextTheme.subTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                Text(
                  articles.description ?? "",
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: kPrimaryColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.3),
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: onTap,
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
