(defun helm-imenu/init-helm-imenu ()
  "helm imenu buffer initailize"
  (bind-key "C-f" 'helm-imenu)
  (bind-key "C-h" 'helm-imenu-in-all-buffers))

;; tags packages init
(defun tools/init ()
  "tools package init"
  (helm-imenu/init-helm-imenu))
