import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/api_constants.dart';
import '../models/motel_model.dart';

class MotelService {
  final http.Client client;

  MotelService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Motel>> fetchMoteis() async {
    final url = Uri.parse('${ApiConstants.baseURL}/b/1IXK');

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('data') && data['data'].containsKey('moteis')) {
          final List<dynamic> moteisJson = data['data']['moteis'];
          return moteisJson.map((json) => Motel.fromJson(json)).toList();
        } else {
          throw Exception("Formato inesperado da resposta");
        }
      } else {
        throw Exception(
            'Erro ao buscar motéis. Código: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao carregar motéis: $e');
    }
  }
}
