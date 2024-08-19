
# * IMPORTANT *:
#
# Before we dive into writing the code, it's always helpful to look at an example.
# You can take a look at this example on GitHub:
# https://github.com/adafruit/Adafruit_CircuitPython_PCA9685/blob/main/examples/pca9685_servo.py
#
# This example will give you a general idea of how to use the PCA9685 to control servo motors.
# However, keep in mind that the example on GitHub is not specifically designed for continuous servo motors.
# Continuous servo motors require different handling since they can rotate indefinitely in either direction
# based on the throttle value, unlike standard servos that move to a specific angle.
#
# In the following steps, we'll guide you through setting up and controlling a continuous servo motor.

# TODO: 0. Make sure all the dependencies are installed on your machine [adafruit_motor,adafruit_pca9685]

import time  # Import time module to introduce delays in the program
import busio  # Import busio module to set up I2C communication
from adafruit_motor import servo  # Import servo module to control the servo motor
# Import PCA9685 module to interface with the PCA9685 PWM controller
from adafruit_pca9685 import PCA9685
from board import SCL, SDA  # Import specific pins SCL and SDA for I2C communication

# TODO 1: The first step in our project is to establish communication with our hardware.
#         We'll do this by enabling I2C communication using the specific SCL and SDA pins on the Raspberry Pi.
#         Initialize I2C by creating an I2C object with busio.I2C(SCL, SDA).

# TODO 2: Now that we have I2C communication set up, we need to control our servo motor using a PWM signal.
#         To do this, we'll create an instance of the PCA9685 class, which will manage the PWM signals for us.
#         Instantiate PCA9685 using the I2C object we just created.

# TODO 3: Servos typically run on a PWM signal with a frequency of 50Hz.
#         Let's set the frequency of our PCA9685 instance to 50Hz to match the requirements of most servos.

# TODO 4: Great! Now we need to tell our PCA9685 which specific channel we want to control.
#         We'll create a ContinuousServo object on channel 0 of the PCA9685.
#         This servo will be able to rotate continuously based on the commands we send.

# TODO 5: Let's make the servo motor spin!
#         We'll set the throttle of the servo to 1.0, which will make it rotate at full speed in the forward direction.
#         Remember, the throttle value can range from -1.0 (full reverse) to 1.0 (full forward).

# TODO 6: We want to keep the servo running for a short while so we can observe its movement.
#         Let's introduce a delay of 3 seconds using time.sleep(3) to allow the servo to run at full speed.

# TODO 7: Now that we've seen the servo in action, it's time to stop it.
#         We'll set the throttle to 0.0 to stop the servo's movement completely.

# TODO 8: To make sure the stop command is fully processed, we'll add a brief delay of 0.1 seconds using time.sleep(0.1).
#         This small delay ensures everything is in sync.

# TODO 9: Finally, let's clean up after ourselves by deinitializing the PCA9685.
#         This step is important because it frees up resources and resets the hardware, preparing it for future use.
#         Call the deinit() method on the PCA9685 instance to clean up.

