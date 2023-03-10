import 'package:cationary/models/cat_model.dart';
import 'package:cationary/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class DataDetailWidget extends StatelessWidget {
  final Cat cat;
  const DataDetailWidget({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(cat.description!),
          SizedBox(
              height:
                  MediaQuery.of(context).size.height * AppConstants.NEW_LINE),
          ItemDetail(title: 'Origin ', detail: cat.origin!),
          ItemDetail(title: 'Intelligence ', detail: '${cat.intelligence!}'),
          ItemDetail(title: 'Adaptability ', detail: '${cat.adaptability!}'),
          ItemDetail(title: 'Life Span ', detail: cat.lifeSpan!),
        ],
      ),
    );
  }
}

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    Key? key,
    required this.detail,
    required this.title,
  }) : super(key: key);

  final String detail;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * AppConstants.NEW_LINE),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
            const Spacer(),
            Text(detail),
            const Spacer(),
            const SizedBox.shrink()
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * AppConstants.NEW_LINE),
      ],
    );
  }
}
