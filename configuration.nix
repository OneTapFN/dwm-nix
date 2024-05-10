{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #Bootloader configuration
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "mhl"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.xserver = {
    enable = true;
    windowManager.dwm.enable = true;
    layout = "us";
    xkbVariant = "";
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };
#    videoDrivers = [ "intel" ];
#    deviceSection = ''Option "TearFree" "True"'';
  };


  users.users.onetap = {
    isNormalUser = true;
    description = "OneTap_FN";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  git
  cinnamon.nemo
  mate.engrampa
  htop
  dwm
  st
  firefox
  fastfetch
  wget
  unzip
  rofi
  cmus
  parsec-bin
  python3
  scrcpy
  gnome.gnome-disk-utility
  vscode
  scrot
  pfetch
  fish
  usbutils
  freetube
  udiskie
  udisks
  telegram-desktop
  lxappearance
  mpv
  feh
  nitrogen
  nordzy-icon-theme
  nordic
  xorg.xinit
  ];
  
  fonts.packages = with pkgs; [
  jetbrains-mono
  font-awesome
  ];

nixpkgs.overlays = [
	(final: prev: {
		st = prev.st.overrideAttrs (old: { src = /home/onetap/st-flexipatch ;});
		dwm = prev.dwm.overrideAttrs (old: { src = /home/onetap/dwm-flexipatch ;});
	})
];

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  system.stateVersion = "23.11";
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
}
