import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:test/test.dart';

void main() {
  group('GeopointDto', () {
    test('fromJson', () {
      final json = {'lon': 50, 'lat': 25};

      final dto = GeopointDto.fromJson(json);

      expect(dto.lon, 50);
      expect(dto.lat, 25);
    });

    test('toJson', () {
      final dto = GeopointDto(lat: 25, lon: 50);

      final json = dto.toJson();

      expect(json['lat'], 25);
      expect(json['lon'], 50);
    });
  });
}
