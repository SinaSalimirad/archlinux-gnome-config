# Arch Linux Setup Manifest

A categorized package manifest and rebuild guide for an Arch Linux workstation using GNOME with web development, networking, media/design, gaming, and virtualization tools.

> **Important:** This is a starting point, not a universal install script. Review hardware-specific drivers and optional packages before installing.

## 00 — Base System

### Suggested packages

```text
nano
less
man-db
man-pages
texinfo
unzip
zip
unrar
p7zip
rsync
openssh
tree
tmux
fastfetch
git
curl
wget
file
which
wl-clipboard
sudo
eza
fzf
zoxide
zsh
zsh-autosuggestions
zsh-syntax-highlighting
zsh-completions
fzf
```

### Optional

```text
reflector
```

### Notes

- `man-pages` and `texinfo` provide additional local documentation.
- `reflector` can help manage Arch mirror lists; it is optional.
- `zip`, `unzip`, `unrar`, and `p7zip` cover common archive formats.
- This list supplements the base installation; it does not replace the `base` package group or kernel installation.
- Keep `git` here if you want it available on every installation; it is also required for development.

---

## 01 — Hardware, Graphics, and Audio

### General packages

```text
linux
linux-firmware
linux-headers
base-devel
mesa
pipewire
pipewire-alsa
pipewire-pulse
wireplumber
alsa-utils
power-profiles-daemon
brightnessctl
```

### Intel graphics — choose according to hardware

```text
vulkan-intel
intel-media-driver
libva-intel-driver
lib32-vulkan-intel
```

### AMD graphics — install only on applicable hardware

```text
vulkan-radeon
xf86-video-amdgpu
```

### NVIDIA / Nouveau — only if applicable

```text
vulkan-nouveau
xf86-video-nouveau
```

### Optional legacy ATI driver

```text
xf86-video-ati
```

### Notes

- If you use DKMS modules, install the matching headers for each kernel you use, such as `linux-headers`.
- Do not install every GPU driver by default. Select packages that match the actual hardware.
- `intel-media-driver` supports newer Intel graphics generations; `libva-intel-driver` is the older VA-API driver. Whether you need one or both depends on your GPU and applications.
- Xorg DDX packages such as `xf86-video-amdgpu`, `xf86-video-ati`, and `xf86-video-nouveau` are not automatically needed for a Wayland-first Hyprland setup.
- `lib32-vulkan-intel` is useful for some 32-bit Steam games on Intel graphics. Choose the matching 32-bit Vulkan package for other GPUs.
- `base-devel` is useful for building  packages.
- Review Arch's current package names and hardware guidance before installation.

---

## 02 — Fonts and Appearance

### Fonts

```text
noto-fonts
noto-fonts-emoji
noto-fonts-extra
ttf-dejavu
ttf-liberation
ttf-firacode-nerd
ttf-iosevka-nerd
ttf-jetbrains-mono-nerd
```

### Optional appearance tools

```text
papirus-icon-theme
adwaita-icon-theme
```

### Notes

- Choose one or more preferred icon themes rather than installing themes without a reason.
- Keep downloaded themes and AUR theme packages in a separate optional list.

---

## 03 — Network and Security

### Network management and VPN

```text
networkmanager
networkmanager-openvpn
networkmanager-openconnect
networkmanager-l2tp
networkmanager-pptp
network-manager-sstp
wireguard-tools
```

### Network troubleshooting tools

```text
bind
nmap
traceroute
proxychains-ng
nethogs
iw
```

### Optional diagnostics and system tools

```text
tcpdump
iperf3
mtr
whois
ethtool
smartmontools
```

### Notes

- Install VPN plugins only for VPN protocols you actually use.
- PPTP is an obsolete protocol with serious security weaknesses; keep `networkmanager-pptp` only if required for a legacy connection.
- `mtr` helps diagnose routing and packet loss.
- `iperf3` tests throughput between two endpoints.
- `tcpdump` captures and inspects network traffic.
- `smartmontools` checks supported storage-device health information.
- `ethtool` inspects and configures Ethernet interfaces.

---

## 04 — Development

### Languages and runtimes

```text
rust
lua
nodejs
npm
bun
python
python-pip
jdk-openjdk
```

### Git and developer utilities

```text
git
jq
yq
uv
```

### Editors and development applications

```text
vscodium-bin
vscodium-bin-marketplace
github-desktop-bin
tableplus
postman-bin
```

### Notes

- `nodejs`, `npm`, and `bun` serve related but different workflows. Install only what your projects require.
- `python-pip` and `uv` may be useful, but use virtual environments for Python project dependencies and follow current Arch Python packaging guidance.
- `jq` and `yq` help process JSON and YAML from the command line.
- The `-bin` packages listed above are commonly associated with AUR naming conventions, but verify each package's source before automating installation.
- Check whether VSCodium's marketplace package is compatible with the current VSCodium build and extension-source requirements.

---

## 05 — Containers and Virtualization

### Podman profile

```text
podman
podman-compose
crun
podman-desktop
```

### Optional Docker profile

```text
docker
docker-compose
```

### VirtualBox profile

```text
virtualbox
virtualbox-guest-iso
virtualbox-ext-vnc
```

### Notes

