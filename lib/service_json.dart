import 'dart:convert';

import 'package:flutter_wallpaper_app_complete/model_json.dart';
import 'package:http/http.dart' as http;

class UserJsonService {
  final String url =
      'https://raw.githubusercontent.com/anticor248/Json-Cloud-Wallpaper-Base/main/zixpo_files/flutter_cloud_wallpapers.json';

  Future<UsersModelJson?> fetchUsersJson() async {
    var resultJson = await http.get(Uri.parse(url));
    if (resultJson.statusCode == 200) {
      var jsonBody = UsersModelJson.fromJson(jsonDecode(resultJson.body));

      return jsonBody;
    } else {
      print('İstek Başarısız Oldu ==>> ${resultJson.statusCode}');
    }
  }
}
