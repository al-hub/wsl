REM for pulseaudio
REM https://token2shell.com/howto/x410/enabling-sound-in-wsl-ubuntu-let-it-sing/
REM https://community.mycroft.ai/t/experimental-mycroft-on-wsl-with-pulseaudio/5464
REM https://wiki.ubuntu.com/WSL
start "" /B "C:\wsl\pulseaudio-1.1\bin\pulseaudio.exe"

REM for xlaunch.exe (vcxsrv.exe)
"C:\Program Files\VcXsrv\xlaunch.exe"

ubuntu.exe

taskkill /IM vcxsrv.exe /F

taskkill /IM pulseaudio.exe /F