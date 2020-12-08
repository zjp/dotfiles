;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t)
     c-c++
     colors
     conda
     (dap :variables
          spacemacs--dap-supported-modes '(c++-mode)
          dap-enable-mouse-support t)
     emacs-lisp
     erc
     evil-snipe
     git
     gnus
     (haskell :variables
              haskell-completion-backend 'lsp)
     helm
     html
     ipython-notebook
     javascript
     (lsp :variables
          lsp-ui-doc-enable t
          lsp-ui-doc-include-signature t
          lsp-ui-sideline-enable t
          lsp-ui-sideline-show-symbol t
          lsp-prefer-flymake nil)
     markdown
     (multiple-cursors :variables
                       multiple-cursors-backend 'mc)
     (org :variables
          org-enable-github-support t)
     pdf
     php
     (plantuml :variables
               plantuml-jar-path "~/.config/emacsen/resources/plantuml.jar"
               org-plantuml-jar-path "~/.config/emacsen/resources/plantuml.jar")
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright)
     react
     semantic
     (shell :variables
            shell-default-shell 'vterm
            shell-default-height 30
            shell-default-position 'bottom)
     slack
     syntax-checking
     gtags
     (treemacs :variables
               treemacs-use-all-the-icons-theme t)
     version-control
     yaml
     )
   dotspacemacs-additional-packages '(atom-one-dark-theme
                                      autothemer
                                      buffer-move
                                      company-box
                                      doom-themes
                                      edit-server
                                      exec-path-from-shell
                                      exwm
                                      gnuplot-mode
                                      gruvbox-theme
                                      hideshow-org
                                      mc-extras
                                      meson-mode
                                      minimap
                                      platformio-mode
                                      smart-tabs-mode
                                      smart-tab
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (cond ((eq system-type 'darwin)
         (setq-default dotspacemacs-default-font '("Input Mono Condensed Edu"
                                                   :size 14
                                                   :weight normal
                                                   :width normal
                                                   :powerline-scale 1.1)))
        ((eq system-type 'gnu/linux)
         (setq-default dotspacemacs-default-font '("SF Mono"
                                                   :size 16
                                                   :weight normal
                                                   :width normal
                                                   :powerline-scale 1.3))))

  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'hybrid
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner "~/.config/emacsen/resources/vilogopixel_small.png"
   dotspacemacs-startup-lists '((todos . 5)
                                (agenda . 5)
                                (projects . 5)
                                (recents . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-startup-buffer-show-version nil
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(gruvbox-light-soft
                         gruvbox-dark-hard
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-mode-line-theme 'doom
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   ;; I currently have hs-org for this.
   ;; TODO: see if evil/origami are better
   ;; Code folding method. Possible values are `evil' and `origami'.
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep" "rg")
   dotspacemacs-default-package-repository nil
   ;; I have Emacs set up to do this elsewhere.
   ;; TODO: Compare and see if the Spacemacs way is better
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (org-babel-load-file "~/.config/emacsen/spaceconfig-early.org"))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (org-babel-load-file "~/.config/emacsen/spaceconfig.org"))
