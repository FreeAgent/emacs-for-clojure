(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      clojure-mode
                      clojure-test-mode
                      nrepl
                      auto-complete
                      ac-nrepl
                      rainbow-delimiters
                      evil
                      elixir-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load "~/.emacs.d/user.el")

; Evil mode
(add-to-list 'load-path "~/.emacs.d/evil") (require 'evil) (evil-mode 1)

(column-number-mode)  ; display the column numbers on the mode-line

; Rainbow delimiters for bracks (in Clojure, Emacs Lisp, etc.)
(require 'rainbow-delimiters) (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

; recent files
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)
(setq recentf-auto-cleanup 'never) ; prevent Tramp conflict with recentf-mode.

; display the path of the file in the buffer with uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)


; make long lines wrap according to the window-size
; (setq longlines-wrap-follows-window-size t)
; bind C-M-l to "longlines-mode"
;(global-set-key [(control meta l)] 'longlines-mode)


; Elixir
(add-to-list 'load-path "~/.emacs.d/emacs-elixir") 
(require 'elixir-mode)


; enable visual-line-mode in all buffers
; (global-visual-line-mode)
;
; (define-key evil-motion-state-map "j" 'evil-next-visual-line)
; (define-key evil-motion-state-map "k" 'evil-previous-visual-line)


;; change mode-line color by evil state 
;; (I've changed lexical-let to let -- need to test if this works!
;;
; (let ((default-color (cons (face-background 'mode-line)
;                                    (face-foreground 'mode-line))))
;              (add-hook 'post-command-hook
;                        (lambda ()
;                          (let ((color (cond ((minibufferp) default-color)
;                                             ((evil-insert-state-p) '("#e80000" . "#ffffff"))
;                                             ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
;                                             ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
;                                             (t default-color))))
;                          (set-face-background 'mode-line (car color))
;                          (set-face-foreground 'mode-line (cdr color))))))
