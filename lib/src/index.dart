class Index {
  final String name;
  final bool unique;
  final String collection;
  final List<String> columns;

  Index({
    required this.name,
    required this.unique,
    required this.collection,
    required this.columns,
  });

  static final _regex = RegExp(
    r'create\s+(unique\s+)?index\s+[`"](\w+)[`"]\s+on\s+[`"](\w+)[`"]\s+\((.+)\)',
    caseSensitive: false,
    dotAll: true,
  );

  static Index? parse(String rawIndex) {
    final match = _regex.firstMatch(rawIndex);
    if (match == null) {
      return null;
    }

    final unique = match.group(1) != null;
    final name = match.group(2)!;
    final collection = match.group(3)!;
    final columnsRaw = match.group(4)!;
    final columns = columnsRaw
        .split(',')
        .map(
          (c) =>
              c.trim().split(' ').first.replaceAll('"', '').replaceAll('`', ''),
        )
        .toList();

    return Index(
      name: name,
      unique: unique,
      collection: collection,
      columns: columns,
    );
  }

  String toMarkdown() {
    final uniqueStr = unique ? ' (unique)' : '';
    return '**`$name`**$uniqueStr: `${columns.join('`, `')}`';
  }
}
