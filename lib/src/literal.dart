void _toLiteral(dynamic obj, StringBuffer builder) {
  switch (obj) {
    case null:
      builder.write('null');
    case num n:
      builder.write(n);
    case bool b:
      builder.write(b);
    case String s:
      _toStringLiteral(s, builder);
    case List<dynamic> l:
      _toListLiteral(l, builder);
    case Map<dynamic, dynamic> m:
      _toMapLiteral(m, builder);
    default:
      throw FormatException('Unsupported type: $obj');
  }
}

void _toListLiteral(List<dynamic> l, StringBuffer builder) {
  builder.write('[');
  for (int i = 0; i < l.length; i++) {
    if (i > 0) {
      builder.write(', ');
    }
    _toLiteral(l[i], builder);
  }
  builder.write(']');
}

void _toMapLiteral(Map<dynamic, dynamic> m, StringBuffer builder) {
  builder.write('{');
  var keys = m.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    if (i > 0) {
      builder.write(', ');
    }
    _toLiteral(keys[i], builder);
    builder.write(': ');
    _toLiteral(m[keys[i]], builder);
  }
  builder.write('}');
}

final Pattern dqPattern = RegExp(r'[\r\n\t\\"]');
final Pattern sqPattern = RegExp(r"[\r\n\t\\']");

void _toStringLiteral(String s, StringBuffer builder) {
  bool containsDoubleQuote = s.contains('"');
  bool containsSingleQuote = s.contains("'");
  bool containsDollar = s.contains(r'$');
  bool useDoubleQuote = !containsDoubleQuote || containsSingleQuote;
  var escPattern = useDoubleQuote ? dqPattern : sqPattern;
  String wrapper = useDoubleQuote ? '"' : "'";
  if (containsDollar) {
    builder.write('r');
  }
  builder.write(wrapper);
  int curr = 0;
  while (curr < s.length) {
    int next = s.indexOf(escPattern, curr);
    if (next == -1) {
      builder.write(s.substring(curr));
      curr = s.length;
    } else {
      builder.write(s.substring(curr, next));
      switch (s[next]) {
        case '"':
          builder.write(r'\"');
        case "'":
          builder.write(r"\'");
        case '\n':
          builder.write(r'\n');
        case '\r':
          builder.write(r'\r');
        case '\t':
          builder.write(r'\t');
        case '\\':
          builder.write(r'\\');
      }
      curr = next + 1;
    }
  }
  builder.write(wrapper);
}

String toLiteral(dynamic obj) {
  var stringBuffer = StringBuffer();
  _toLiteral(obj, stringBuffer);
  return stringBuffer.toString();
}
