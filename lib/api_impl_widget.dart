import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/news_item.dart';
import 'package:news_app/provider/change_id_provider.dart';
import 'package:news_app/serves/api_manager.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ApiImplWidget extends StatelessWidget {
  ApiImplWidget({required this.categoryname, super.key});
 String categoryname;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeIdProvider(),
      builder: (context, child) {
        var provider = Provider.of<ChangeIdProvider>(context);
        return FutureBuilder<SourceResponse>(
          future: ApiManager.getSources(category: categoryname),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("error : ${snapshot.error}");
            } else {
              var data = snapshot.data?.sources ?? []; // the responsed data 
              return Column(
                children: [
                  DefaultTabController(
                      initialIndex: provider.selectedIndex,
                      length: data.length,
                      child: TabBar(
                          onTap: (value) {
                            provider.changeIndex(value);
                          },
                          labelColor: const Color(0xff171717),
                          dividerColor: Colors.transparent,
                          isScrollable: true,
                          indicatorColor: const Color(0xff171717),
                          tabs: data
                              .map(
                                (element) => Tab(text: element.name)
                                )
                              .toList())),
                  Expanded(
                    child: FutureBuilder(
                        future: ApiManager.getNewsData(
                            data[provider.selectedIndex].id ?? ""),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text("error : ${snapshot.error}"));
                          } else {
                            var newsData = snapshot.data?.articles ?? [];
                            if(newsData.isEmpty){
                              return Center(child: Text("No Data Found",style: Theme.of(context).textTheme.titleMedium,));
                            }
                            return ListView.builder(
                              itemCount: newsData.length,
                              itemBuilder: (context, index) {
                                return NewsItem(articles: newsData[index]);
                              },
                            );
                          }
                        }),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
