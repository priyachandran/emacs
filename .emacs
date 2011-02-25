(add-to-list 'load-path "~/.emacs.d")
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)
(require 'linum+)
(setq text-mode-hook 'turn-on-auto-fill)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")

(load "time" t t)
(display-time)
(line-number-mode 1)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Custom font colouring.

(make-face 'font-lock-special-macro-face)
(set-face-foreground 'font-lock-special-macro-face "pink")

(defun add-custom-keyw()
  "adds a few special keywords for c and c++ modes"
  ;
  (font-lock-add-keywords nil
   '(
     ("\\<\\(DATE\\)" . 'font-lock-special-macro-face )
     ("\\<\\(PRIORITY\\)" . 'font-lock-special-macro-face )
     ("\\<\\(POSTPONE\\)" . 'font-lock-special-macro-face)

     ; more of those would go here
     )
   )
 )

(add-hook 'text-mode-hook 'add-custom-keyw)

(global-set-key [f5] 'linum-mode)
(global-set-key [f1] "\C-x\C-s")
(global-set-key (kbd "C-c p") "\C-a\C-k\C-k\C-y\C-y")
(global-set-key (kbd "C-c l") 'goto-line)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
;; With numeric ARG, display the tool bar if and only if ARG is
;; positive.  Tool bar has icons document (read file), folder (read
;; directory), X (discard buffer), disk (save), disk+pen (save-as),
;; back arrow (undo), scissors (cut), etc.
(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-scroll-bar 0)
(show-paren-mode 1)
(set-display-table-slot standard-display-table 'wrap ?\ )
