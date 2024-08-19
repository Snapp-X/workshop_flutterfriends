#!/usr/bin/env python3

from __future__ import print_function
from datetime import datetime, timezone
from gi.repository import GLib
from board import SCL, SDA

import dbus
import dbus.service
import dbus.mainloop.glib
import time
import busio

from adafruit_motor import servo
from adafruit_servokit import ServoKit
from adafruit_pca9685 import PCA9685

usage = """
ServoController DBus Service Started Successfully

Now we just need to wait for the client to call our methods :) 
"""


class ServoController(dbus.service.Object):
    """ Python class to control the servo motors using PCA9685"""

    def __init__(self, bus, path):
        super(ServoController, self).__init__(bus, path)

        # TODO 1: First, set up I2C communication. You'll need to initialize the I2C object using the busio module
        #         with the SCL and SDA pins. This will allow your Raspberry Pi to communicate with the PCA9685.
        #         Remember to assign it to an instance variable like `self.i2c`.
        # self.i2c = ...

        # TODO 2: Now, create an instance of the PCA9685 class using the I2C communication you've set up.
        #         This instance will handle PWM signals required for controlling the servo motors.
        #         Assign it to an instance variable like `self.pca`.
        # self.pca = ...

        # TODO 3: Set the PWM frequency of your PCA9685 instance to 50Hz, which is what most servos require.
        #         Use `self.pca.frequency` to set this value.
        # self.pca.frequency = 50

        # TODO 4: Next, create a ContinuousServo object. This will be used to control the continuous rotation servo.
        #         You'll need to specify the channel (e.g., channel 0) on which the servo is connected.
        #         Assign it to an instance variable like `self.servo`.
        # self.servo = ...

    # TODO 5: Implement the GetMotorState method.
    #         This method should return the current throttle value of the servo.
    #         Remember to use the appropriate DBus decorator to define the method's signature.
    #         Follow this structure:
    #
    #         @dbus.service.method("your.dbus.interface.name",
    #                              in_signature='', out_signature='s')
    #         def MethodName(self):
    #             # Implement the logic to return the desired information as a string.
    #             # For example, you might want to return the current state of a variable.
    #             return str(self.some_variable)
    #
    #         Instructions:
    #         - Replace "your.dbus.interface.name" with the appropriate DBus interface name. like "de.snapp.ServoControllerInterface".
    #         - Choose a meaningful method name instead of "MethodName" like GetMotorState.
    #         - Ensure the method returns the correct data.

    # TODO 6: Implement the ThrottleMotor method to control the servo's speed and duration.
    #
    #         Follow this structure:
    #
    #         @dbus.service.method("your.dbus.interface.name",
    #                              in_signature='dd', out_signature='b')
    #         def AnotherMethodName(self, param1, param2):
    #             try:
    #                 # Implement the logic to perform an action with the input parameters.
    #                 # For example, you might set a value and wait for a certain duration.
    #
    #
    #                 # Return True to indicate success.
    #                 return True
    #             except Exception as e:
    #                 print(f"Error : {e}")
    #                 return False
    #
    #         Instructions:
    #         - Replace "your.dbus.interface.name" with the same DBus interface name used in the GetMotorState method. "de.snapp.ServoControllerInterface".
    #         - Choose a meaningful method name instead of "AnotherMethodName" like ThrottleMotor.
    #         - Ensure the method performs the desired action and returns the appropriate type.

    @dbus.service.method("de.snapp.ServoControllerInterface",
                         in_signature='', out_signature='')
    def Exit(self):
        self.pca.deinit()
        mainloop.quit()


if __name__ == '__main__':
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

    # TODO 7: The first step in setting up DBus communication is to initialize the session bus.
    #         The session bus is a DBus communication channel that allows different applications to communicate.
    #         To do this, you can use `dbus.SessionBus()` and assign it to a variable like `session_bus`.
    # session_bus = ...

    # TODO 8: After initializing the session bus, you need to create a unique bus name for your service.
    #         This name is how other applications will identify and connect to your service.
    #         Use `dbus.service.BusName("your.unique.service.name", session_bus)` and assign it to a variable like `name`.
    #         Replace "your.unique.service.name" with an appropriate name, such as "de.snapp.ServoControllerService".
    # name = ...

    # TODO 9: Finally, create an instance of your `ServoController` class.
    #          You'll need to pass in the `session_bus` and a path object where your service will be accessible, such as '/ServoController'.
    #          Assign this instance to a variable like `controller`.
    # controller = ...

    # Run the main loop
    mainloop = GLib.MainLoop()
    print(usage)

    mainloop.run()
