import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/core/utils/runtime_to_minutes.dart';

void main() {
  const testMinutes = 119;

  const expected = '1h 59m';

  test('should format the given minutes to the desired format.', () {
    final result = runTimeToMinutes(testMinutes);

    expect(result, equals(expected));
  });
}
