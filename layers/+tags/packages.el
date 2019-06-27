;; use package tags settings

(defun cscope/init-helm-cscope ()
  "cscope package install"
  (use-package helm-cscope
    :defer t
    :init
    (add-hook 'c-mode-hook 'helm-cscope-mode)
    (add-hook 'c++-mode-hook 'helm-cscope-mode)
    (add-hook 'asm-mode-hook 'helm-cscope-mode)
    :bind
    (("C-c c" . helm-cscope-find-calling-this-function)
     ("C-c ]" . helm-cscope-find-global-definition)
     ("C-c [" . helm-cscope-pop-mark)
     ("C-c t" . helm-cscope-find-this-text-string)
     ("C-c n" . helm-cscope-find-egrep-pattern))
    ))

(defun helm-gtags/init-helm-gtags ()
  "Helm gtags setting."
  (use-package helm-gtags
    :ensure t
    :commands (helm-gtags-mode helm-gtags-dwim)
    :diminish "HGt"
    :init
    ;; Enable helm-gtags-mode in code
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'asm-mode-hook 'helm-gtags-mode)
    ;; gtags setting
    (setq helm-gtags-ignore-case t
          helm-gtags-auto-update t
          helm-gtags-use-input-at-cursor t
          helm-gtags-pulse-at-cursor t)
    :bind
    (("M-t" . helm-gtags-pop-stack)
     ("M-]" . helm-gtags-find-tag)
     ("M-[" . helm-gtags-find-rtag)
     ("M-." . helm-gtags-dwim)
     ("M-," . helm-gtags-tags-in-this-function)
     ("M-o" . helm-gtags-find-tag-other-window)
     ;; terminal key binding for osx
     ("†" . helm-gtags-pop-stack)
     ("‘" . helm-gtags-find-tag)
     ("“" . helm-gtags-find-rtag)
     ("≥" . helm-gtags-dwim)
     ("≤" . helm-gtags-tags-in-this-function)
     ("ø" . helm-gtags-find-tag-other-window)
    )))

;; tags packages init
(defun tags/init ()
  "tags package init"
  (cscope/init-helm-cscope)
  (helm-gtags/init-helm-gtags))
