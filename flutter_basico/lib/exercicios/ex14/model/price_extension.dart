import 'package:intl/intl.dart';

extension PriceFormat on double {
  String priceFormatBRL() {
    var numberFormat =
        NumberFormat.currency(decimalDigits: 2, locale: 'pt_BR', symbol: 'R\$');
    return numberFormat.format(this);
  }

  String priceFormatUSD() {
    var numberFormat = NumberFormat.currency(
        decimalDigits: 2, locale: 'en_US', symbol: 'US\$');
    return numberFormat.format(this);
  }
}
