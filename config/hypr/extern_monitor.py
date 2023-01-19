import subprocess
import json

if __name__ == "__main__":
    result: list = json.loads(subprocess.run(['hyprctl', '-j', 'monitors'], 
                                            capture_output=True).stdout.decode('utf-8')) 
    count: int = 0
    for item in result:
        count += 1

    match count:
        case 1:
            subprocess.run([
                           'hyprctl',
                           'keyword',
                           'monitor',
                           'eDP-1,1920x1080@144,0x0,1'])
        case 2:
            subprocess.run([
                           'hyprctl',
                           'keyword',
                           'monitor',
                           'DP-1,2560x1080@60,0x0,1'])
            subprocess.run([
                           'hyprctl',
                           'keyword',
                           'monitor',
                           'eDP-1,1920x1080@144,2560x0,1'])
