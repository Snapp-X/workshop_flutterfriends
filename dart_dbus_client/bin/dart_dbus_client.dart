import 'dart:developer';

import 'package:dbus/dbus.dart';

const serviceName =
    'de.snapp.ServoControllerService'; // D-Bus service name for the servo controller.
const objectPath =
    '/ServoController'; // D-Bus object path for the servo controller.
const interfaceName =
    'de.snapp.ServoControllerInterface'; // D-Bus interface name for the servo controller.

Future<void> main(List<String> arguments) async {
  // Create a D-Bus client that connects to the session bus (user-level message bus).
  final DBusClient dBusClient = DBusClient.session();

  // Create a reference to the remote object on the D-Bus using the service name and object path.
  final DBusRemoteObject remoteObject = DBusRemoteObject(
    dBusClient,
    name: serviceName,
    path: DBusObjectPath(objectPath),
  );

  // Call the 'ThrottleMotor' method on the remote D-Bus object to control the motor's throttle.
  // The method is expected to return a boolean ('b' in D-Bus signature).
  final throttleMotorResponse = await remoteObject.callMethod(
    interfaceName,
    'ThrottleMotor',
    [
      DBusDouble(1),
      DBusDouble(0.5),
    ],
    replySignature: DBusSignature('b'),
  );

  log(
    'response | ${throttleMotorResponse.values}',
    name: 'ThrottleMotor',
  );
  log(
    'response value type | ${throttleMotorResponse.values.first.toNative().runtimeType}',
    name: 'ThrottleMotor',
  );
  log(
    'response value | ${throttleMotorResponse.values.first.toNative()}',
    name: 'ThrottleMotor',
  );

  log('We are done');
}
