import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/models/motel_model.dart';
import 'package:guia_de_moteis/models/suite_model.dart';
import 'package:guia_de_moteis/models/period_model.dart';
import 'package:guia_de_moteis/models/item_category_model.dart';

void main() {
  group('Motel Model', () {
    test('Deve criar uma instância de Motel corretamente', () {
      final motel = Motel(
        fantasyName: "Motel Teste",
        logo:
            "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        neighborhood: "Bairro Teste",
        distance: 5.5,
        qtyFavorites: 10,
        suites: [],
        quantityAssessments: 50,
        media: 4.2,
      );

      expect(motel.fantasyName, "Motel Teste");
      expect(motel.logo,
          "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif");
      expect(motel.neighborhood, "Bairro Teste");
      expect(motel.distance, 5.5);
      expect(motel.qtyFavorites, 10);
      expect(motel.suites, isEmpty);
      expect(motel.quantityAssessments, 50);
      expect(motel.media, 4.2);
    });

    test('Deve converter JSON para Motel corretamente', () {
      final json = {
        "fantasia": "Motel Teste",
        "logo":
            "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        "bairro": "Bairro Teste",
        "distancia": 5.5,
        "qtdFavoritos": 10,
        "qtdAvaliacoes": 50,
        "media": 4.2,
        "suites": [
          {
            "nome": "Suíte Luxo",
            "qtd": 2,
            "exibirQtdDisponiveis": true,
            "fotos": [
              "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg"
            ],
            "categoriaItens": [
              {
                "nome": "Ar-Condicionado",
                "icone":
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
              }
            ],
            "periodos": [
              {
                "tempoFormatado": "2 horas",
                "tempo": "2",
                "valor": 100.0,
                "valorTotal": 90.0,
                "temCortesia": false,
                "desconto": 10.0
              }
            ]
          }
        ]
      };

      final motel = Motel.fromJson(json);

      expect(motel.fantasyName, "Motel Teste");
      expect(motel.logo,
          "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif");
      expect(motel.neighborhood, "Bairro Teste");
      expect(motel.distance, 5.5);
      expect(motel.qtyFavorites, 10);
      expect(motel.quantityAssessments, 50);
      expect(motel.media, 4.2);
      expect(motel.suites.length, 1);
      expect(motel.suites.first.name, "Suíte Luxo");
    });
  });

  group('Suite Model', () {
    test('Deve converter JSON para Suite corretamente', () {
      final json = {
        "nome": "Suíte Luxo",
        "qtd": 2,
        "exibirQtdDisponiveis": true,
        "fotos": [
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg"
        ],
        "categoriaItens": [
          {
            "nome": "Internet Wi-Fi",
            "icone":
                "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
          }
        ],
        "periodos": [
          {
            "tempoFormatado": "2 horas",
            "tempo": "2",
            "valor": 100.0,
            "valorTotal": 90.0,
            "temCortesia": false,
            "desconto": 10.0
          }
        ]
      };

      final suite = Suite.fromJson(json);

      expect(suite.name, "Suíte Luxo");
      expect(suite.quantity, 2);
      expect(suite.displayAvailableQty, isTrue);
      expect(suite.photos.length, 1);
      expect(suite.photos.first,
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg");
      expect(suite.items.length, 1);
      expect(suite.items.first.name, "Internet Wi-Fi");
      expect(suite.periods.length, 1);
      expect(suite.periods.first.formattedtime, "2 horas");
    });
  });

  group('Period Model', () {
    test('Deve converter JSON para Period corretamente', () {
      final json = {
        "tempoFormatado": "2 horas",
        "tempo": "2",
        "valor": 100.0,
        "valorTotal": 90.0,
        "temCortesia": false,
        "desconto": 10.0
      };

      final period = Period.fromJson(json);

      expect(period.formattedtime, "2 horas");
      expect(period.time, "2");
      expect(period.value, 100.0);
      expect(period.totalValue, 90.0);
      expect(period.hasCourtesy, isFalse);
      expect(period.discount, 10.0);
    });
  });

  group('ItemCategoria Model', () {
    test('Deve converter JSON para ItemCategoria corretamente', () {
      final json = {
        "nome": "Internet Wi-Fi",
        "icone":
            "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
      };

      final itemCategoria = ItemCategoria.fromJson(json);

      expect(itemCategoria.name, "Internet Wi-Fi");
      expect(itemCategoria.icon,
          "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png");
    });
  });
}
