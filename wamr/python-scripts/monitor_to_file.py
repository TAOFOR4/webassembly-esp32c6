import subprocess
import sys

def monitor_to_file(output_file, max_lines=1500):
    with open(output_file, "w") as file:
        # Run idf.py monitor and capture both stdout and stderr
        process = subprocess.Popen(["idf.py", "monitor"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        # Initialize line counter
        line_count = 0

        # Read the output line by line and write to file until max_lines is reached
        for line in iter(process.stdout.readline, ''):
            sys.stdout.write(line)  # Optional: prints to terminal in real-time
            file.write(line)
            line_count += 1
            if line_count >= max_lines:
                break  # Stop reading lines after reaching max_lines

        process.stdout.close()
        process.terminate()  # Gracefully terminate the process
        # process.kill()  # Use kill() if terminate() does not stop the process
        process.wait()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <output_file>")
        sys.exit(1)
    monitor_to_file(sys.argv[1])
