# Try to run this script with the following command:
# python3 servo_controller.py

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

        self.i2c = busio.I2C(SCL, SDA)

        self.pca = PCA9685(self.i2c)
        self.pca.frequency = 50

        self.servo = servo.ContinuousServo(self.pca.channels[0])

    @dbus.service.method("de.snapp.ServoControllerInterface",
                         in_signature='dd', out_signature='b')
    def ThrottleMotor(self, duration, throttle):
        try:
            print("ThrottleMotor request:", session_bus.get_unique_name())
            print("Duration:", duration)
            print("Throttle:", throttle)

            # Set the throttle
            self.servo.throttle = throttle

            # Sleep for the specified duration
            time.sleep(duration)

            # Stop the motor
            self.servo.throttle = 0.0

            # Briefly sleep to ensure the stop command is processed
            time.sleep(0.1)

            return True
        except Exception as e:
            # Log the exception
            print(f"Error in ThrottleMotor: {e}")

            # Return False to indicate failure
            return False

    @dbus.service.method("de.snapp.ServoControllerInterface",
                         in_signature='', out_signature='')
    def Exit(self):
        self.pca.deinit()
        mainloop.quit()


if __name__ == '__main__':
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

    session_bus = dbus.SessionBus()
    name = dbus.service.BusName("de.snapp.ServoControllerService", session_bus)
    controller = ServoController(session_bus, '/ServoController')

    # Run the main loop
    mainloop = GLib.MainLoop()
    print(usage)

    mainloop.run()
