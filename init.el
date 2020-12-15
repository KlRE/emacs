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

;;set startup Directory
(setq default-directory "C:/Users/erikw/OneDrive/C++/")

;;electric pair disabled for ()
;(setq electric-pair-inhibit-predicate
;      (lambda (c)
;	(if (char-equal c ?\()t (electric-pair-default-inhibit c))))

;;packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; zoning when idle
(require 'zone)
(zone-when-idle 600)

;;display lines
(add-hook 'prog-mode-hook 'global-display-line-numbers-mode)


;;hide toolbar (and scrollbar)
(menu-bar-mode -1)
;(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;auto-inserting template for C++
(auto-insert-mode)
(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
     '("Short description: "
       ;;"/*" \n
       ;;(file-name-nondirectory (buffer-file-name))
       ;;" -- " str \n
       ;;"Written on " (format-time-string "%A, %e %B %Y.") \n
       ;;" */" > \n \n
       "#include <iostream>" \n 
       "#include <algorithm>" \n
       "#include <vector>" \n 
       "#include <string>" \n \n
       "using namespace std;" \n \n
       "int main()" \n
       "{" > \n  
       > _ \n
       "}" > \n)))


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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#ebdbb2" "#9d0006" "#98971a" "#b57614" "#076678" "#d3869b" "#689d6a" "#3c3836"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#7c6f64")
 '(cua-overwrite-cursor-color "#b57614")
 '(cua-read-only-cursor-color "#98971a")
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2dff5f0b44a9e6c8644b2159414af72261e38686072e063aa66ee98a2faecf0e" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(fci-rule-color "#ebdbb2")
 '(highlight-changes-colors '("#d3869b" "#8f3f71"))
 '(highlight-symbol-colors
   '("#ed94d1d39b5c" "#d6a5dca3af86" "#eb90bc25933d" "#e1bec426b1e4" "#e40dda889de7" "#ef28c40e9555" "#c667cd42b3b9"))
 '(highlight-symbol-foreground-color "#665c54")
 '(highlight-tail-colors
   '(("#ebdbb2" . 0)
     ("#c6c148" . 20)
     ("#82cc73" . 30)
     ("#5b919b" . 50)
     ("#e29a3f" . 60)
     ("#df6835" . 70)
     ("#f598a7" . 85)
     ("#ebdbb2" . 100)))
 '(hl-bg-colors
   '("#e29a3f" "#df6835" "#cf5130" "#f598a7" "#c2608f" "#5b919b" "#82cc73" "#c6c148"))
 '(hl-fg-colors
   '("#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7"))
 '(hl-paren-colors '("#689d6a" "#b57614" "#076678" "#8f3f71" "#98971a"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(inhibit-startup-screen t)
 '(lsp-ui-doc-border "#665c54")
 '(nrepl-message-colors
   '("#9d0006" "#af3a03" "#b57614" "#747400" "#c6c148" "#004858" "#689d6a" "#d3869b" "#8f3f71"))
 '(package-selected-packages
   '(zenburn-theme dracula-theme solarized-theme spacemacs-theme))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pos-tip-background-color "#ebdbb2")
 '(pos-tip-foreground-color "#665c54")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#ebdbb2" 0.2))
 '(term-default-bg-color "#fbf1c7")
 '(term-default-fg-color "#7c6f64")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#9d0006")
     (40 . "#ab324a550b62")
     (60 . "#b0da61140f75")
     (80 . "#b57614")
     (100 . "#ad01822d15d7")
     (120 . "#a85287bf16d2")
     (140 . "#a3608d2917dc")
     (160 . "#9e26926f18f4")
     (180 . "#98971a")
     (200 . "#8bd699a03aed")
     (220 . "#84849aa247bf")
     (240 . "#7c5b9ba153ba")
     (260 . "#731d9c9f5f38")
     (280 . "#689d6a")
     (300 . "#4df186d970f7")
     (320 . "#3e5d7bc873bc")
     (340 . "#2af870f57639")
     (360 . "#076678")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#fbf1c7" "#ebdbb2" "#750000" "#9d0006" "#747400" "#98971a" "#8a5100" "#b57614" "#004858" "#076678" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#7c6f64" "#3c3836"))
 '(xterm-color-names
   ["#ebdbb2" "#9d0006" "#98971a" "#b57614" "#076678" "#d3869b" "#689d6a" "#32302f"])
 '(xterm-color-names-bright
   ["#fbf1c7" "#af3a03" "#a89984" "#3c3836" "#7c6f64" "#8f3f71" "#665c54" "#282828"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
