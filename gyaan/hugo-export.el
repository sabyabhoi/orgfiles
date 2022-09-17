(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'org)
(package-install 'ox-hugo)
(setq org-hugo-base-dir "~/workspace/userfiles/programming/web/homepage/"
      org-hugo-section "notes")

(dolist (f (directory-files "." t ".org$"))
  (with-current-buffer (find-file-noselect f)
    (message (format "exporting %s" (current-buffer)))
    (org-hugo-export-wim-to-md :all-subtrees)
    )
  )
