;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     csv
     yaml
     ruby
     vimscript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     bibtex
     ivy
;     (auto-completion :disabled-for org git markdown text latex)
     ;; better-defaults
     deft
     emacs-lisp
     ess
     evil-commentary
     ;; evil-snipe
     git
     ;; (git :variables git-gutter-use-fringe t)
     html
     ;; ivy
     imenu-list
     (latex :variables
            latex-enable-auto-fill nil
            latex-build-command "LatexMk"
            )
     markdown
     nlinum
     org
     osx
     pandoc
     themes-megapack
     ;; purpose
     python
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     typography
     shell-scripts
     (spell-checking :variables =enable-flyspell-auto-completion= t)
     ;; syntax-checking
     (version-control :variables version-control-global-margin t version-control-diff-tool 'git-gutter)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a Layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(rainbow-mode beacon persistent-scratch ham-mode visual-fill-column reveal-in-osx-finder railscasts-theme deft stripe-buffer evil-visual-mark-mode nle-tomorrow-day ) 
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(gnutls auto-fill smart-parens ess-R-object-popup firebelly-theme niflheim-theme pastels-on-dark-theme zonokai-theme tronesque-theme )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists nil
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '( 
                         material-light
                         railscasts
                         spacemacs-dark
                         spacemacs-dark
                         doom-one

                         spacemacs-light
                          ;; twilight
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("hack"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (require 'gnutls)
  (add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

;; PATH-CUST
(add-to-list 'load-path "~/.spacemacs.d/custom")
(setq custom-theme-directory "~/.spacemacs.d/custom/")
;; (setq abbrev-file-name "~/.spacemacs.d/abbrev_defs")
;; (if (file-exists-abbrev-file))
(setq ispell-personal-dictionary "~/.spacemacs.d/dictionary-nle.dic")
(setq ispell-program-name "aspell")

;; relocate bookmark file to git-controlled .spacemacs.d
(setq bookmark-default-file "~/.spacemacs.d/bookmarks")
(require  'nle-funcs)

(setq persistent-scratch-backup-directory  "~/.spacemacs.d/tmp/")
(setq persistent-scratch-save-file "~/.spacemacs.d/tmp/.persistent-scratch")
(persistent-scratch-setup-default)    ;

(setq recentf-save-file "~/.spacemacs.d/recentf")
(setq recentf-max-saved-items 250)
;; (run-at-time nil (* 5 60) 'recentf-save-list)

;; disable irritating warning about shell paths; not sure why the first does not work but the second does
(setq exec-path-from-shell-check-startup-files nil)
(setq exec-path-from-shell-arguments '("-i"))

;; follow github and other symlinks without asking
(setq find-file-visit-truename t)


;; FACES-CUST
;; (set-face-attribute 'variable-pitch nil :family "museo sans" :height 160)
;; (set-face-attribute 'variable-pitch nil :family "source sans pro" :height  170)
(set-face-attribute 'variable-pitch nil :family "ubuntu" :height 160)

(set-face-attribute 'font-lock-comment-face nil :background 'unspecified :inherit 'default)


;; FRAME-CUST

;; (setq  default-frame-alist '((top . 25) (left . 300) (width . 120) (height . 68) (internal-border-width . 0)))
(setq initial-frame-alist '((top . 25) (left . 300) (width . 120) (height . 68) (internal-border-width . 0)))
(set-fringe-mode '(40 . 40))
(spacemacs/toggle-vi-tilde-fringe-off)
(scroll-bar-mode -1)

(defun disable-lines ()
  (interactive)
  (setq display-line-numbers nil)
  )


(defun enable-lines ()
  (interactive)
  (setq display-line-numbers t)
  )

(add-hook 'spacemacs-buffer-mode-hook 'disable-lines)
(add-hook 'text-mode-hook 'disable-lines)




;; disable variable pitch for the time being
;; (set-face-attribute 'variable-pitch nil :family 'unspecified :inherit 'default)
(setq line-spacing 4)
(setq-default line-spacing 4)
(setq text-scale-mode-step 1.1)
(setq global-hl-line-mode 1)

;; (blink-cursor-mode 1)
;; (beacon-mode 1)
;; (setq beacon-blink-when-buffer-changes t
      ;; beacon-blink-when-point-moves-vertically 10)
(setq-default spacemacs-show-trailing-whitespace nil)

;; visual line and highlight line
(defun visual-line-range ()
    (save-excursion
      (cons
       (progn (beginning-of-visual-line) (point))
       (progn (end-of-visual-line) (point)))))
    (setq hl-line-range-function 'visual-line-range)

(global-visual-line-mode 1)
;; (global-visual-fill-column-mode t)
(add-hook 'text-mode-hook #'visual-fill-column-mode)


 ;; change frame title. TODO: find a better, more useful syntax
(setq frame-title-format
      (list
       "%b - "                                           ; Buffer name
       '(:eval (format-time-string "%H:%M - %a %-d %b")) ; Time and date
    ))

;; MODELINE-CUST
(setq powerline-default-separator 'nil)
(spaceline-toggle-minor-modes-off)

 
(set-face-attribute 'mode-line nil :family "hack" :height 120)


(setq evil-normal-state-cursor '("orange" box))
(setq evil-hybrid-state-cursor '("green" box))
(setq evil-insert-state-cursor '("green" box))

(defvar default-color nil)
(lexical-let ((default-color (cons (face-background 'default) ; ;
                                   (face-foreground 'default)))))

  (defun mode-line-set-evil-state ()
    (defvar evil_insert "chartreuse3")
    (defvar evil_visual "gray")
    (defvar evil_motion "plum")
    (defvar evil_emacs "SkyBlue2")
    (defvar evil_normal "DarkGoldenrod2")
    (defvar narrowed_buffer "OliveDrab")

    (set-face-background 'mode-line
                         (cond ((evil-motion-state-p) evil_motion)
                               ((evil-visual-state-p) evil_visual)
                               ((evil-emacs-state-p) evil_emacs)
                               ((evil-normal-state-p) evil_normal)
                               (t evil_insert)))

    (set-face-background 'powerline-active1
                          (cond ((evil-motion-state-p) evil_motion)
                               ((evil-visual-state-p) evil_visual)
                               ((evil-emacs-state-p) evil_emacs)
                               ((evil-normal-state-p) evil_normal)
                               (t evil_insert)))

    (set-face-background 'powerline-active2
                         (cond ((evil-motion-state-p) evil_motion)
                               ((evil-visual-state-p) evil_visual)
                               ((evil-emacs-state-p) evil_emacs)
                               ((evil-normal-state-p) evil_normal)
                               (t evil_insert)))

    ;; (set-face-background 'header-line
    ;;                      (cond ((evil-motion-state-p) evil_motion)
    ;;                            ((evil-visual-state-p) evil_visual)
    ;;                            ((evil-emacs-state-p) evil_emacs)
    ;;                            ((evil-normal-state-p) evil_normal)
    ;;                            (t evil_insert)))

    (set-face-background 'header-line
                      ;; (cond ((minibufferp) default-color)
                         (cond ((buffer-narrowed-p) narrowed_buffer)
                               (t default-color)))
    (set-face-attribute 'mode-line nil :background 'unspecified :box nil :inherit 'powerline-active1)
    (set-face-attribute 'mode-line-inactive nil :background 'unspecified :box nil :inherit 'powerline-inactive1)
    (set-face-attribute 'mode-line-buffer-id-inactive nil :background 'unspecified :foreground 'unspecified :inherit 'mode-line-inactive)
    (set-face-attribute 'mode-line-buffer-id nil :background 'unspecified :foreground 'unspecified :inherit 'mode-line)
    (set-face-attribute 'powerline-active1 nil :foreground 'unspecified :inherit 'mode-line)

;; end mode-line-set-evil-state
    )


  ;; (add-hook 'post-command-hook 'mode-line-set-evil-state)

(defun toggle-mode-line-buffer-id-face (window)
  "Update the `mode-line-buffer-id' face in WINDOW dependening on
whether the window is selected."
  (with-current-buffer (window-buffer window)
    (if (eq (current-buffer) (window-buffer (selected-window)))
        (face-remap-reset-base 'mode-line-buffer-id)
      (face-remap-set-base 'mode-line-buffer-id '(:foreground "grey20")))))

(add-hook 'buffer-list-update-hook (lambda () (walk-windows #'toggle-mode-line-buffer-id-face nil t)))


;; LATEX-CUST

;; hide auctex generated style files in one hidden directory
(setq-default TeX-auto-local "~/.auctex-auto")

;; ;; this should disable ref labels
(setq LaTeX-section-hook
      '(LaTeX-section-heading
        LaTeX-section-title
        LaTeX-section-section))

;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "lualatex")))

(setq TeX-auto-save t)
;; (setq TeX-parse-self t)
(setq-default TeX-master t)
(setq TeX-save-query nil)
(setq-default TeX-engine 'luatex)
;; (setq-default TeX-PDF-mode t)
(setq TeX-show-compilation t)

;; (add-hook 'LaTeX-mode-hook (lambda ()
;;                              (push
;;                               '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;;                                 :help "Run latexmk on file")
;;                               TeX-command-list)))


;; (setq latex-enable-auto-fill nil)

;; (add-hook 'LaTeX-mode-hook (lambda ()
;;                               (TeX-fold-mode 1)
;;                              ))


;; (setq reftex-default-bibliography '("/Users/nensmeng/data/1-academic/Research/0-envirocompute/0-dirty-bits-latex/enviro-compute.bib"))
;; (setq org-ref-bibliography-notes "/Users/nensmeng/data/1-academic/Research/0-envirocompute/0-dirty-bits-latex/enviro-compute.bib"
;;       org-ref-default-bibliography '("/Users/nensmeng/data/1-academic/Research/0-envirocompute/0-dirty-bits-latex/enviro-compute.bib")
;;       org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
(setq org-ref-pdf-directory "/Users/Shared/Data/zotero-enviro/")


;;MARKDOWN-CUST

;; ;; this speeds things up considerably
;; (use-package markdown-mode
;;   :defer t
;;   :mode ("\\.md\\'" . gfm-mode)
;;   :init
;;   ;; Prevent ~1.7 second delay by avoiding `char-displayable-p'.  See
;;   ;; https://github.com/jrblevin/markdown-mode/issues/264
;;   (setq markdown-url-compose-char ?∞)
;;   (setq markdown-blockquote-display-char "▌") 
;;   (setq markdown-hr-display-char ?─)
;;   (setq markdown-definition-display-char ?⁘))

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

;; update this function so it applies even when faces are themed

 (defun markdown-update-header-faces (&optional scaling scaling-values)
  "Update header faces, depending on if header SCALING is desired.
If so, use given list of SCALING-VALUES relative to the baseline
size of `markdown-header-face'."
  (dotimes (num 6)
    (let* ((face-name (intern (format "markdown-header-face-%s" (1+ num))))
           (scale (cond ((not scaling) 1.0)
                        (scaling-values (float (nth num scaling-values)))
                        (t (float (nth num markdown-header-scaling-values))))))
      (when (get face-name 'saved-face) ; Don't update customized faces
        (set-face-attribute face-name nil :height scale :inherit 'markdown-header-face)))))



(setq markdown-asymmetric-header t) 
(setq markdown-header-scaling t)
(setq markdown-header-scaling-values '(1.3 1.2 1.0 1.1 1.0 1.0)) 


;; (add-hook 'markdown-mode-hook 'imenu-add-menubar-index)
;; (setq imenu-auto-rescan t)
(setq markdown-open-command "open -a 'Marked 2.app' %s")

(setq markdown-footnote-location 'immediately)
;; (add-hook 'markdown-mode-hook  (variable-pitch-mode -1))
(add-hook 'markdown-mode-hook  'variable-pitch-mode) 


  (make-face 'markdown-reference-face)
   (make-face 'markdown-latex-face)

   (set-face-attribute 'markdown-reference-face nil
                       :weight 'bold
                       :height 0.9
                       :foreground "dark khaki")

   (set-face-attribute 'markdown-latex-face nil
                       :weight 'bold
                       :height 0.9
                       :foreground "red")

   (font-lock-add-keywords 'markdown-mode
                           '(("\\[@.*?\\]" . markdown-reference-face)))

   ;; (font-lock-add-keywords 'markdown-mode
   ;;                         '(("^%%.*" . markdown-latex-face)))

  ;; markdown reftex
  (defvar markdown-cite-format)
  (setq markdown-cite-format
        '(
          (?m . "[@%l]")
          (?p . "[@%l]")
          (?t . "@%l")
          ))

  ;; wrap reftex-citation with local variables for markdown format
  (defun markdown-reftex-citation ()
    (interactive)
    (let ((reftex-cite-format markdown-cite-format)
          (reftex-cite-key-separator "; @"))
      (reftex-citation nil ?m )))



(spacemacs/set-leader-keys-for-major-mode ' markdown-mode "ic" 'markdown-reftex-citation)


 

(add-hook
 'markdown-mode-hook
 (lambda ()
   (define-key markdown-mode-map "\C-c[" 'markdown-reftex-citation)))

;; Markdown/org preview and shortcuts
(defun marked-preview-document ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked\\ 2.app/ %s"
           (shell-quote-argument (buffer-file-name))))
  )

(spacemacs/set-leader-keys-for-major-mode ' markdown-mode "m" 'marked-preview-document)
(spacemacs/set-leader-keys-for-major-mode ' markdown-mode "n" 'narrow-or-widen-dwim)
(spacemacs/set-leader-keys-for-major-mode ' org-mode "m" 'marked-preview-document)

(add-hook 'org-mode-hook #'typo-mode)
(add-hook 'markdown-mode-hook #'typo-mode)
(add-hook 'text-mode-hook #'typo-mode)

;; ORG-CUST

(with-eval-after-load 'org

  ;; (add-hook 'org-mode-hook (lambda()
                                        ;
;; org mode customizations

    (setq org-hide-leading-stars t)

    ;; (setq org-ellipsis "…"                  ;
    ;; org-columns-ellipses "…")
    ;; (setq org-ellipsis "⤵")
    (setq org-ellipsis "⇢")
    (setq org-ctrl-k-protect-subtree t)
    (setq org-catch-invisible-edits 'show)

    (setq org-bullets-bullet-list
          '("●" "⚬" "⚯" "•" "►" "◇"))
    (setq org-bullets-face-name 'outline-7)
    (set-face-attribute 'org-level-1 nil :height 1.1)
    (set-face-attribute 'org-level-2 nil :height 1.0)
    (set-face-attribute 'outline-7 nil :height 1.0)

    ;; (let (orgmeta "green"))
    ;; (set-face-attribute 'org-document-title nil :foreground "green")

    ;; (setq org-startup-indented t)
    ;; (variable-pitch-mode )
    (setq-local linum-mode nil)
                 ; ORG mode customizations
    (org-bullets-mode 1)
    (setq-default org-hide-emphasis-markers t)
    ;; this needs to be expanded from old emacs
    (set-face-attribute 'org-tag nil :foreground "grey60" :height 0.8)
    (setq org-tags-column 0)

    (require 'ox-md)
    (setq org-export-with-toc nil)

    ;; this strips org-export to bare minimum latex
    (add-to-list 'org-latex-classes
                 '("article"
                   "\\documentclass{article}
         [NO-DEFAULT-PACKAGES]
         [PACKAGES]
         [EXTRA]"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

    (setq org-latex-hyperref-template "")
    (setq org-latex-with-hyperref nil)
    
    (make-face 'org-reference-face)

    (set-face-attribute 'org-reference-face nil
                        :weight 'bold
                        :height 1.0
                        :foreground "darkgreen")
    (set-face-attribute 'org-level-1 nil :background 'unspecified :box nil)
    (set-face-attribute 'org-level-2 nil :background 'unspecified :box nil)
    (set-face-attribute 'org-level-3 nil :height 'unspecified :box nil)

    ;; (set-face-attribute 'org-todo nil )
    (set-face-attribute 'org-done nil :height 0.8 :foreground "dark green")

    (set-face-attribute 'org-level-1 nil :height 1.1)
    (set-face-attribute 'org-level-2 nil :height 1.0)
    (set-face-attribute 'org-document-title nil :foreground 'unspecified :height 1.0)
    (set-face-attribute 'org-document-info nil :weight 'bold :height 1.0)
    (set-face-attribute 'org-document-info-keyword nil :height 1.0)

    )


;; NARROW-CUST
(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
  Intelligently means: region, org-src-block, org-subtree, or defun,
  whichever applies first.
  Narrowing to org-src-block actually calls `org-edit-src-code'.

  With prefix P, don't widen, just narrow even if buffer is already
  narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((ignore-errors (org-edit-src-code))
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun)))
  (org-cycle)
  )

(spacemacs/set-leader-keys-for-major-mode ' org-mode "n" 'narrow-or-widen-dwim)

;; GIT-CUST
(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)
(setq auto-revert-interval 2)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Refine git gutter fringe markers
(define-fringe-bitmap 'git-gutter-fr:added
  [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
  nil nil 'center)
(define-fringe-bitmap 'git-gutter-fr:modified
  [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
  nil nil 'center)
(define-fringe-bitmap 'git-gutter-fr:deleted
  [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
  nil nil 'center)

;; PURPOSE-CUST
(with-eval-after-load 'window-purpose
(add-to-list 'purpose-user-mode-purposes '(python-mode . py))
(add-to-list 'purpose-user-mode-purposes '(org-mode . org))
(add-to-list 'purpose-user-mode-purposes '(text-mode . org))
(add-to-list 'purpose-user-mode-purposes '(markdown-mode . org))
(purpose-compile-user-configuration)
)

;;EVIL-CUST

;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)


;; make evil respect ctrl-e (end) and ctrl-a (start) in all states
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)


(define-key evil-normal-state-map "\C-a" 'evil-beginning-of-line)
(define-key evil-insert-state-map "\C-a" 'beginning-of-line)
(define-key evil-visual-state-map "\C-a" 'evil-beginning-of-line)
(define-key evil-motion-state-map "\C-a" 'evil-beginnin-of-line)

;; delete without register
;; (evil-define-operator evil-delete-without-register (beg end type yank-handler)
;;   (interactive "<R><y>")
;;   (evil-delete beg end type ?_ yank-handler))
;; (define-key evil-visual-state-map "x" 'evil-delete-without-register)
;; (define-key evil-normal-state-map "x" 'evil-delete-without-register)


;; Setup evil-mode shortcuts for jumping
(require 'avy)
;; (define-key evil-normal-state-map (kbd "gc") 'avy-goto-char)
;; (define-key evil-normal-state-map (kbd "gl") 'avy-goto-line)

;; (define-key evil-normal-state-map (kbd "gw") 'avy-goto-word-1)
;; (define-key evil-normal-state-map (kbd "gs") 'avy-goto-char-2)
;; (define-key evil-normal-state-map (kbd "gt") 'avy-goto-char-2)
(define-key evil-normal-state-map (kbd "s") 'avy-goto-char-2)
(define-key evil-motion-state-map (kbd "s") 'avy-goto-char-2)
 ;;(define-key evil-normal-state-map (kbd "f") 'avy-goto-char)
(set-face-attribute 'avy-lead-face-0 nil :foreground "red" :background nil)
(set-face-attribute 'avy-lead-face nil :foreground "blue" :background nil)

(setq evil-move-cursor-back nil)
(setq evil-cross-lines t)
(setq evil-symbol-word-search t)
(setq evil-want-fine-undo t)
(setq evil-ex-substitute-global t)

(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.2)

(define-key evil-normal-state-map "zg" 'ispell-save-word)

(defun set-normal ()
  (interactive)
  (evil-normal-state)
  (mode-line-set-evil-state)
  )

;; this auto reverts to normal mode after a set interval
;; disabling to see if I need this anymore (re-enabled on 1/30/18)
;; (run-with-idle-timer 10 t 'set-normal)


;; treat underscores as part of words, not as breaks
(modify-syntax-entry ?_ "w")

(evil-leader/set-key
  "q q" 'spacemacs/frame-killer)

;; prevent :q from quitting emacs
(evil-ex-define-cmd "q[uit]" nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; (evil-snipe-mode 1)
;; (evil-snipe-override-mode 1)
;; (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
;; (evil-define-key 'normal evil-snipe-mode-map "S" 'evil-snipe-s)
;; (evil-define-key 'normal evil-snipe-mode-map "Z" 'evil-snipe-S)


;; when searching, center in window after finding next match

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))
;; DEFT-CUST
;; (require 'deft)
;; (setq deft-extensions '("org" "md" "txt"))

;; (spacemacs/set-leader-keys-for-major-mode 'deft-mode
;;         "c" 'deft-filter-clear
;;         "l" 'deft-filter
;;         "y" 'deft-open-file-other-window
;;         )

;; (defun deft-open-in-new-and-switch ()
;;   "open deft file in new window and switch to it"
;;   (interactive)
;;   (deft-open-file-other-window)
;;   (other-window 1))

;; (define-key deft-mode-map (kbd "C-c C-o") 'deft-open-file-other-window)
;; (define-key deft-mode-map (kbd "C-c C-e") 'deft-open-in-new-and-switch)
;; (setq deft-use-filter-string-for-filename t)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; this was needed to stop a nasty hang doing vimlike searching
 (setq-default evil-search-module 'isearch)
(setq evil-ex-interactive-search-highlight nil)

;; this needs to happen after theme gets loaded
(defun nle-clear ()
       (interactive)

       (set-face-attribute 'markdown-header-face nil :family "ubuntu mono")
       (set-face-attribute 'markdown-header-delimiter-face nil :foreground (color-lighten-name (face-attribute 'default :foreground) 70) :height .8)
       (markdown-update-header-faces markdown-header-scaling markdown-header-scaling-values)

      ;; set org faces; a custom theme would be better 
       (set-face-attribute 'org-level-1 nil :box nil :background (face-attribute 'default :background) ) 


       (set-face-background 'font-lock-comment-face nil)
       (set-face-background 'fringe nil)

       (setq-default header-line-format
                     '(" "))
       (set-face-attribute 'header-line nil :background "black" :height 0.3)
       (buffer-list)
       )


(add-hook 'spacemacs-post-theme-change-hook
(lambda ()
  (nle-clear)
  ;; (split-window-horizontally)
))

(spacemacs/load-theme  spacemacs--cur-theme)



;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (set-face-background 'font-lock-comment-face nil)
;;             (set-face-background 'fringe nil) 
;;             (split-window-vertically)
;;             ))
 

(spacemacs|define-custom-layout "db"
  :binding "d"
  :body
  (find-file "/Users/Shared/Data/1-academic/Research/0-envirocompute/0-dirty-bits/dirty-bits-paper.md")
  (purpose-toggle-window-purpose-dedicated)
  ;; (split-window-right)
  (windmove-right)
  (find-file "/Users/Shared/Data/1-academic/Research/0-envirocompute/0-dirty-bits/enviro-compute.bib"))   

;; (define-key ct-x-map "\C-i"
;;   #'endless/ispell-word-then-abbrev)

;; (defun endless/simple-get-word ()
;;   (car-safe (save-excursion (ispell-get-word nil))))

;; (defun endless/ispell-word-then-abbrev (p)
;;   "Call `ispell-word', then create an abbrev for it.
;; With prefix P, create local abbrev. Otherwise it will
;; be global.
;; If there's nothing wrong with the word at point, keep
;; looking for a typo until the beginning of buffer. You can
;; skip typos you don't want to fix with `SPC', and you can
;; abort completely with `C-g'."
;;   (interactive "P")
;;   (let (bef aft)
;;     (save-excursion
;;       (while (if (setq bef (endless/simple-get-word))
;;                  ;; Word was corrected or used quit.
;;                  (if (ispell-word nil 'quiet)
;;                      nil ; End the loop.
;;                    ;; Also end if we reach `bob'.
;;                    (not (bobp)))
;;                ;; If there's no word at point, keep looking
;;                ;; until `bob'.
;;                (not (bobp)))
;;         (backward-word)
;;         (backward-char))
;;       (setq aft (endless/simple-get-word)))
;;     (if (and aft bef (not (equal aft bef)))
;;         (let ((aft (downcase aft))
;;               (bef (downcase bef)))
;;           (define-abbrev
;;             (if p local-abbrev-table global-abbrev-table)
;;             bef aft)
;;           (message "\"%s\" now expands to \"%s\" %sally"
;;                    bef aft (if p "loc" "glob")))
;;       (user-error "No typo at or before point"))))

;; (setq save-abbrevs 'silently)
;; (setq-default abbrev-mode t)
;; (setq abbrev-file-name "~/.emacs.d/.cache/abbrev_defs")

;; (setq-default display-line-numbers 'visual
;;               display-line-numbers-current-absolute t
;;       ;        display-line-numbers-width 4 
;;               display-line-numbers-widen t)


;; (set-face-attribute 'line-number nil :foreground "grey60")
;; (set-face-attribute 'line-number-current-line nil :foreground "grey10" :background "grey80")



;; (require 'color)
;; (set-face-attribute 'line-number nil
;;                     :foreground (color-lighten-name "green" 40))

;; trying this to prevent constant lockfiles when sleeping
(setq create-lockfiles nil) 

;; (require 'polymode)
;; (require 'poly-R)
;; (require 'poly-markdown)

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

 ;;;;ZEBRA


(load-theme 'nle-tomorrow-day)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
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
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" default)))
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-sexp-background-color "#efebe9")
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#525254"))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("/Users/Shared/Data/1-academic/teaching/I590-2017spring/org-ref-version/test-syllabus.org" "/Users/Shared/Data/1-academic/teaching/I590-2017spring/test-syllabus.org" "~/scratch/bibliography/test-org-ref.org" "~/scratch/bibliography/test-ref-3.org" "~/scratch/org-test.org")))
 '(org-ellipsis "  ")
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (org-category-capture imenu-list powerline undo-tree window-purpose haml-mode atom-dark-theme atom-one-dark-theme org-brain impatient-mode simple-httpd evil-org pdf-tools tablist dash ruby-refactor password-generator flycheck-bashate flycheck evil-lion editorconfig add-node-modules-path memoize org-plus-contrib s white-sand-theme symon string-inflection rebecca-theme auctex with-editor diminish log4e f browse-at-remote avy hydra packed markdown-mode helm-bibtex parsebib all-the-icons font-lock+ counsel highlight alert projectile magit-popup git-commit async yaml-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby sentence-highlight hl-sentence vimrc-mode dactyl-mode base16-theme zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme org-ref key-chord nlinum-relative nlinum fuzzy flyspell-correct-ivy flyspell-correct company-web web-completion-data company-statistics company-shell company-auctex company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl typo 4clojure stripe-buffer evil-snipe magit swiper smartparens evil helm helm-core ivy deft helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag define-word ace-jump-helm-line yapfify ws-butler winum which-key wgrep web-mode volatile-highlights visual-fill-column vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline smex smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs request rainbow-mode rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode persistent-scratch pcre2el pbcopy paradox pandoc-mode ox-pandoc osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode launchctl ivy-purpose ivy-hydra insert-shebang info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-make google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump doom-themes cython-mode counsel-projectile column-enforce-mode clean-aindent-mode beacon auto-highlight-symbol auto-compile auctex-latexmk anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link)))
 '(pdf-view-midnight-colors (quote ("#232333" . "#c7c7c7")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "f66ffeadda7b52d40c8d698967ae9e9836f54324445af95610d257fa5e3e1e21" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "b9b1bc5b3549acc33aece3ec085a8f665a079e9021e4f7ae950fdddfc54c74ce" "d03e07d962a0bd41cbb287228b2878efc8b1e955f6394a7915a1d5f190b2011e" "9412704bbd9807f31d096f2982ed416c2219b718dcf88343c0c1385b6b8778b2" "65eb691cd288cfe0d6406f8a891e5c64cf7c0f1b730f8405ba01b5be21835209" "761572049d02cc1841a508b5ad7f41811abb81b1c44c0167a5bb4f5454a5e5fe" "8fd92b018b76b3daa0fd6d06d0e4562d50ac72767643f7c0576871e6c2c154aa" "72069b64793e80360a6a62035a4cc43ec9bdd72271cd24b1310ffa800638dbb2" "042f54a6b907dd96d7dd641b213399f1661eade80080cf227096fd031224210d" "cb3a63ab71eaaba51be65d409f5b85711999cf4b30c39c775bc15000cf67ef93" "7de5fb87ab7a06dd4bbd62b6f480767b9fc935392b5da92d2059505f2d40a770" "70f50d314b43d55568b7737814c8239a985bf518088244281db66b936fd6f90d" "92319fcac68d29b3bbc061280118ddf0a0a8e3f42fbdd3e1c97b85a0e1886136" "eb1e723d477e0bde6408763ffd3ea634aec0c73bb114b2598d15b10c6b24c10d" "72d67a8380c01b15668f9692ee2786884688402b84320b688bd86facf22976e0" "5925b5069f7e70fce445d9287735c729180afe033648222436944de90346c55b" "edc02db4c54d877143a10a7de2b805b5f5501468a5de05cf01b6740706548e08" "9d5ca334ffa1f6718b84e24027d4b454fb4bd2972be5ec375414b980bc711011" "36bb09ad4b523d8a3cfb6806699d89184ce43f02ecac35e6e2505c93de7ec64c" "82a1aa318051fb4551b21e93989f89b892916de858c802ff8aa8b8cfdd2198ea" "31deed4ac5d0b65dc051a1da3611ef52411490b2b6e7c2058c13c7190f7e199b" default)))
 '(evil-want-Y-yank-to-eol t)
 '(exec-path-from-shell-check-startup-files nil)
 '(org-agenda-files (quote ("~/scratch/org/test-large.org")))
 '(package-selected-packages
   (quote
    (smart-mode-line-atom-one-dark-theme smart-mode-line \(nle-tomorrow-day\ :location\ local\)-theme nle-tomorrow-day-theme treepy graphql outshine parent-mode flx evil-anzu anzu ess-smart-equals ess-R-data-view ctable popup diminish pkg-info bind-map julia-mode xpm let-alist doom doom-themes epl white-sand-theme rebecca-theme org-mime exotica-theme highlight auto-compile ess f web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode csv-mode polymode evil-commentary bind-key ghub powerline esup ham-mode html-to-markdown smartparens goto-chg s dash-functional packed avy iedit evil projectile helm helm-core async hydra dash sass-mode robe pyenv-mode ox-pandoc orgit org-ref pdf-tools key-chord org-projectile org-pomodoro alert log4e nlinum-relative markdown-toc magit-gitflow ivy-hydra helm-bibtex parsebib gruvbox-theme git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ flyspell-correct-ivy evil-magit magit magit-popup git-commit darktooth-theme counsel-projectile counsel swiper bundler biblio auctex-latexmk anaconda-mode zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode wgrep web-mode visual-fill-column vimrc-mode underwater-theme ujelly-theme typo twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stripe-buffer spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode seti-theme scss-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode reverse-theme reveal-in-osx-finder rbenv rake rainbow-mode railscasts-theme pyvenv pytest py-isort purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persistent-scratch pbcopy pastels-on-dark-theme pandoc-mode ht osx-trash osx-dictionary organic-green-theme tablist org-category-capture org-present gntp org-download omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nlinum niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme markdown-mode majapahit-theme madhat2r-theme lush-theme live-py-mode light-soap-theme less-css-mode launchctl jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme imenu-list hy-mode htmlize heroku-theme hemisu-theme hc-zenburn-theme haml-mode gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter gh-md gandalf-theme flyspell-correct flatui-theme flatland-theme fish-mode firebelly-theme farmhouse-theme evil-snipe with-editor espresso-theme emmet-mode dracula-theme django-theme diff-hl deft autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme ivy color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme chruby cherry-blossom-theme busybee-theme inf-ruby bubbleberry-theme birds-of-paradise-plus-theme biblio-core beacon badwolf-theme auto-dictionary auctex apropospriate-theme anti-zenburn-theme pythonic ample-zen-theme ample-theme alect-themes afternoon-theme material-theme ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-aGnzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol autogg-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#263238")))))
 
