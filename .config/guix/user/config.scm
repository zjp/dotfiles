;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce where the
;; root partition is encrypted with LUKS.

(use-modules (gnu) 
	     (gnu system nss) 
	     (gnu packages shells)
	     (nongnu packages linux) 
	     (nongnu system linux-initrd))
(use-service-modules desktop networking ssh xorg)
(use-package-modules certs gnome)

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (host-name "zjp-guix")
  (timezone "America/Chicago")
  (locale "en_US.utf8")

  ;; Choose US English keyboard layout.  The "altgr-intl"
  ;; variant provides dead keys for accented characters.
  (keyboard-layout (keyboard-layout "us"))

  ;; Use the UEFI variant of GRUB with the EFI System
  ;; Partition mounted on /boot/efi.
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (target "/boot/EFI")
                (keyboard-layout keyboard-layout)))

  ;; Specify a mapped device for the encrypted root partition.
  ;; The UUID is that returned by 'cryptsetup luksUUID'.
  (file-systems (append
                 (list (file-system
                         (device (uuid "703333d6-f0de-456c-8c94-a01224a95ed6" 'ext4))
                         (mount-point "/")
                         (type "ext4"))
                       (file-system
                         (device (uuid "E6A8-2CA8" 'fat))
                         (mount-point "/boot")
                         (type "vfat")))
                 %base-file-systems))
  (swap-devices
    (list (uuid "0a1ecc65-8908-44cd-aec2-034eb16180db")))

  ;; Create user `bob' with `alice' as its initial password.
  (users (cons (user-account
                (name "zjp")
                (comment "Zach Pearson")
                (home-directory "/home/zjp")
                (group "users")
		(shell (file-append zsh "/bin/zsh"))
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video")))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (append (list
                     ;; for HTTPS access
                     nss-certs
                     ;; for user mounts
                     gvfs)                     
                    %base-packages))

  ;; Add GNOME and Xfce---we can choose at the log-in screen
  ;; by clicking the gear.  Use the "desktop" services, which
  ;; include the X11 log-in service, networking with
  ;; NetworkManager, and more.
  (services (append (list (service gnome-desktop-service-type)
                          (service openssh-service-type)
                          (set-xorg-configuration
                           (xorg-configuration
                            (keyboard-layout keyboard-layout))))
                    %desktop-services))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
