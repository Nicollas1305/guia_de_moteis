import 'package:guia_de_moteis/models/item_category_model.dart';
import 'package:guia_de_moteis/models/motel_model.dart';
import 'package:guia_de_moteis/models/period_model.dart';
import 'package:guia_de_moteis/models/suite_model.dart';
import 'package:guia_de_moteis/services/motel_services.dart';
import 'package:http/http.dart' as http;

class FakeMotelService implements MotelService {
  @override
  http.Client get client => http.Client();
  @override
  Future<List<Motel>> fetchMoteis() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Motel(
        fantasyName: "Motel Paraiso",
        neighborhood: "Centro",
        distance: 10.0,
        qtyFavorites: 3,
        logo:
            "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        media: 4.5,
        quantityAssessments: 120,
        suites: [
          Suite(
            name: "Suite Master",
            quantity: 5,
            displayAvailableQty: true,
            photos: [
              "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
            ],
            items: [
              ItemCategoria(
                  name: "Frigobar",
                  icon:
                      "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"),
              ItemCategoria(
                  name: "Internet Wi-Fi",
                  icon:
                      "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"),
            ],
            periods: [
              Period(
                formattedtime: "2 horas",
                time: "2",
                value: 50.0,
                totalValue: 40.0,
                hasCourtesy: true,
                discount: 10.0,
              ),
              Period(
                formattedtime: "3 horas",
                time: "03:00:00",
                value: 60.0,
                totalValue: 60.0,
                hasCourtesy: false,
                discount: 0.0,
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
