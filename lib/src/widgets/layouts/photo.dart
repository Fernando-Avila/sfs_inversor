import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:sfs_inversor/src/global/environment.dart';

class FotoPerfil extends StatelessWidget {
  final dynamic image;
  final double size;
  const FotoPerfil({Key? key, this.image, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return image != null
        ? InkWell(
            onTap: () => showImageViewer(
                context, Image.asset('assets/img/imgprofileused.jpg').image,
                onViewerDismissed: () {}),
            child: ClipOval(
                child: Image.asset(
              'assets/img/imgprofileused.jpg',
              fit: BoxFit.cover,
            )))
        : ClipOval(child: Icon(Icons.person, size: size));
    ;
    /*  return image != null
        ? InkWell(
            onTap: () => showImageViewer(
                context,
                Image.network(
                  '${Enviroment.apiUrl}storage/${image}',
                  headers: const {
                    'content-type': 'application/json',
                    'accept': 'application/json',
                    "connection": "Keep-Alive",
                  },
                ).image,
                onViewerDismissed: () {}),
            child: ClipOval(
                child: CachedNetworkImage(
              httpHeaders: const {
                'content-type': 'application/json',
                'accept': 'application/json',
                "connection": "Keep-Alive",
              },
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              imageUrl: '${Enviroment.apiUrl}storage/${image}',
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorWidget: (context, url, progress) => Center(
                child: Icon(Icons.person, size: size),
              ),
            )))
        : ClipOval(child: Icon(Icons.person, size: size));*/
  }
}
