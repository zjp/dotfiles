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
          org-enable-github-support t
          org-enable-reveal-js-support t)
         ;org-enable-jira-support t)
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
         (setq-default dotspacemacs-default-font '("Input Mono Compressed"
                                                   :size 14
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
   dotspacemacs-themes '(gruvbox-dark-hard
                         gruvbox-light-soft
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
  (with-eval-after-load 'org
                        (org-babel-load-file "~/.config/emacsen/spaceconfig-early.org")))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (load-file "~/git/smart-tab/smart-tab.el")
  (with-eval-after-load 'org
    (org-babel-load-file "~/.config/emacsen/spaceconfig.org")))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(create-lockfiles nil)
 '(custom-safe-themes
   '("123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" default))
 '(display-line-numbers 'relative)
 '(display-line-numbers-type 'relative)
 '(doom-themes-treemacs-theme "doom-colors")
 '(ein:output-area-inlined-images t)
 '(evil-search-module 'evil-search)
 '(evil-want-Y-yank-to-eol nil)
 '(hybrid-style-use-evil-search-module t)
 '(js-indent-level 2)
 '(lsp-python-ms-cache "Library")
 '(lsp-python-ms-python-executable-cmd "/usr/bin/env python")
 '(org-adapt-indentation nil)
 '(package-selected-packages
   '(treemacs treemacs-all-the-icons lsp-python-ms jedi company-jedi company-box minimap sublimity doom-themes nand2tetris gruvbox-theme yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-evil toc-org terminal-here tagedit symon symbol-overlay string-inflection stickyfunc-enhance srefactor spaceline-all-the-icons smeargle smart-tabs-mode smart-tab slim-mode slack shell-pop scss-mode sass-mode rjsx-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js popwin platformio-mode plantuml-mode pippel pipenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pdf-tools pcre2el password-generator paradox ox-gfm overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file ob-ipython nodejs-repl nameless multi-term move-text mmm-mode meson-mode mc-extras markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-haskell lorem-ipsum livid-mode live-py-mode link-hint json-navigator json-mode js2-refactor js-doc intero indent-guide importmagic impatient-mode hybrid-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hideshow-org helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-hoogle helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate google-c-style golden-ratio gnuplot-mode gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ gh-md ggtags geben fuzzy font-lock+ flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-package flycheck-haskell flycheck-elsa flx-ido fancy-battery eyebrowse exwm expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-snipe evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emoji-cheat-sheet-plus emmet-mode elisp-slime-nav ein editorconfig edit-server dumb-jump drupal-mode dotenv-mode disaster diminish devdocs define-word dap-mode dante cython-mode cquery cpp-auto-include conda company-ycmd company-web company-tern company-rtags company-quickhelp company-phpactor company-php company-lsp company-ghci company-ghc company-emoji company-cabal company-c-headers company-anaconda column-enforce-mode color-identifiers-mode cmm-mode clean-aindent-mode clang-format centered-cursor-mode ccls buffer-move browse-at-remote blacken autothemer auto-yasnippet auto-highlight-symbol auto-compile attrap aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#32302f"))
 '(powerline-default-separator 'alternate)
 '(powerline-height nil)
 '(powerline-text-scale-factor 1)
 '(spaceline-all-the-icons-clock-always-visible t)
 '(spaceline-all-the-icons-separators-invert-direction t)
 '(spaceline-all-the-icons-slim-render nil)
 '(spaceline-all-the-icons-window-number-always-visible t)
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(treemacs-width 25)
 '(web-mode-code-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:height 100 :family "SF Compact Rounded")))))
)
