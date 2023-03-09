import 'package:cached_network_image/cached_network_image.dart';
import 'package:cationary/models/cat_model.dart';
import 'package:cationary/utils/text_style.dart';
import 'package:cationary/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardCatWidget extends StatelessWidget {
  const CardCatWidget({super.key, required this.cat});

  final Cat cat;
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel =
        Provider.of<HomeViewModel>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(15),
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(cat.name!, style: FontStyles.TITLE),
                    const Spacer(),
                    const Text('More...', style: FontStyles.TITLE),
                  ],
                ),
              ),
              FutureBuilder(
                  future:
                      homeViewModel.getUrlPrincipalImage(cat.referenceImageId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data is Map) {
                      return SizedBox(
                        height: 250,
                        width: 250,
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: snapshot.data['url'].toString(),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  }),
              Expanded(
                child: Row(
                  children: [
                    Text(cat.origin!, style: FontStyles.TITLE),
                    const Spacer(),
                    Text('Intelligence ${cat.intelligence!}',
                        style: FontStyles.TITLE),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
