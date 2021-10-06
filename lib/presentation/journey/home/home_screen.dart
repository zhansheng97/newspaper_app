import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newspaper_app/common/text_theme.dart';
import 'package:newspaper_app/di/get_it.dart';
import 'package:newspaper_app/presentation/bloc/headline_news/headline_news_bloc.dart';
import 'package:newspaper_app/presentation/bloc/new_list/news_list_bloc.dart';
import 'package:newspaper_app/presentation/bloc/search/search_bloc.dart';
import 'package:newspaper_app/presentation/journey/detail/detail_screen.dart';
import 'package:newspaper_app/presentation/journey/search/search_new_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HeadlineNewsBloc _headlineNewsBloc;
  late NewsListBloc _newsListBloc;
  late SearchBloc _searchNewsBloc;

  @override
  void initState() {
    _headlineNewsBloc = getItInstance<HeadlineNewsBloc>();
    _newsListBloc = getItInstance<NewsListBloc>();
    _searchNewsBloc = getItInstance<SearchBloc>();
    _headlineNewsBloc.add(HeadlineNewsLoadEvent());
    _newsListBloc.add(NewListLoadEvent(category: "all"));

    super.initState();
  }

  final String date = DateFormat("dd MMM, yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _headlineNewsBloc),
        BlocProvider(create: (context) => _newsListBloc),
        BlocProvider(create: (context) => _searchNewsBloc),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU"),
                        radius: 25,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        date,
                        style: PoppinsTextTheme.subTitleTextStyle,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          print("search");
                          showSearch(
                              context: context,
                              delegate:
                                  SearchNewsScreen(bloc: _searchNewsBloc));
                        },
                        icon: Icon(CupertinoIcons.search),
                      ),
                    ],
                  ),
                ),
                //* ---------------------------------
                //* Top Headline News
                //* ---------------------------------
                BlocBuilder<HeadlineNewsBloc, HeadlineNewsState>(
                  builder: (context, state) {
                    if (state is HeadlineNewsLoaded) {
                      var articles = state.articles.first;

                      return Container(
                        height: size.height * .5,
                        padding: EdgeInsets.only(
                          left: 16.0,
                          bottom: 10.0,
                          right: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Breaking News",
                              style: PoppinsTextTheme.bigHeadingTextStyle,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16.0),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: DetailScreen(
                                                articles: articles,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: CachedNetworkImage(
                                              imageUrl: articles.urlToImage ??
                                                  "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                                              fit: BoxFit.cover,
                                              height: 200,
                                              width: double.infinity,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 16.0,
                                                right: 16.0,
                                                top: 10.0,
                                                bottom: 15.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    articles.title ?? "",
                                                    style: PoppinsTextTheme
                                                        .secondHeadingTextStyle,
                                                    maxLines: 2,
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 12,
                                                          backgroundImage:
                                                              NetworkImage(
                                                            articles.urlToImage ??
                                                                "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          articles.author == ""
                                                              ? "No author"
                                                              : articles
                                                                  .author!,
                                                          style: PoppinsTextTheme
                                                              .subTitleTextStyle,
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          dateTimeFormat(articles
                                                              .publishedAt!),
                                                          style: PoppinsTextTheme
                                                              .subTitleTextStyle,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      height: size.height * .5,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
                //* ---------------------------------
                //* Category List Title
                SizedBox(
                  height: 55,
                  child: CategoryList(),
                ),
                //* ------------------------------------
                //* List of News BY Category
                //* ------------------------------------
                BlocBuilder<NewsListBloc, NewsListState>(
                  builder: (context, state) {
                    if (state is NewsListLoaded) {
                      var articles = state.articles;
                      return Container(
                        height: 400,
                        child: ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: DetailScreen(
                                          articles: articles[index],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                height: 120,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: CachedNetworkImage(
                                        imageUrl: articles[index].urlToImage ??
                                            "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                                        height: 120,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          Text(
                                            articles[index].title ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: PoppinsTextTheme
                                                .listTileHeadingTextStlye,
                                          ),
                                          Spacer(flex: 2),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.grey[600],
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    dateTimeFormat(
                                                        articles[index]
                                                            .publishedAt!),
                                                    style: PoppinsTextTheme
                                                        .subTitleTextStyle
                                                        .copyWith(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.timer,
                                                    color: Colors.grey[600],
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "10 min read",
                                                    style: PoppinsTextTheme
                                                        .subTitleTextStyle
                                                        .copyWith(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container(
                      height: 400,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<NewsListBloc>(context);

    return ListView.builder(
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryWidget(
          category: categoryList[index],
          onTap: () {
            setState(() {
              currentIndex = index;
            });
            bloc.add(
              NewListLoadEvent(
                category: categoryList[currentIndex],
              ),
            );
          },
          isSelected: index == currentIndex,
        );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String category;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryWidget({
    Key? key,
    required this.category,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? kPrimaryColor.withOpacity(0.7)
                    : Colors.transparent,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              category.capitalize(),
              style: GoogleFonts.poppins(
                color: isSelected
                    ? kPrimaryColor.withOpacity(0.9)
                    : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const categoryList = [
  "all",
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology"
];

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

String dateTimeFormat(String date) {
  String articleFullDate = date;
  String dateWithT =
      articleFullDate.substring(0, 10) + 'T' + articleFullDate.substring(11);
  DateTime dateTime = DateTime.parse(dateWithT);
  var articleDate = DateFormat("dd MMM, yyyy").format(dateTime);
  return articleDate;
}
