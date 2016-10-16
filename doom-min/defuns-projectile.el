;;; defuns-projectile.el

;;;###autoload
(defun doom/project-root (&optional strict-p)
  "Get the path to the root of your project."
  (let (projectile-require-project-root strict-p)
    (projectile-project-root)))

;;;###autoload
(defun doom/project-has-files (files &optional root)
  "Return non-nil if FILES exist in the project root."
  (let ((root (or root (doom/project-root)))
        (files (if (listp files) files (list files)))
        (found-p (if files t)))
    (while (and found-p files)
      (let ((file (expand-file-name (pop files) root)))
        (setq found-p (if (string-suffix-p "/" file)
                          (file-directory-p file)
                        (file-exists-p file)))))
    found-p))

;;;###autoload
(defun doom/project-p (&optional strict-p)
  "Whether or not this buffer is currently in a project or not."
  (let ((projectile-require-project-root strict-p))
    (projectile-project-p)))

;;;###autoload
(defalias 'doom/project-name 'projectile-project-name)

(provide 'defuns-projectile)
;;; defuns-projectile.el ends here
