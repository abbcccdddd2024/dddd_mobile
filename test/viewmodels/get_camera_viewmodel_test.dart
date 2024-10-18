import 'package:flutter_test/flutter_test.dart';
import 'package:dddd_mobile/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('GetCameraViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
