(load-file "~/dotfiles/common/spacemacs/spacemacs.el")

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
 '(conda-anaconda-home "/home/zjp/anaconda3/")
 '(conda-env-home-directory "/home/zjp/anaconda3/")
 '(ein:output-area-inlined-images t)
 '(evil-search-module 'evil-search)
 '(evil-want-Y-yank-to-eol nil)
 '(hybrid-style-use-evil-search-module t)
 '(package-selected-packages
   '(nand2tetris gruvbox-theme yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-evil toc-org terminal-here tagedit symon symbol-overlay string-inflection stickyfunc-enhance srefactor spaceline-all-the-icons smeargle smart-tabs-mode smart-tab slim-mode slack shell-pop scss-mode sass-mode rjsx-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js popwin platformio-mode plantuml-mode pippel pipenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pdf-tools pcre2el password-generator paradox ox-gfm overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file ob-ipython nodejs-repl nameless multi-term move-text mmm-mode meson-mode mc-extras markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-python-ms lsp-haskell lorem-ipsum livid-mode live-py-mode link-hint json-navigator json-mode js2-refactor js-doc intero indent-guide importmagic impatient-mode hybrid-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hideshow-org helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-hoogle helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate google-c-style golden-ratio gnuplot-mode gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ gh-md ggtags geben fuzzy font-lock+ flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-package flycheck-haskell flycheck-elsa flx-ido fancy-battery eyebrowse exwm expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-snipe evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emoji-cheat-sheet-plus emmet-mode elisp-slime-nav ein editorconfig edit-server dumb-jump drupal-mode dotenv-mode disaster diminish devdocs define-word dap-mode dante cython-mode cquery cpp-auto-include conda company-ycmd company-web company-tern company-rtags company-quickhelp company-phpactor company-php company-lsp company-ghci company-ghc company-emoji company-cabal company-c-headers company-anaconda column-enforce-mode color-identifiers-mode cmm-mode clean-aindent-mode clang-format centered-cursor-mode ccls buffer-move browse-at-remote blacken autothemer auto-yasnippet auto-highlight-symbol auto-compile attrap aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(powerline-default-separator 'contour)
 '(powerline-height 30)
 '(spaceline-all-the-icons-clock-always-visible t)
 '(spaceline-all-the-icons-separators-invert-direction t)
 '(spaceline-all-the-icons-slim-render nil)
 '(spaceline-all-the-icons-window-number-always-visible t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ein:cell-input-area ((t (:extend t :background "#383838"))))
 '(spaceline-all-the-icons-info-face ((t (:inherit default :foreground "#63B2FF")))))
)

