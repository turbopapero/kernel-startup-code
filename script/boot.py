import sys
import subprocess

cmd = [
    'qemu-system-x86_64', 
    '-machine', 'microvm', 
    '-serial', 'stdio', 
    '-display', 'none', 
    '-kernel',  sys.argv[1]
]

try:
    subprocess.run(cmd)
except:
    print("Boot Process Terminated")
    
