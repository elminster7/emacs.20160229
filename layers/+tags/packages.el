(defun cscope/init-helm-cscope ()
  (use-package helm-cscope
    :defer t
    :init
    (add-hook 'c-mode-hook 'helm-cscope-mode)
    (add-hook 'c++-mode-hook 'helm-cscope-mode)
    (add-hook 'asm-mode-hook 'helm-cscope-mode)
    :config
    (bind-key "C-c" 'helm-cscope-find-calling-this-function)
    (bind-key "C-]" 'helm-cscope-find-global-definition)
    (bind-key "C-[" 'helm-cscope-pop-mark)
    (bind-key "C-t" 'helm-cscope-find-this-text-string)
    (bind-key "C-n" 'helm-cscope-find-egrep-pattern)
;;    (bind-key "" 'helm-cscope-find-calling-this-function)
;;    (bind-key "ß" 'helm-cscope-find-this-text-string)
    ;;    (bind-key "ƒ" 'helm-cscope-find-egrep-pattern)
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
    )
    :config
    (bind-key "M-t" 'helm-gtags-pop-stack)
    (bind-key "M-]" 'helm-gtags-find-tag)
    (bind-key "M-[" 'helm-gtags-find-rtag)
    (bind-key "M-." 'helm-gtags-dwim)
    (bind-key "M-," 'helm-gtags-tags-in-this-function)
    (bind-key "C-j" 'helm-gtags-select)
    (bind-key "M-o" 'helm-gtags-find-tag-other-window)
    (bind-key "M-g M-p" 'helm-gtags-parse-file)
    ;; terminal key bindings
    (bind-key "≥" 'helm-gtags-dwim)
    (bind-key "‘" 'helm-gtags-find-tag)
    (bind-key "“" 'helm-gtags-find-rtag)
    (bind-key "≤" 'helm-gtags-tags-in-this-function)
    (bind-key "ø" 'helm-gtags-find-tag-other-window)
    (bind-key "†" 'helm-gtags-pop-stack)
    )

;; tags packages init
(defun tags/init ()
  "tags package init"
  (cscope/init-helm-cscope)
  (helm-gtags/init-helm-gtags))
