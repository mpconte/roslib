// Copyright (c) 2019 Conrad Heidebrecht.

import 'package:roslib/roslib.dart';
import 'package:test/test.dart';

void main() {
  Ros? ros;

  setUp(() {
    ros = Ros(url: 'incorrect.url:9090');
    ros!.connect();
  });

  tearDown(() {
    ros!.close();
  });

  test('checks ROS websocket', () {
    expect(ros!.statusStream, isNotNull);
    expect(ros!.status, Status.ERRORED);
  });
}
