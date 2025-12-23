import 'package:pb_dtos/src/strings.dart';
import 'package:test/test.dart';

void main() {
  test('toClassName', () {
    expect(toClassName('foo_bar'), 'FooBarDto');
    expect(toClassName('foo_bar', 'Expand'), 'FooBarExpandDto');
    expect(toClassName('Cat'), 'CatDto');
  });

  test('camelize', () {
    expect(camelize('foo_bar'), 'FooBar');
    expect(camelize(''), '');
  });

  test('lowerCamelize', () {
    expect(lowerCamelize('foo_bar'), 'fooBar');
    expect(camelize(''), '');
  });
}
