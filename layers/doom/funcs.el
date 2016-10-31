;; Doom theme setup



(defun doom/mode-line-set-evil-state ()
  
  (set-face-foreground 'mode-line-2
                       (cond ((evil-motion-state-p) "#21242B")
                             ((evil-visual-state-p) "#5fd7ff")
                             ((evil-emacs-state-p) "#be84ff")
                             ((evil-normal-state-p) "#fd971f")
                             (t "#a6e22e"))))  
