import 'package:recase/recase.dart';

String capitalize(String text) {
  return text[0].toUpperCase() + text.substring(1);
}

String toClassName(String collectionName, [String qualifier = ""]) {
  return "${camelize(collectionName)}${qualifier}Dto";
}

String camelize(String text) {
  return text.pascalCase;
}

String lowerCamelize(String text) {
  return text.camelCase;
}
