@echo off

set InstanceName=Alma-8

echo Installing %InstanceName%
"%InstanceName%.exe" install || EXIT /b 1
"%InstanceName%.exe" run cat /etc/almalinux-release

echo.
echo.
echo Creating user %USERNAME%
"%InstanceName%.exe" run adduser -G wheel "%USERNAME%"

echo.
echo.
echo Upgrading installed software
"%InstanceName%.exe" run yum update --quiet --assumeyes

echo.
echo.
echo Checking %InstanceName% version
"%InstanceName%.exe" run cat /etc/almalinux-release

echo.
echo.
echo Enter the password for user
"%InstanceName%.exe" run passwd "%USERNAME%"

echo.
echo.
echo Making it the default user on login
"%InstanceName%.exe" config --default-user "%USERNAME%"

echo.
echo.
echo Restarting %InstanceName% for changes to take effect
wsl --terminate %InstanceName%

echo.
echo.
echo Checking default user for %InstanceName% (whoami)
"%InstanceName%.exe" run whoami