- Choose Podman or Docker as your primary container workflow unless you have a clear reason to maintain both.
- `podman-compose` and `docker-compose` are not necessarily interchangeable in every workflow; test your Compose files.
- Install `virtualbox-guest-iso` when you need Guest Additions installation media for guests; it is not itself a replacement for installing Guest Additions inside the guest OS.
- `virtualbox-ext-vnc` is optional and should be included only if you need its functionality.
- Check VirtualBox kernel-module compatibility with every kernel you plan to boot. Review the current Arch package options and kernel-module requirements before installation.

---

## 06 — Daily Applications

### Browser and email

```text
firefox
thunderbird
```

### File manager and desktop utilities

```text
nautilus
nautilus-image-converter
```

### Communication and productivity

```text
telegram-desktop
obsidian
xournalpp
rnote
```

### Media players and monitoring

```text
vlc
vlc-plugins-extra
mpv
btop
```

### Optional GNOME utilities

```text
loupe
file-roller
evince
gnome-disk-utility
gnome-system-monitor
```

### Flatpak support

```text
flatpak
gnome-software
```

### Notes

- Configure the Flathub remote as a separate post-install step if you use Flathub applications.
- GNOME installations may already include some desktop utilities.
- `vlc` and `mpv` are both useful media players; keep both if you value their different interfaces and capabilities.
- `btop` is a terminal resource monitor.

---

## 07 — Media and Design

### Main applications

```text
obs-studio
blender
inkscape
gimp
imagemagick
```

### Optional applications

```text
krita
darktable
kdenlive
handbrake
audacity
```

| Application | Main use |
|---|---|
| Krita | Digital painting and illustration |
| Darktable | RAW photography workflow |
| Kdenlive | Video editing |
| HandBrake | Video transcoding and compression |
| Audacity | Audio recording and editing |
| Blender | 3D modeling, animation, and rendering |
| Inkscape | Vector graphics |
| GIMP | Raster image editing |
| OBS Studio | Screen recording and streaming |
| ImageMagick | Command-line image processing |

---

## 08 — Office and Documents

### Office suite — choose one primary option

```text
libreoffice-fresh
```

Alternative to evaluate:

```text
onlyoffice-bin
```

### PDF, conversion, and OCR tools

```text
evince
okular
pandoc
ocrmypdf
tesseract
```

### Notes

- LibreOffice provides Writer, Calc, and Impress. OnlyOffice is an alternative; most users do not need both suites.
- `evince` and `okular` are alternative PDF/document viewers. Pick one if you want a leaner installation.
- `pandoc` converts between many document formats.
- `ocrmypdf` and `tesseract` can be useful for searchable scanned PDFs. Language data and dependencies may need to be installed separately.
- Verify the exact package names and sources for any `*-bin` office tools before adding them to an automated installation list.

### Unverified package names from the original list

The following names were supplied in the original package list. Verify that each package exists, its source, maintenance status, and actual functionality before installing it:


---

## 9 — Gaming

### Main application

```text
steam
```

### Optional tools

```text
gamemode
mangohud
```

### Notes

- Install the appropriate 32-bit graphics/Vulkan libraries for your GPU and games.
- Do not install AMD, Intel, and Nouveau graphics packages indiscriminately.
- Check Steam's current Arch Linux requirements before building the gaming profile.

---

## 10 — AUR Applications


### Applications

```text
github-desktop-bin
vscodium-bin
vscodium-bin-marketplace
tableplus
postman-bin
v2rayn-bin
zapzap-bin
localsend-bin
proton-mail-bin
ab-download-bin
anydesk-bin
winboat-bin
```

### Office & Adobe Application alternatives

```text
pdfcraft-bin
wordcraft-bin
deckcraft-bin
gridcraft-bin
photocraft-bin
lightcraft-bin
designcraft-bin
effectcraft-bin
vectorcraft-bin
filmcraft-bin
figcraft-bin
soundcraft-bin
onlyoffice-bin
```

### AUR installation notes

- Review each package's PKGBUILD, upstream source, maintainer activity, and dependencies before building.
- An AUR helper is optional; if you use one, document it separately and understand that AUR packages are user-maintained.
- Do not run an AUR build or installation as root.
- AUR package names can change or become unmaintained. Keep a record of alternatives for important applications.
- Confirm each application's package source; a `-bin` suffix does not prove that it comes from AUR.

---

## 11 — File Management and External Drives

### GNOME Files and GVFS

```text
nautilus
gvfs
gvfs-afc
gvfs-dnssd
gvfs-goa
gvfs-gphoto2
gvfs-mtp
gvfs-nfs
gvfs-onedrive
gvfs-smb
gvfs-wsdd
udisks2
ntfs-3g
```

### Notes

- `gvfs-mtp`: access compatible Android devices.
- `gvfs-gphoto2`: access supported cameras.
- `gvfs-smb`: access SMB/CIFS network shares, including common Windows shares.
- `gvfs-nfs`: access NFS shares.
- `gvfs-onedrive`: optional OneDrive integration.
- `gvfs-afc`: support for compatible Apple devices.
- `ntfs-3g`: access NTFS volumes.
- You do not need every GVFS backend on every machine. Select the ones you use.
- For Windows dual boot, make sure Windows Fast Startup/hibernation is disabled before writing to shared NTFS volumes, and always shut Windows down cleanly.

