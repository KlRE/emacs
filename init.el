;________compile________;

(defun compileandrun()
  (interactive)
  (save-buffer)
  (ignore-errors
    (kill-compilation))
  (compile(concat "g++ \"" (file-name-nondirectory(buffer-file-name)) "\" -o \"" (file-name-sans-extension(file-name-nondirectory(buffer-file-name)))  "\" && \"" (file-name-sans-extension(file-name-nondirectory(buffer-file-name))) "\"") (and t))
  (other-window 1)
  (end-of-buffer))

(add-hook 'c++-mode-hook
	  (lambda()
	    (interactive)
	    (define-key c++-mode-map (kbd "<f9>") #'compileandrun)
	    ))
(add-hook 'comint-mode-hook
	  (lambda()
	    (local-set-key (kbd "<f9>") 'recompile)
;	    (local-set-key (kbd "<f8>") (lambda ()(interactive)(setq compilation-always-kill t)(recompile) (setq compilation-always-kill nil)
					  ))


;_________________________default settings__________________________;

(delete-selection-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(electric-pair-mode 1)
(setq compilation-always-kill t)

;;electric pair disabled for ()
;(setq electric-pair-inhibit-predicate
;      (lambda (c)
;	(if (char-equal c ?\()t (electric-pair-default-inhibit c))))


;; zoning when idle
(require 'zone)
(zone-when-idle 600)

;;display lines
(add-hook 'prog-mode-hook 'global-display-line-numbers-mode)

;; automatic insertion of templates
(require 'autoinsert)
(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "C:/Users/erikw/Documents/c++/template/") ;;; *NOTE* Trailing slash important
;;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(define-auto-insert "\.cpp" "template.cpp")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


(define-key key-translation-map [(control meta ?7)] [?\{])
(define-key key-translation-map [(control meta ?8)] [?\[])
(define-key key-translation-map [(control meta ?9)] [?\]])
(define-key key-translation-map [(control meta ?0)] [?\}])
(define-key key-translation-map [(control meta ?ß)] [?\\])
