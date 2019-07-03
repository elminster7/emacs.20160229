;; ▶ Magit
(defun magit/magit-init ()
  "Magit use-package intialize."
  (use-package magit
    :commands magit-get-top-dir
    :diminish auto-revert-mode
    :ensure t
    :init
    ;; magit 오토 리버트시 버퍼의 브랜치명까지 갱신하도록
    (setq auto-revert-check-vc-info t)
    (with-eval-after-load 'info
      (info-initialize)
      (add-to-list 'Info-directory-list
                   "~/.emacs.d/site-lisp/magit/Documentation/"))
  ;;; 이맥스가 기본적으로 제공하는 Git 백엔드를 켜두면 매우 느려진다. magit만 쓴다.
    (setq vc-handled-backends nil)
    :config
    (setq vc-follow-symlinks t)
    (setq find-file-visit-truename t)
    (setq magit-refresh-status-buffer 'switch-to-buffer)
    (setq magit-rewrite-inclusive 'ask)
    (setq magit-save-some-buffers t)
    (setq magit-set-upstream-on-push 'askifnotset)
    :bind
    ("C-c m" . magit-status)
    ("C-c l" . magit-log-all)
    ("C-x c" . magit-commit)
    ("C-x p" . magit-pull))
  )

(defun git/git-grep-init ()
  "git grep use-package initialize."
  (use-package helm-git-grep
    :ensure t
    :bind
    ("C-c g" . helm-git-grep)
    ("C-c i" . helm-git-grep-isearch)))

;; ▶ Version Control package init.
(defun versioncontrol/init ()
  "Version Control package init."
  (magit/magit-init)
  (git/git-grep-init)
  )
