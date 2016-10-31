;;; packages.el --- visual-fill-column layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Nathan Ensmenger <nensmeng@140-182-215-11.dhcp-bl.indiana.edu>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `visual-fill-column-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `visual-fill-column/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `visual-fill-column/pre-init-PACKAGE' and/or
;;   `visual-fill-column/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:


;; (setq visual-fill-column-packages)
(defconst doom-packages 
  '(
f
s
powerline
evil
core-defuns
core
defuns-projectile
core-modeline
core-project
core-ui-min
core-vcs-min
    ))

(defun doom/init-doom()
  "initialize doom layer"


   )

  







;;; packages.el ends here
