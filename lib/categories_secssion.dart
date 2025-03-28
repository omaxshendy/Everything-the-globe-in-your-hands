import 'package:flutter/material.dart';
class CategoriesSecssion extends StatelessWidget {
  CategoriesSecssion({required this.onTap,super.key});
   Function onTap;
  List<String> categories = [
    "general",
    "business",
    "sports",
    "health",
    "entertainment",
    "technology",
    "science",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning \n Here is Some News For You",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: (index % 2 == 0)
                      ? Alignment.bottomRight //another solution index.isEven
                      : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                            "assets/images/${categories[index]}.png")),
                    InkWell(
                      onTap: () {
                        onTap(categories[index]);
                      },
                      child: Container(
                          margin: const EdgeInsets.all(16),
                          padding: !index.isOdd ? const EdgeInsets.only(left: 5) :const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.white.withOpacity(
                                  .5) //Colors.grey.withOpacity(0.99),
                              ),
                          child: index.isEven
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "View All  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontWeight: FontWeight.w500),
                                    ),
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Text(
                                      "View All  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                    )
                  ],
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
