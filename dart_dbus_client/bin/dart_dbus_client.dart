import 'dart:developer';

import 'package:dbus/dbus.dart';

const serviceName =
    'de.snapp.ServoControllerService'; // D-Bus service name for the servo controller.
const objectPath =
    '/ServoController'; // D-Bus object path for the servo controller.
const interfaceName =
    'de.snapp.ServoControllerInterface'; // D-Bus interface name for the servo controller.

Future<void> main(List<String> arguments) async {
  // TODO 1: The first step is to create a DBus client.
  //         This client will connect to the session bus, which is a user-level message bus.
  //         Remember we used the session bus in the previous lesson. so We have to use the same bus here.
  // final DBusClient dBusClient = ...;

  // TODO 2: Now, we need to create a reference to the remote object on the D-Bus.
  //         This object represents the service we're communicating with.
  //         Use `DBusRemoteObject` and pass in the client, service name, and object path.
  //         Assign it to a variable like `remoteObject`.
  // final DBusRemoteObject remoteObject = ...;

  // TODO 3: Next, we want to call the 'GetMotorState' method we defined in our python service.
  //         This method will return the current state of the motor.
  //         To do this, you can use [callMethod] method on the `remoteObject`.
  //         We need to have the same method signature as the one we defined in the service.
  //         The method signature should be 's' (for a string return value).
  //         After calling, assign the result to a variable like `getStateResponse`.
  // final getStateResponse = await remoteObject.callMethod(
  //   interfaceName, // The interface name we defined in the python service.
  //   'MethodNameInOurService',
  //   [],
  //   replySignature: DBusSignature('s'),
  // );

  // TODO 4: Once we have the response, we should log the results.
  //         Use `log()` to print the response values and their types to the console.
  // log(
  //   'response | ${getStateResponse.values}',
  //   name: 'GetMotorState',
  // );
  // log(
  //   'response value type | ${getStateResponse.values.first.toNative().runtimeType}',
  //   name: 'GetMotorState',
  // );
  // log(
  //   'response value | ${getStateResponse.values.first.toNative()}',
  //   name: 'GetMotorState',
  // );

  await Future.delayed(const Duration(seconds: 3));

  // TODO 5: Next, let's control the motor by calling the 'ThrottleMotor' method we defined in our python service.
  //         This method takes two parameters: duration and throttle, both as double values.
  //         Use `remoteObject.callMethod()` to call this method.
  //         The method signature should be 'b' (for a boolean return value).
  //         After calling, assign the result to a variable like `throttleMotorResponse`.
  // final throttleMotorResponse = await remoteObject.callMethod(
  //   interfaceName, // The interface name we defined in the python service.
  //   'MethodNameInOurService',
  //   [
  //     DBusDouble(1), // Duration of 1 second.
  //     DBusDouble(0.5), // Throttle set to 50%.
  //   ],
  //   replySignature: DBusSignature('b'),
  // );

  // TODO 6: After receiving the response from the 'ThrottleMotor' method, log the results.
  //         Use `log()` to print the response values and their types to the console.
  // log(
  //   'response | ${throttleMotorResponse.values}',
  //   name: 'ThrottleMotor',
  // );
  // log(
  //   'response value type | ${throttleMotorResponse.values.first.toNative().runtimeType}',
  //   name: 'ThrottleMotor',
  // );
  // log(
  //   'response value | ${throttleMotorResponse.values.first.toNative()}',
  //   name: 'ThrottleMotor',
  // );

  // log('We are done');
}
