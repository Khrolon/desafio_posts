
import 'package:desafio_vitor/app/i18n/en_US/en_us_translation.dart';
import 'package:desafio_vitor/app/i18n/es_MX/es_mx_translation.dart';
import 'package:desafio_vitor/app/i18n/pt_BR/pt_br_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'es_mx': esMx,
    'pt_BR': ptBr
  };
}
