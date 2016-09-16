;;;emmms

;;(add-to-list 'load-path "~/.emacs.d/emms/")
;;(require 'emms-setup)
;;(emms-standard)
;;(emms-default-players)

;; telegram mode? -- not yet

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;;flymake
(require 'flymake)
(setq flymake-allowed-file-name-masks
    (delete '("[0-9]+\\.tex\\'"
        flymake-master-tex-init
        flymake-master-cleanup)
        flymake-allowed-file-name-masks)) ; don't use multipart tex files
;; https://stackoverflow.com/questions/9422666/emacs-23-4-1-latex-flymake-mode-cant-find-master-file
(defun flymake-get-tex-args (file-name)
    (list "pdflatex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
;;http://www.emacswiki.org/emacs/FlymakeTex
(add-to-list
    `flymake-err-line-patterns
    '("Runaway argument?" nil nil nil)) 

;;;https://stackoverflow.com/questions/18776079/using-emacs-for-tex-files-with-flymake-error-with-unbalanced-braces


;;for effective arbtt
(setq frame-title-format "emacs: %f")

;there is python, haskell, d, rust
;;Add new lines auto
;;(setq next-line-add-newlines t)
;;Backup files
(setq backup-directory-alist '(("." . "~/.backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions nil  ;do  Automatically delete excess backups
  kept-new-versions 200   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))) ;;autosave files

;;elm setup -- not needed any more


;;Lisp setup

(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-lisp-implemenations
      '((sbcl ("/usr/bin/sbcl"))
	(ecl ("/usr/bin/ecl"))
	(clisp ("/usr/bin/clisp")))
      
      )

;;(add-hook 'slime-load-hook
;   #'(lambda ()
;       (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)))
;just an example kdb from the docs

;;haskell config
;;https://github.com/haskell/haskell-mode/wiki/Haskell-Interactive-Mode-Setup
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(require 'haskell-interactive-mode)
;;(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;;setting background
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes (quote ("7bf64a1839bf4dbc61395bd034c21204f652185d17084761a648251041b70233" default)))
 '(doc-view-continuous t)
 '(ecb-options-version "2.40")
 '(fringe-mode 6 nil (fringe))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(linum-format " %7d ")
 '(main-line-color1 "#191919")
 '(main-line-color2 "#111111")
 '(powerline-color1 "#191919")
 '(powerline-color2 "#111111"))

;;ecb:
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'ecb)
(setq ecb-layout-name "leftright1") ;;http://ecb.sourceforge.net/docs/Changing-the-ECB-layout.html
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)



;;(set-background-color "blue") ;;set color
;;adding package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(setq url-http-attempt-keepalives nil) ;; prevent time out
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Set Aspell as our spell check
(setq-default ispell-program-name "aspell")
(add-hook 'fundamental-mode-hook 'flyspell-mode)
(add-hook 'fundamental-mode-hook 'flyspell-buffer)



;;set auto complete for mini-buffer to work with ido:
(require 'ido)
(ido-mode t)

;;fill col indicator - later
;;(require 'fill-column-indicator)



;;Set up shell/xonsh/term asap and ability to switch to it:
(shell "*shell0*")
(global-set-key [(control \1)]
  (lambda () (interactive) (switch-to-buffer "*shell0*")))

(ansi-term "/usr/local/bin/xonsh" "*xonsh0*")
(global-set-key [(control \2)]
		(lambda () (interactive) (switch-to-buffer "**xonsh0**") ))
(ansi-term "/bin/bash" "*term0*")
(global-set-key [(control \3)]
		(lambda () (interactive) (switch-to-buffer "**term0**") ))


;;see http://www.emacswiki.org/emacs/ShellMode#toc1
(add-hook 'comint-output-filter-functions
	  'comint-strip-ctrl-m)
;;(term "*ansi-term*")
;;(global-set-key [(control \0)]
;;		(lambda () (interactive) (switch-to-buffer "*ansi-term0*")))

;; pymacs
(add-to-list 'load-path "~/.emacs.d/Pymacs")

(autoload 'pymacs-apply "pymacs")

(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;;ipython
(defvar server-buffer-clients)
(when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
  (server-start)
  (defun fp-kill-server-with-buffer-routine ()
    (and server-buffer-clients (server-done)))
  (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))


;;org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;;Latex stuff:

;;yas enabled in tex


(add-hook 'LaTeX-mode-hook #'global-flycheck-mode)

;;Latex flymake

;;spelling for latex mode:
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(add-to-list
    `flymake-err-line-patterns
    '("Runaway argument?" nil nil nil))


;;if a mac, make sure that auctex, pdflatex, and ghostscript play well togeather
(if (eq system-type 'darwin)
    (
     (getenv "PATH")
     (setenv "PATH"
	     (concat
	      "/usr/texbin" ":"

	      (getenv "PATH")))
     (setq exec-path (append exec-path '("/usr/texbin/")))
     (setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))
     (setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
     (setq exec-path (append exec-path '("/opt/local/bin")))
     
     (setenv "PATH" (concat "/usr/texbin:/opt/local/bin:" (getenv "PATH")))
     (setq exec-path (append exec-path '("/opt/local/bin")))
     (setenv "PATH" (concat "/usr/local/bin/:" (getenv "PATH")))))

;;auctex bibtex
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.
;;("BibTeX" "bibtex $s" TeX-run-BibTeX nil t :help "Run BibTeX")
;;not need because of package-installx
;;post package loading




;;sml
(add-hook 'sml-mode-hook 'turn-on-font-lock)
(setq sml-program-name "sml")


(package-initialize)


;;get auto-complete working in all major modes
(global-auto-complete-mode 1)
(show-paren-mode 1)

(electric-pair-mode 1)
(visual-line-mode 1)

(add-hook 'LaTeX-mode-hook #'yas-minor-mode)
(yas-global-mode 1)
(yas-global-mode 0);;because yas-global mode does not work with shells b/c tabs get sent with TAB vs <tab> (or someshit like that..) we can't use the minor mode but we need to have all the yas's loaded automatically and yas-reload isn't working without first calling this for some reason unknown 
(yas-reload-all)

;;(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)));;disabled in tex
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(put 'upcase-region 'disabled nil)



