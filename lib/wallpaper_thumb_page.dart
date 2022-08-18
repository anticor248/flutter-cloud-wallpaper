import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app_complete/wallpaper_full_page.dart';

import 'model_json.dart';
import 'service_json.dart';
import 'wallpaper_full_page.dart';

class WallpapersThumbPage extends StatefulWidget {
  const WallpapersThumbPage({Key? key}) : super(key: key);

  @override
  State<WallpapersThumbPage> createState() => _WallpapersThumbPageState();
}

class _WallpapersThumbPageState extends State<WallpapersThumbPage> {
  UserJsonService _jsonService = UserJsonService();

  List<UsersModelJsonData?> usersJsonData = [];
  @override
  void initState() {
    super.initState();

    _jsonService.fetchUsersJson().then((value) {
      setState(() {
        if (value != null && value.data != null) {
          usersJsonData = value.data!;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          child: GridView.builder(
            itemCount: usersJsonData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (contex) => WallpaperFullPage(
                          fullUrl: usersJsonData[index]!.url!),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                      usersJsonData[index]!.thumbUrl!,
                    ),
                  ),
                ),
              );
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          ),
        ),
      ),
    );
  }
}
