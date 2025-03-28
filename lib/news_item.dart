import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_data_response.dart';
import 'package:news_app/web_view_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.articles});
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WebViewApp(url: articles.url!)),
            );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
             CachedNetworkImage(
              imageUrl: articles.urlToImage ?? "",
              height: 220,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
                 ),
              const SizedBox(
                height: 16,
              ),
              Text(
                articles.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(articles.author?.split(" ").first ?? ""),
                  Text("published at   ${articles.publishedAt?.substring(0,10) ?? ""} ")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
