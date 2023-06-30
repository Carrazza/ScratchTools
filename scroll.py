import pyautogui
import time

# Define the Page Down key name
page_down = 'pagedown'

# Loop and press Page Down key every second until 'c' is pressed
while True:
    pyautogui.press(page_down)
    time.sleep(1)
    if 'c' in input():
        break
