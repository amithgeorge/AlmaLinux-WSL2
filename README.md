# AlmaLinux for WSL2

This is based on the `Generic Cloud (cloud-init)` [image](https://github.com/AlmaLinux/cloud-images) released by [AlmaLinux](https://almalinux.org/).

The `build` script is used to create a WSL2 compatible RootFS from the QCOW2 cloud-init image. The script takes inspiration from the build script used by [mishamosher](https://github.com/mishamosher) in their [CentOS-WSL](https://github.com/mishamosher/CentOS-WSL) repo.

## Installation

1. Download the latest release. (Not yet published. Need to figure out how to release).
2. Extract the zip to the installation folder. Eg `C:\WSL2 Distros\Alma-8`
3. Execute the file `Alma-8.exe`. This will install and register Alma with WSL2.
4. Execute the file again to enter the distribution. The default user will be `root`.

The exe (`Alma.exe`) is provided by [wsldl](https://github.com/yuk7/wsldl). Please read it's readme to know what all it can do.

### Configuration

A few quality of life changes maybe made by the user

1. Create a new user account inside Alma and use that as the default. Execute these from a `powershell` shell, inside the host Windows OS. Ensure the present working directory is the installation directory selected in "Installtion Step 2".

```shell
.\Alma-8.exe run adduser -G wheel "%USERNAME%"

# enter the password for the newly created user
.\Alma-8.exe run passwd "%USERNAME%"

.\Alma-8.exe config --default-user "%USERNAME%"
```

2. Upgrade the software packages. The cloud-init image might be a bit behind the latest version of Alma.

```shell
.\Alma-8.exe run sudo yum upgrade --assumeyes
```

3. Set Windows Terminal as the default terminal.

```shell
.\Alma-8.exe config --default-term wt
```

## Win x86/x64

I don't have access to a arm64 Windows machine to test/build the arm64 version of AlmaLinux for WSL2. I will accept any related PRs.

## Other info

This repo contains an installation script, which is not present in the release zip. The script simply automates the installation and configuration mentioned earlier. As it stands, I don't have faith that the script will work flawlessly for everyone, hence it is excluded from the release zip.
