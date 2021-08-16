import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:madtube/model/Video.dart';

const TK = "SUA_CHAVE";
const ID_CANAL = "UCOa-WaNwQaoyFHLCDk7qKIw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Api();

  Future<List<Video>> pesquisar(String pesquisa) async {
    List<Video> videos = [];
    http.Response response = await http.get(Uri.parse(
        URL_BASE+"search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$TK"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    ));

    if (response.statusCode == 200) {

      Map<String, dynamic> dadosJson = jsonDecode(response.body);
      videos = dadosJson["items"].map<Video>(
          (map) {
            return Video.fromJson(map);
          }
      ).toList();

    } else {

    }
    return videos;
  }


}