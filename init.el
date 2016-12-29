;; ;; -*- mode: emacs-lisp -*-
;; ;; This file is loaded by Spacemacs at startup.
;; ;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in 
this function besides modifying the variable
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
     csv
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     (auto-completion :disabled-for org git markdown text latex)
     better-defaults
     emacs-lisp
     bibtex
     osx
     themes-megapack
     ;; (git :variables git-gutter-use-fringe t)
     git
      markdown
      imenu-list  
      org
      spacemacs-layouts
      (latex :variables latex-enable-folding t latex-enable-auto-fill nil latex-build-command "LatexMk")
      python
      ess
      visual-fill-column
      ;; doom
      ;; pixif
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 30
            shell-default-position 'bottom)
      (spell-checking :variables =enable-flyspell-auto-completion= t)
      ;; ;; syntax-checking
      ;; (spell-checking)
     ( version-control :variables version-control-global-margin t version-control-diff-tool 'git-gutter)

      ;; (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)

      (typography :variables typography-enable-typographic-editing t)

      )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `otspacemacs/user-config'.
   dotspacemacs-additional-packages '(rainbow-mode beacon stripe-buffer doom-themes  evil-visual-mark-mode persistent-scratch atomic-chrome)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-check-for-update t
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
   ;; Example for 5 recent files and 7 projects: '((recents . 5) (projects . 7))
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; (default nil)
   dotspacemacs-startup-lists '((recents . 5) (projects . 5) )
   ;; Truelynchdoug02@gmail.com if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '( 
                         spacemacs-light
                         spacemacs-dark
                         twilight
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("hack"
                               :size 12
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
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
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
   dotspacemacs-large-file-size 5
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
   dotspacemacs-maximized-at-startup nil
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
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
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
  
  (add-to-list 'load-path "~/.spacemacs.d/custom")  
  (add-to-list 'load-path "~/.spacemacs.d/doom-min")  

  ;; Doom theme setup
  (require 'f) 
  (require 's) 
  (require 'powerline)
  (require 'dash)
  (require 'evil)
  (require 'core-defuns)
  (require 'core)
  (defvar doom-ediff-enabled nil)
  ;; (load-theme 'doom-one)                ;
  (require 'defuns-projectile)
  (require 'core-modeline)
  (require 'core-project)
  
  (set-face-attribute 'mode-line-2 nil :foreground "royalblue" )  
  ;; (set-face-attribute 'mode-line-2 nil :foreground "royalblue" :weight 'bold)  
  (set-face-attribute 'mode-line-count-face nil :foreground "slateblue") 
  (require 'core-ui-min)
  (require 'core-vcs-min)

  ; these faces don't currently get set by the theme 
  
  (set-face-attribute 'ivy-current-match nil :background "lightgoldenrod")
  (set-face-attribute 'vhl/default-face nil :background "slategray1")
  
  (setq evil-normal-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("green" box))
  (defun mode-line-set-evil-state ()
    (set-face-foreground 'mode-line-2
                         (cond ((evil-motion-state-p) "#21242B")
                               ((evil-visual-state-p) "#5fd7ff")
                               ((evil-emacs-state-p) "#be84ff")
                               ((evil-normal-state-p) "#fd971f")
                               (t "#a6e22e")))
                               )



  (add-hook 'post-command-hook 'mode-line-set-evil-state)

  (blink-cursor-mode 1)
  ;; (setq-default fringes-outside-margins t)
  (set-face-attribute 'mode-line nil :box nil)

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
  (set-fringe-mode '(30 . 30))
  (global-vi-tilde-fringe-mode -1)


  (global-visual-line-mode 1)
  ;; (global-hl-line-mode -1)
  (defun visual-line-range ()
    (save-excursion
      (cons
       (progn (beginning-of-visual-line) (point))
       (progn (end-of-visual-line) (point)))))

  (setq hl-line-range-function 'visual-line-range)


  (setq-default spacemacs-show-trailing-whitespace nil)
  ;; (setq show-trailing-whitespace nil)

  (setq powerline-default-separator nil) 
  (spaceline-toggle-minor-modes-off)

  (setq default-frame-alist '((height . 84) (width . 95)))
  (setq line-spacing 3)
  (setq-default line-spacing 3)
  (setq text-scale-mode-step 1.1)


  ;; (setq visual-fill-column-fringes-outside-margins t) 
  ;; (persistent-scratch-setup-default)    ;
  (setq  persistent-scratch-backup-directory  "~/.emacs.d/private/local/") 
  (setq persistent-scratch-save-file "~/.emacs.d/private/local/.persistent-scratch")

  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

  ;; Setup evil-mode shortcuts for jumping
  (define-key evil-normal-state-map (kbd "gc") 'avy-goto-char)
  (define-key evil-normal-state-map (kbd "gl") 'avy-goto-line)

  (define-key evil-normal-state-map (kbd "gw") 'avy-goto-word-1)
  (define-key evil-normal-state-map (kbd "gs") 'avy-goto-char-2)
  (define-key evil-normal-state-map (kbd "gt") 'avy-goto-char-2)
  (define-key evil-normal-state-map (kbd "s") 'avy-goto-char-2)


  (require 'avy)
  (set-face-attribute 'avy-lead-face nil :foreground "dark magenta" :weight 'bold)
  (set-face-attribute 'avy-lead-face-0 nil :foreground "red" :weight 'bold)
  (set-face-attribute 'avy-lead-face-1 nil :weight 'bold)

;; Evil mode tweaks to accomodate visual lines, emacs undo
  (setq evil-move-cursor-back nil)
  (setq evil-cross-lines t)
  (setq evil-symbol-word-search t)
  (setq evil-want-fine-undo t)
  
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)

  (with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

  ;; need to wait to load LaTeX before changing faces 
  (with-eval-after-load "tex"           ;

    ;; (set-face-attribute 'font-latex-sectioning-4-face  nil :foreground "royalblue") ;
    )

(require  'nle-funcs)
(require 'nle-tomorrow-day-theme)

(spacemacs|disable-company org-mode)
(spacemacs|disable-company markdown-mode)
(spacemacs|disable-company text-mode)
(define-key global-map "\M-Q" 'unfill-paragraph)
(eval-after-load "flyspell" '(progn
                               (define-key flyspell-mouse-map (kbd "<s-mouse-1>") #'flyspell-correct-word)
                               ))


;; markdown mode customizations
(setq markdown-footnote-location 'immediately)

(add-hook 'mail-mode-hook (lambda()
                           (make-face 'markdown-reference-face)
                           (make-face 'markdown-latex-face)

                           
                           (set-face-attribute 'markdown-reference-face nil
                                               :weight 'bold
                                               :height 1.0
                                               :foreground "darkgreen")
 
                           (set-face-attribute 'markdown-latex-face nil
                                               :weight 'bold
                                               :height 0.9
                                               :foreground "grey30")


                           (font-lock-add-keywords 'markdown-mode
                                                   '(("\\[@.*?\\]" . markdown-reference-face)))

                           (font-lock-add-keywords 'markdown-mode
                                                   '(("%%.*" . markdown-reference-face)))


))


(add-hook 'org-mode-hook (lambda()
                           (make-face 'org-reference-face)

                           (set-face-attribute 'org-reference-face nil
                                               :weight 'bold
                                               :height 1.0
                                               :foreground "darkgreen"
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
                                               )
  ))

(setq reftex-default-bibliography '("/Users/nensmeng/data/1-academic/Research/0-envirocompute/0-dirty-bits-latex/enviro-compute.bib"))


(defvar reftex-cite-format-markdown

  '(?\C-m . "[@%l]")
  "Reftex citation format compatible with pandoc markdown.") 

(defun my-markdown-mode-hook()
  (define-key markdown-mode-map "\C-c["
    (lambda ()
      (interactive)
      (let ((reftex-cite-format "[@%l]" ))
        (reftex-citation)))))


(add-hook 'markdown-mode-hook 'my-markdown-mode-hook) 

;; (set-face-attribute 'variable-pitch nil :family "Ubuntu Mono" :inherit 'default) ;

  (set-face-attribute 'variable-pitch nil :family "Museo Sans" :inherit 'default :height 130)
  ;; (add-hook 'markdown-mode-hook (lambda () (variable-pitch-mode nil)))
  ;; (add-hook 'org-mode-hook (lambda () (variable-pitch-mode nil)))
  ;; (set-face-attribute 'default nil :foreground "grey")
;; misc-config

(set-face-attribute 'default nil :family "ubuntu mono" :foreground "grey10" :height 140)
;; (set-face-attribute 'variable-pitch nil :family "Roboto Mono" :height 140 :weight 'normal)
(set-face-attribute 'variable-pitch nil :family "hack" :height 140)
;; (set-face-attribute 'variable-pitch nil :family "consolas" :height 150)
;; (set-face-attribute 'variable-pitch nil :family "espresso mono" :height 140)
;; trying fuzzy matching with counsel/ivy
;; (setq ivy-re-builders-alist 
;;       '((t . ivy--regex-fuzzy)))

;; (setq gc-cons-threshold 50000000)


;; (require 'atomic-chrome)
;; (atomic-chrome-start-server)
(setq create-lockfiles nil)
(beacon-mode 1)
(setq beacon-blink-when-buffer-changes t
      beacon-blink-when-point-moves-vertically 10)

(setq abbrev-file-name "~/.spacemacs.d/abbrev_defs")
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

;; relocate bookmark file to git-controlled .spacemacs.d
(setq bookmark-default-file "~/.spacemacs.d/bookmarks")

;; disable arrow keys to get practice
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

;; ZEBRA: quickly search to get here

)



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "398f0209bfd642cf7a5e3e03bdc20db2822fd6746225a4bd99ccf9b26d3059d0" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" default)))
 '(fci-rule-color "#ECEFF1" t)
 '(hl-sexp-background-color "#efebe9")
 '(package-selected-packages
   (quote
    (relative-line-numbers nlinum-relative autothemer seq xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode pcache atomic-chrome websocket csv-mode persistent-scratch hide-comnt web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode company-web web-completion-data doom-one-theme-theme doom-one-theme stripe-buffer beacon rainbow-mode flycheck-pos-tip pos-tip flycheck doom-themes imenu-list doom-themes all-the-icons font-lock+ org-ref key-chord helm-bibtex parsebib biblio biblio-core typo evil-snipe visual-fill-column pixie-mode inf-clojure clojure-mode zonokai-theme zenburn-theme zen-and-art-theme yapfify underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle seti-theme reverse-theme reveal-in-osx-finder railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pbcopy pastels-on-dark-theme osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org org-pomodoro alert log4e gntp org-download omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mwim mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow lush-theme live-py-mode light-soap-theme launchctl jbeans-theme jazz-theme ir-black-theme inkpot-theme hy-mode htmlize heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme flyspell-correct-ivy flyspell-correct flatui-theme flatland-theme firebelly-theme farmhouse-theme evil-magit magit magit-popup git-commit with-editor espresso-theme dracula-theme django-theme diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-statistics company-auctex company-anaconda company colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet auto-dictionary auctex-latexmk auctex apropospriate-theme anti-zenburn-theme anaconda-mode pythonic ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell auto-complete ws-butler window-numbering which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup f s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash async aggressive-indent adaptive-wrap ace-window ace-link avy quelpa package-build spacemacs-theme)))
 '(safe-local-variable-values (quote ((eval variable-pitch-mode nil))))
 '(vc-annotate-background "#181e26")
 '(vc-annotate-color-map
   (quote
    ((20 . "#98be65")
     (40 . "#b4be6c")
     (60 . "#d0be73")
     (80 . "#ECBE7B")
     (100 . "#e6ab6a")
     (120 . "#e09859")
     (140 . "#da8548")
     (160 . "#d38079")
     (180 . "#cc7cab")
     (200 . "#c678dd")
     (220 . "#d974b7")
     (240 . "#ec7091")
     (260 . "#ff6c6b")
     (280 . "#d6696a")
     (300 . "#ad6769")
     (320 . "#836468")
     (340 . "#5B6268")
     (360 . "#5B6268"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
