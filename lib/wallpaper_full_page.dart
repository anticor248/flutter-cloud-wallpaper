import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WallpaperFullPage extends StatelessWidget {
  late String fullUrl;
  WallpaperFullPage({required this.fullUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Flutter Cloud Wallpaper')),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        child: Image.network(
          fullUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple,
                    colors: [Colors.deepOrange],
                    strokeWidth: 2,
                    pathBackgroundColor: Colors.deepOrange));
          },
          errorBuilder: (context, error, stackTrace) =>
              const Text('Some errors occurred!!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //
        //TODO Download and other buttons here

        onPressed: () {},

        child: const Icon(Icons.downloading),
      ),
    );
  }
}
