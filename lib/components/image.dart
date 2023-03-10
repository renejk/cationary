import 'package:cached_network_image/cached_network_image.dart';
import 'package:cationary/models/cat_model.dart';
import 'package:cationary/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget {
  final Cat cat;
  final bool isBig;
  const ImageWidget({super.key, required this.cat, this.isBig = false});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel =
        Provider.of<HomeViewModel>(context, listen: false);

    return FutureBuilder(
        future: homeViewModel.getUrlPrincipalImage(cat.referenceImageId),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data is Map) {
            return SizedBox(
              height: isBig ? 350 : 250,
              width: isBig ? 350 : 250,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: snapshot.data['url'].toString(),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
