import subprocess
import re

# Configuration
project_path = '/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6'
output_file = 'memory_usage_measurements.txt'
num_runs = 1  # Adjust the number of runs as needed

def measure_memory_usage(project_path, output_file, num_runs):
    # Open the output file in append mode
    with open(output_file, 'w') as f:
        # Write a header to indicate the start of measurements
        f.write("Memory Usage Measurements:\n")
        
        # Loop for the specified number of runs
        for i in range(num_runs):
            # Navigate to the project directory
            cmd_cd = f'cd {project_path};'
            
            # Command to run idf.py size
            cmd_size = 'idf.py size'

            # Execute the command
            result = subprocess.run(cmd_cd + cmd_size, shell=True, capture_output=True, text=True)

            # Check if the command was successful
            if result.returncode != 0:
                print(f"Error running idf.py size in run {i + 1}: {result.stderr}")
                continue

            # Output from idf.py size
            output = result.stdout
            f.write(f"Run {i + 1}:\n")
            f.write(output)
            f.write('\n\n')

if __name__ == '__main__':
    measure_memory_usage(project_path, output_file, num_runs)
