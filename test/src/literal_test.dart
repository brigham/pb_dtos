import 'package:pb_dtos/src/literal.dart';
import 'package:test/test.dart';

void main() {
  group('bool', () {
    test('true', () {
      expect(toLiteral(true), 'true');
    });
    test('false', () {
      expect(toLiteral(false), 'false');
    });
  });

  group('num', () {
    test('0', () {
      expect(toLiteral(0), '0');
    });
    test('1', () {
      expect(toLiteral(1), '1');
    });
    test('1.0', () {
      expect(toLiteral(1.0), '1.0');
    });
    test('-1', () {
      expect(toLiteral(-1), '-1');
    });
  });

  group('String', () {
    test('no specials', () {
      expect(toLiteral('foo bar'), '"foo bar"');
    });
    test('newline', () {
      expect(toLiteral('foo\nbar'), r'"foo\nbar"');
    });
    test('carriage return', () {
      expect(toLiteral('foo\rbar'), r'"foo\rbar"');
    });
    test('tab', () {
      expect(toLiteral('foo\tbar'), r'"foo\tbar"');
    });
    test('double quote', () {
      expect(toLiteral('foo"bar'), "'foo\"bar'");
    });
    test('single quote', () {
      expect(toLiteral("foo'bar"), '"foo\'bar"');
    });
    test('both quote types', () {
      expect(toLiteral("foo\"'bar"), '"foo\\"\'bar"');
    });
    test('dollar sign', () {
      expect(toLiteral('foo\$bar'), 'r"foo\$bar"');
    });
    test('backslash', () {
      expect(toLiteral('foo\\bar'), r'"foo\\bar"');
    });
  });

  test('List', () {
    expect(
      toLiteral([
        1,
        false,
        'abc',
        [2, true, 'def', <dynamic>[]],
      ]),
      '[1, false, "abc", [2, true, "def", []]]',
    );
  });

  test('Map', () {
    expect(
      toLiteral({
        'a': 1,
        'b': true,
        'c': 'abc',
        'd': [2, true, 'def', <dynamic>[]],
        1: 'e',
        2: false,
        true: 'f',
        ['g']: 'h',
        {'i': 3}: <dynamic>[],
      }),
      '{"a": 1, "b": true, "c": "abc", "d": [2, true, "def", []], 1: "e", 2: false, true: "f", ["g"]: "h", {"i": 3}: []}',
    );
  });
}
