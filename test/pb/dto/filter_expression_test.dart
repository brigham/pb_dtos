import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'package:test/test.dart';

import '../../generated_sample/friends_dto.dart';

void main() {
  String render<D extends Dto<D>>(FilterExpression<D> expr) {
    var buffer = StringBuffer();
    expr.include(buffer);
    return buffer.toString();
  }

  group('And', () {
    test('empty', () {
      And<FriendsDto> emptyAnd = And([]);

      expect(render(emptyAnd), '1 = 1');
    });

    test('single', () {
      And<FriendsDto> singleAnd = And([
        FriendsDto.filter((f) => f..id().equal(.val('1'))).expression!,
      ]);

      expect(render(singleAnd), "id = '1'");
    });

    test('multiple', () {
      And<FriendsDto> singleAnd = And([
        FriendsDto.filter((f) => f..id().equal(.val('1'))).expression!,
        FriendsDto.filter((f) => f..id().equal(.val('2'))).expression!,
      ]);

      expect(render(singleAnd), "(id = '1' && id = '2')");
    });

    test('nested', () {
      And<FriendsDto> nestedAnd = And([
        FriendsDto.filter((f) => f..id().equal(.val('1'))).expression!,
        And([
          FriendsDto.filter((f) => f..id().equal(.val('2'))).expression!,
          FriendsDto.filter((f) => f..id().equal(.val('3'))).expression!,
        ]),
      ]);

      expect(render(nestedAnd), "(id = '1' && id = '2' && id = '3')");
    });
  });

  group('Or', () {
    test('empty', () {
      Or<FriendsDto> emptyOr = Or([]);

      expect(render(emptyOr), '1 = 0');
    });

    test('single', () {
      Or<FriendsDto> singleOr = Or([
        FriendsDto.filter((f) => f..id().equal(.val('1'))).expression!,
      ]);

      expect(render(singleOr), "id = '1'");
    });

    test('multiple', () {
      Or<FriendsDto> singleOr = Or([
        FriendsDto.filter((f) => f..id().equal(.val('1'))).expression!,
        FriendsDto.filter((f) => f..id().equal(.val('2'))).expression!,
      ]);

      expect(render(singleOr), "(id = '1' || id = '2')");
    });

    test('nested', () {
      Or<FriendsDto> nestedOr = Or([
        FriendsDto.filter((f) => f..id().equal(.val('1'))).expression!,
        Or([
          FriendsDto.filter((f) => f..id().equal(.val('2'))).expression!,
          FriendsDto.filter((f) => f..id().equal(.val('3'))).expression!,
        ]),
      ]);

      expect(render(nestedOr), "(id = '1' || id = '2' || id = '3')");
    });
  });
}
