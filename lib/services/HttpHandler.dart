import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpHandler {

	final String _baseUrl = 'https://light-novels.herokuapp.com/api';

	Future<dynamic> getJson(String url) async
	{
		http.Response response = await http.get(_baseUrl + url);

		return jsonDecode(response.body);
	}

}
