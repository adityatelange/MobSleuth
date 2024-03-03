# MobSleuth 📲

> Scripts to set up your own mobile 📱 app hacking lab (currently focusing on Android)

Includes the following tools:

- [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) `FOSS` - Mobile Security Framework is an open-source, automated mobile app security testing tool.
- [reDroid](https://github.com/remote-android/redroid-doc) `FOSS` - Remote anDroid solution for emulating an Android device in a container.
- [Scrcpy](https://github.com/Genymobile/scrcpy) `FOSS` - a free and open-source tool that allows you to mirror and control your Android device from your computer via ADB.
- [Frida](https://github.com/frida/frida) `FOSS` - Dynamic instrumentation toolkit for developers, reverse-engineers, and security researchers.
- [Jadx](https://github.com/skylot/jadx) `FOSS` - Dex to Java decompiler.
- [Objection](https://github.com/sensepost/objection) `FOSS` - Runtime Mobile Exploration.
- [Pidcat](https://github.com/JakeWharton/pidcat) `FOSS` - Colored logcat script which only shows log entries for a specific application package.
- [BurpSuite CE](https://portswigger.net/burp/documentation/desktop/getting-started) `proprietary` - Powerful web application security testing platform with interception, scanning, fuzzing, and more.

What you get:
- A complete setup of tools to start hacking Android apps.
- A dockerized environment to run Android apps in a container.
- One-command `root` access to the Android container.
- BurpSuite running on the host machine to intercept and modify traffic.
- Mobsf with *dynamic analysis* capabilities connected to Android container.
- ADB server running on port 5555 to connect to the Android container.
- Scrcpy to mirror and control the Android container.
- Scripts to generate a CA certificate and install them on the Android container.
- Scripts to install and run Frida on the Android container.

<kbd>![Screenshot](https://github.com/adityatelange/MobSleuth/assets/21258296/c5a2d717-ba51-4209-8140-7d204e14579c)</kbd>


## Setup a VM - Lubuntu-22.04

- [Download Lubuntu](https://lubuntu.me/downloads/) or any Ubuntu based distro.
- Use [Lubuntu Installation Guide](https://manual.lubuntu.me/stable/1/1.3/installation.html) to install a VM in Virtualbox.
- Make sure you configure sufficient resources for lab to run smoothly.
  - Minimum 25GB of virtual disk space.
  - Minimum 8GB RAM allocated.
  - Mininum 4 Cores allocated.

## Install

> [!NOTE]  
> Below scripts might require `sudo` access to install certain packages and dependencies.
> Review the scripts before running them.

```sh
wget -qO - https://raw.githubusercontent.com/adityatelange/MobSleuth/main/install.sh | bash
```

Tools can be installed one by one.

```sh
cd $HOME/MobSleuth/src
bash install/common_deps.sh
bash install/docker.sh
```

Logout and login again to apply group changes as we have added user to `docker` group.

Continue installing rest of the components.

```sh
cd $HOME/MobSleuth/src
bash install/redroid.sh
bash install/mobsf.sh
bash install/scrcpy.sh
bash install/frida.sh
bash install/jadx.sh
bash install/burpsuite.sh
bash install/objection.sh
bash install/pidcat.sh
```

## After Installation

All the tools are installed in the `~/MobSleuth` directory.

- `~/MobSleuth/src` - contains the installation scripts. You may update MobSleuth using `git pull` in this directory.
- `~/MobSleuth/installers` - contains the downloaded installers.
- `~/MobSleuth/data11_vol` - contains the data directory for the reDroid container for persistence.
- `~/MobSleuth/mobsf_vol` - contains the data directory for the MobSF container for persistence.
- `~/MobSleuth/tools` - contains the tools installed.
- `~/MobSleuth/certs` - contains the generated CA certificate and private key.

## Setup Diagram

```mermaid
flowchart
    subgraph MobSleuth
        subgraph Docker Services
            subgraph reDroid
                redroid5555["ADB server listener :5555"]
                redroid27042["frida-server"]
                redroidvol["/data"]
                redroidsserv["scrcpy-server"]
                redroid5555 <---> redroidsserv
                redroid5555 <---> redroid27042
            end

            subgraph MobSF
                mobsf8000["WebApp listener :8000"]
                mobsfvol["/home/mobsf/.MobSF"]
                DA["Dynamic Analyzer"] --> |"via MOBSF_ANALYZER_IDENTIFIER"| redroid5555
            end
        end

        subgraph "Host"
            subgraph "local directories"
                mobsfdir["~/mobsf"] <--> mobsfvol
                redroiddir["~/data11"] <--> redroidvol
            end

            subgraph listener ports
                lp5555[":5555"] <==> |"5555:5555"| redroid5555
                lp8000[":8000"] <==> |"8000:8000"| mobsf8000
            end
        end

        subgraph Tools
            subgraph ADB
                adbd["daemon :5037"] <---> |"shell"| lp5555
            end

            subgraph scrcpy
                scr["via ADB"] <---> lp5555
            end

            subgraph BurpSuite
                burp["Proxy listener :8080"] <-.-> |"proxied traffic"| reDroid
            end

            subgraph Frida
                frida["frida-tools"] <---> lp5555
            end

            subgraph pidcat
                pid["via ADB"] <---> lp5555
            end

            subgraph objection
                obj["via ADB"] <---> lp5555
            end

            subgraph jadx
            end
        end
    end
```
