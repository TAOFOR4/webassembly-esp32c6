import serial
import time
import re

# Configuration
serial_port = '/dev/ttyUSB0'
baud_rate = 115200
output_file = 'execution_times.txt'
read_timeout = 60  # Adjust as needed based on execution duration
# Adjusted regex pattern to match the new output format
execution_time_pattern = re.compile(r'I \(\d+\) wamr: Execution time: (\d+) microseconds')

def capture_serial_output(port, baud, timeout, file_path):
    with serial.Serial(port, baud, timeout=1) as ser, open(file_path, 'w') as out_file:
        start_time = time.time()
        while True:
            if (time.time() - start_time) > timeout:
                print("Finished reading serial output.")
                break
            if ser.in_waiting > 0:
                # Attempt to decode each line without raising exceptions
                line = ser.readline().decode(errors='replace')
                # Search for execution time information in the line
                match = execution_time_pattern.search(line)
                if match:
                    execution_time = match.group(1)  # Extract the execution time
                    print(f"Execution time: {execution_time} microseconds")
                    out_file.write(f"Execution time: {execution_time} microseconds\n")

if __name__ == '__main__':
    capture_serial_output(serial_port, baud_rate, read_timeout, output_file)
