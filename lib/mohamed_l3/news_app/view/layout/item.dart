part of 'view.dart';

class LayoutItem extends StatelessWidget {
  const LayoutItem(this.article, {super.key});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(
          Uri.parse(article.url),
          mode: LaunchMode.externalApplication,
        )) {
          throw Exception('Could not launch ${article.url}');
        }
      },
      child: Directionality(
        textDirection: AppConsts.isArabic(article.title)
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: NewsColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              article.author,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            article.publishedAt,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
