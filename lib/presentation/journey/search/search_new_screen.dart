import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper_app/common/text_theme.dart';
import 'package:newspaper_app/presentation/bloc/search/search_bloc.dart';
import 'package:newspaper_app/presentation/journey/detail/detail_screen.dart';
import 'package:newspaper_app/presentation/journey/home/home_screen.dart';

class SearchNewsScreen extends SearchDelegate {
  final SearchBloc bloc;

  SearchNewsScreen({required this.bloc});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          //2
          color: query.isEmpty ? Colors.grey : kPrimaryColor,
        ),
        //3
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    bloc.add(SearchNewsEvent(searchParams: query));

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is SearchNewsLoaded) {
          var articles = state.articles;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              articles[index].title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: PoppinsTextTheme.listTileHeadingTextStlye,
                            ),
                            Spacer(flex: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey[600],
                                      size: 16,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      dateTimeFormat(
                                          articles[index].publishedAt!),
                                      style: PoppinsTextTheme.subTitleTextStyle
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: Colors.grey[600],
                                      size: 16,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "10 min read",
                                      style: PoppinsTextTheme.subTitleTextStyle
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
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is SearchNewsLoaded) {
          var articles = state.articles;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              articles[index].title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: PoppinsTextTheme.listTileHeadingTextStlye,
                            ),
                            Spacer(flex: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey[600],
                                      size: 16,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      dateTimeFormat(
                                          articles[index].publishedAt!),
                                      style: PoppinsTextTheme.subTitleTextStyle
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: Colors.grey[600],
                                      size: 16,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "10 min read",
                                      style: PoppinsTextTheme.subTitleTextStyle
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
          );
        }
        return Container();
      },
    );
  }
}
