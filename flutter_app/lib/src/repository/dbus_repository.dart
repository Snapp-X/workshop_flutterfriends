import 'package:dbus/dbus.dart';

class DBusRepository {
  const DBusRepository({required this.dataSource});

  final DBusDataSource dataSource;

  /// returns the state of the specified motor
  /// the [motorId] is the id of the motor to get its state
  Future<String> getMotorState() async {
    final response = await dataSource.getMotorState();

    final returnValue = response.returnValues[0];

    final parsedResult = returnValue.toNative();

    if (parsedResult is! String) {
      throw Exception('Invalid response type');
    }

    return parsedResult;
  }

  /// The motor will be throttled for the specified duration
  /// the [duration] is the duration in seconds
  ///
  /// returns a [bool] indicating if the operation was successful
  Future<bool> throttleMotor(
      {double duration = 0.5, double speed = 0.5}) async {
    final response = await dataSource.throttleMotor(duration, speed);

    final returnValue = response.returnValues[0];

    final parsedResult = returnValue.toNative();

    if (parsedResult is! bool) {
      throw Exception('Invalid response type');
    }

    return parsedResult;
  }
}

class DBusDataSource {
  const DBusDataSource({required this.client, required this.remoteObject});

  final DBusClient client;
  final DBusRemoteObject remoteObject;

  factory DBusDataSource.session() {
    final dBusClient = DBusClient.session();

    return DBusDataSource(
      client: dBusClient,
      remoteObject: DBusRemoteObject(
        dBusClient,
        name: 'de.snapp.ServoControllerService',
        path: DBusObjectPath('/ServoController'),
      ),
    );
  }

  Future<DBusMethodSuccessResponse> getMotorState() async {
    final response = await remoteObject.callMethod(
      'de.snapp.ServoControllerInterface',
      'GetMotorState',
      [],
      replySignature: DBusSignature('s'),
    );

    return response;
  }

  /// The motor will be throttled for the specified duration
  /// the [duration] is the duration in seconds
  ///
  /// returns a [bool] indicating if the operation was successful
  Future<DBusMethodSuccessResponse> throttleMotor(
    double duration,
    double speed,
  ) async {
    final response = await remoteObject.callMethod(
      'de.snapp.ServoControllerInterface',
      'ThrottleMotor',
      [
        DBusDouble(duration),
        DBusDouble(speed),
      ],
      replySignature: DBusSignature('b'),
    );

    return response;
  }

  /// Close the DBus python session
  Future<DBusMethodSuccessResponse> closeDBusSession() async {
    final response = await remoteObject.callMethod(
      'de.snapp.ServoControllerInterface',
      'Exit',
      [],
    );

    return response;
  }
}
