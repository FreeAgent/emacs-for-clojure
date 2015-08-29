(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
                 '("melpa" . "https://melpa.org/packages/") t)
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
                      auto-complete
                      ac-nrepl
                      rainbow-delimiters
                      evil
                      elixir-mode
                      js2-mode
                      coffee-mode
                      pony-mode
                      projectile
                      markdown-mode
		      motion-mode
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load "~/.emacs.d/user.el")

; turn off paredit mode
(add-hook 'clojure-mode-hook (lambda () (paredit-mode nil)))

; support for ClojureScript
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

; Dirtree
; (require 'tree-mode)
; (require 'windata)
; (require 'dirtree)
; (autoload 'dirtree "dirtree" "Add directory to tree view" t)
; (global-set-key "\C-o" 'dirtree-show)

; supposed to make Fn key the Meta key on a Mac, but not working for me...
;(setq mac-function-modifier 'meta)

; Neotree --problem unfolding directories in Neotree sidebar
; (require 'neotree)
; (neotree-show)
; (global-set-key "\C-o" 'neotree-toggle)

; Evil mode
(require 'evil)
(evil-mode 1)

(column-number-mode)  ; display the column numbers on the mode-line

; Rainbow delimiters for brackets (in Clojure, Emacs Lisp, etc.)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

; reopen recent files
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)
(setq recentf-auto-cleanup 'never) ; prevent Tramp conflict with recentf-mode.

; display the path of the file in the buffer with uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(require 'elixir-mode)  ; for the Elixir language (on the Erlang VM)

(require 'coffee-mode)  ; for CoffeeScript

(require 'pony-mode)    ; Django pony-mode

; Projectile mode 
(require 'projectile)   
(projectile-global-mode)

; Markdown mode 
(autoload 'markdown-mode "markdown-mode"
             "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


; make long lines wrap according to the window-size
; (setq longlines-wrap-follows-window-size t)
; bind C-M-l to "longlines-mode"
;(global-set-key [(control meta l)] 'longlines-mode)


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
