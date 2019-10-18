@ECHO OFF

display_jit_information() {
    @ECHO Starting Flashing Now
    @ECHO.
    @ECHO ========================================>>
    @ECHO.
}

set_system_env() {
    PATH=%PATH%;"%SYSTEMROOT%\System32"
}

start_flash() {
    fastboot flash boot boot.img
    fastboot flash cache cache.img
    fastboot flash recovery recovery.img
    fastboot flash system system.img
    fastboot flash vendor vendor.img
}

fastboot_reboot() {
    fastboot reboot
}

process_exit() {
    echo Press any key to exit...
    pause >nul
    exit
}

main() {
    display_jit_information()
    set_system_env()
    start_flash()
    fastboot_reboot()
    process_exit()
}

main


