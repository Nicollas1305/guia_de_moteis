import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/services/motel_services.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';
import 'package:guia_de_moteis/models/motel_model.dart';

import 'service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late MotelService service;

  setUp(() {
    mockClient = MockClient();
    service = MotelService(client: mockClient);
  });

  group('Servicerequests', () {
    test('Deve retornar uma lista de motéis ao receber um HTTP 200', () async {
      final mockResponse = json.encode({
        "data": {
          "moteis": [
            {
              "fantasia": "Motel Teste",
              "logo": "logo.png",
              "bairro": "Centro",
              "distancia": 1.5,
              "qtdFavoritos": 10,
              "suites": [],
              "qtdAvaliacoes": 5,
              "media": 4.5
            }
          ]
        }
      });

      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(mockResponse, 200),
      );

      final moteis = await service.fetchMoteis();

      expect(moteis, isA<List<Motel>>());
      expect(moteis.length, 1);
      expect(moteis.first.fantasyName, 'Motel Teste');
    });

    test('Deve lançar exceção quando a resposta tem um formato inesperado',
        () async {
      final mockResponse = json.encode({"invalid": "data"});

      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(mockResponse, 200),
      );

      expect(() => service.fetchMoteis(), throwsException);
    });

    test('Deve lançar exceção ao receber um erro HTTP', () async {
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response('Erro', 404),
      );

      expect(() => service.fetchMoteis(), throwsException);
    });

    test('Deve lançar exceção ao ocorrer um erro de conexão', () async {
      when(mockClient.get(any)).thenThrow(Exception('Falha na conexão'));

      expect(() => service.fetchMoteis(), throwsException);
    });
  });
}
