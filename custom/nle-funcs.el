(defun new-buffer ()
    "Open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and default-major-mode))
    (setq buffer-offer-save t)))

(dolist (hook '(erc-mode-hook
        LaTeX-mode-hook
        org-mode-hook
        edit-server-start-hook˘
        markdown-mode-hook))
  (add-hook hook (lambda () (variable-pitch-mode t))))

(defun open-init ()     
  (interactive)     
      (find-file "~/.emacs.d/init-org.org"))


 (defun mac-open-terminal ()
    (interactive)
    (let ((dir ""))
      (cond
       ((and (local-variable-p 'dired-directory) dired-directory)
	(setq dir dired-directory))
       ((stringp (buffer-file-name))
	(setq dir (file-name-directory (buffer-file-name))))
       )
      (do-applescript
       (format "
 tell application \"Terminal\"
   activate
   try
       tell application \"System Events\" to keystroke \"t\" using command down

delay 2


     do script with command \"cd %s\"
   on error
     beep
   end try
 end tell" dir))
      ))
 

(defvar nle/book-notes-directory "/Users/Shared/Data/1-academic/simplenotes/")
(defun nle/helm-do-grep-book-notes ()
  "Search my book notes."
  (interactive)
  (helm-do-grep-1 (list nle/book-notes-directory)))

(global-set-key (kbd "A-M-n") 'nle/helm-do-grep-book-notes)




(defun nle-space (lines)
(setq line-spacing lines)
)


(defun nle-1 ()
(interactive)
(nle-space 1)
)

(defun nle-2 ()
(interactive)
(nle-space 2)
)

(defun nle-3 ()
(interactive)
(nle-space 3)
)
(defun nle-4 ()
  (interactive)
  (nle-space 4)
  )

(defun nle-5 ()
  (interactive)
  (nle-space 5)
  )

(defun nle-light ()
(interactive)

;(disable-theme dark-theme)
;(load-theme light-theme t)

;(set-background-color "#F6F3EF")
;(set-face-attribute 'region nil :background "light blue")
;(set-face-attribute 'default  nil :foreground "grey10")


;; (set-face-attribute 'mode-line nil
;;                     :foreground "orange"
;;                     :box nil)



(nle-p1)
(nle-init)
)


(defun nle-set-pfont (size)
  (interactive)
   (set-face-attribute 'default nil :family proportional-font :height size)
  )

(defun nle-set-mfont (size)
  (interactive)
  (set-face-attribute 'default nil :family mono-font :height size)
  (set 'line-spacing mono-space)
  )


 (defun nle-set-bmono ()
   "Sets a fixed width (monospace) font in current buffer"
   (interactive)
   (setq buffer-face-mode-face '(:family "ubuntu mono" :height 150))
   (buffer-face-mode))

;;(add-hook 'dired-mode-hook 'nle-set-bmono)
;;(add-hook 'tabulated-list-mode-hook 'nle-set-bmono)



(defun nle-p1 ()
  (interactive)
  (set-face-attribute 'default nil :family "museo sans" :height 140)
  (set 'line-spacing 2)

  )


(defun nle-p2 ()
  (interactive)
  (set-face-attribute 'default nil :family "museo sans" :height 150)
  )

(defun nle-m1 ()
  (interactive)
  (set-face-attribute 'default nil :family mono-font :height mono-size)
  )

(defun nle-d1 ()
  (interactive)
  (spacemacs/load-theme 'material)
  (set-face-attribute 'default nil :family "inconsolata" :height 180 :foreground "grey85")
  (set-face-attribute 'variable-pitch nil :family "Nunito" :height 180 :foreground "grey70")

  (nle-4)

  )


(defun nle-l1 ()
  (interactive)
  (spacemacs/load-theme 'material-light ) 
  (set-face-attribute 'default nil :family "menlo" :height 140 :foreground "grey15")
  (set-face-attribute 'variable-pitch nil :family "roboto" :height 160 :foreground "grey15") 
  (nle-4)

  )




(defun nle-dark ()
(interactive)

(disable-theme light-theme)
(load-theme dark-theme t)


(nle-m1)
(set-face-attribute 'region nil :foreground "royal blue")
(set 'line-spacing 3)
(nle-init)
)


(defun nle-init ()
  "initialize frame according to my preferences"
  (interactive)

 (set-face-background 'fringe nil)
 (set-face-attribute 'mode-line nil :box nil)

 )

(defun nle-scratch ()
  "switch to scratch buffer"
  (interactive)
  (switch-to-buffer "*scratch*")
  )


(defun clear-fringe ()
  (interactive)
 (set-face-background 'fringe nil)

 )  
 
(defun set-fringe ()
  (interactive)
  (set-fringe-mode '(20 . 30))
  )

(defun set-fringe-wide ()
  (interactive)
  (set-fringe-mode '(40 . 40))
  )

;;;; fill-paragraph
;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph (&optional region)
      "Takes a multi-line paragraph and makes it into a single line of text."
      (interactive (progn (barf-if-buffer-read-only) '(t)))
      (let ((fill-column (point-max)))
        (fill-paragraph nil region)))

(define-key global-map "\M-Q" 'unfill-paragraph)

;; make whitespace-mode use just basic coloring
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))


(setq whitespace-display-mappings
       ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [182 10]) ; 10 LINE FEED
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))


(require 'color)

(defun set-hl-line-color-based-on-theme ()
  "Sets the hl-line face to have no foregorund and a background
    that is 10% darker than the default face's background."
  (set-face-attribute 'hl-line nil
                      :foreground nil
                      :background (color-darken-name (face-background 'default) 10)))

(add-hook 'global-hl-line-mode-hook 'set-hl-line-color-based-on-theme)

(defun nle-setup-imenu-for-use-package ()
  "Recognize `use-package` in imenu"
  (when (string= buffer-file-name (expand-file-name "init.el" "~/.emacs.d"))
    (add-to-list
     'imenu-generic-expression
     '(nil "^\\s-*(\\(use-package\\)\\s-+\\(\\(\\sw\\|\\s_\\)+\\)" 2))))

;;;; emacs lisp
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)
(add-hook 'emacs-lisp-mode-hook 'nle-setup-imenu-for-use-package)


(when (memq window-system '(mac ns))
  
;(set-face-attribute 'tabbar-default nil :background "grey80" :family "Helvetica Neue" :height 110)
;(set-face-attribute 'tabbar-highlight nil :background "grey40" :family "Helvetica Neue" :height 110)

;(set-face-attribute 'tabbar-selected nil :family "Helvetica Neue" :background "grey90" :foreground "black" :height 110  :box '(:line-width 3 :color "grey90" :style nil))

;(set-face-attribute 'tabbar-unselected nil :family "Helvetica Neue" :background "grey70" :foreground "black" :height 110 :box '(:line-width 3 :color "grey70" :style nil))

;; (set-face-attribute 'font-latex-sectioning-5-face nil :inherit `default :height 1.0)

  )



(defhydra hydra-outline (:color red :hint nil)
  "
^Hide^             ^Show^           ^Move
^^^^^^------------------------------------------------------
_1_: sublevels     _3_: all         _u_: up
_2_: body          _t_: entry       _n_: next visible
_e_: other         _c_: children    _p_: previous visible
_m_: entry         _b_: branches    _f_: forward same level
_l_: leaves        _s_: subtree     _b_: backward same level
_d_: subtree

"
  ;; Hide
  ("1" hide-sublevels)    ; Hide everything but the top-level headings
  ("2" hide-body)         ; Hide everything but headings (all body lines)
  ("e" hide-other)        ; Hide other branches
  ("m" hide-entry)        ; Hide this entry's body
  ("l" hide-leaves)       ; Hide body lines in this entry and sub-entries
  ("d" hide-subtree)      ; Hide everything in this entry and sub-entries
  ;; Show
  ("3" show-all)          ; Show (expand) everything
  ("t" show-entry)        ; Show this heading's body
  ("c" show-children)     ; Show this heading's immediate child sub-headings
  ("b" show-branches)     ; Show all sub-headings under this heading
  ("s" show-subtree)      ; Show (expand) everything in this heading & below
  ;; Move
  ("u" outline-up-heading)                ; Up
  ("n" outline-next-visible-heading)      ; Next
  ("p" outline-previous-visible-heading)  ; Previous
  ("f" outline-forward-same-level)        ; Forward - same level
  ("b" outline-backward-same-level)       ; Backward - same level
  ("q" nil "leave"))

(global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example

(provide 'nle-funcs)

(defun buffer-same-mode (change-buffer-fun)
  (let ((current-mode major-mode)
        (next-mode nil))
    (while (not (eq next-mode current-mode))
      (funcall change-buffer-fun)
      (setq next-mode major-mode))))

(defun previous-buffer-same-mode ()
  (interactive)
  (buffer-same-mode #'previous-buffer))

(defun next-buffer-same-mode ()
  (interactive)
  (buffer-same-mode #'next-buffer))

(global-set-key (kbd "s-`") 'next-buffer-same-mode)
(global-set-key (kbd "s-t") 'next-buffer-same-mode)


(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p))
         (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((and (boundp 'org-src-mode) org-src-mode (not p)) ; <-- Added
         (org-edit-src-exit))
        ((derived-mode-p 'org-mode)
         (cond ((org-in-src-block-p)
                (org-edit-src-code))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))
