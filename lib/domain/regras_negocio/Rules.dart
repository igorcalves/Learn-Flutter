import 'package:intl/intl.dart';

class DateFormatBR {
  static String dateFormat(String dataString) {
    // Converter a string para um objeto DateTime
    DateTime data = DateTime.parse(dataString);

    // Formatar a data no padrão brasileiro
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }
}
