import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(double value) {
    return "R\$ ${NumberFormat("#,##0.00", "pt_BR").format(value)}";
  }
}
