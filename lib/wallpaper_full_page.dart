import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WallpaperFullPage extends StatelessWidget {
  late String fullUrl;
  WallpaperFullPage({required this.fullUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Image.network(
          fullUrl,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple,
                    colors: const [Colors.deepOrange],
                    strokeWidth: 3,
                    pathBackgroundColor: Colors.deepOrange));
          },
          errorBuilder: (context, error, stackTrace) =>
              const Text('Some errors occurred!!'),
        ),
      ),
    );
  }
}
