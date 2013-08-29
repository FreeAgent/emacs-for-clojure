# Additions in this fork

   * rainbow-delimiters ; rainbow colours for rounded brackets in Clojure/Lisp
   * evil               ; Vim editing-keys in Emacs
   * elixir-mode        ; a mode for @josevalim's Elixir language
   * coffee-mode        ; a mode for CoffeeScript
   * js2-mode           ; a mode for JavaScript
   * pony-mode          ; a mode for Django (Python's leading web-framework)
   * projectile         ; a mode for navigating through a project
   
Also:
   * column-number-mode ; minor-mode to show the column number on mode-line.
   * C-x f              ; to reopen a recently opened file.
   * uniquify           ; show a partial path to a file in the buffer. 
                        ; increased the font-size.

   
# Emacs for Clojure Starter Kit

This repo is a minor extension of [The Emacs Starter Kit, v2](https://github.com/technomancy/emacs-starter-kit/tree/v2). Added functionality:

* Sets $PATH so that it's the same as your shell $PATH
* Includes the tomorrow-night and zenburn themes
* Turns off flyspell
* Adds some nrepl hooks, including auto-complete
* Prevents hippie-expand from expanding to file names
* Turns off ido-mode's use-file-name-at-point
* Stores backup files in `~/.saves`
* Installs the following packages by default:
    * starter-kit-lisp
    * starter-kit-bindings
    * starter-kit-ruby
    * clojure-mode
    * clojure-test-mode
    * nrepl
    * auto-complete
    * ac-nrepl

You can see all these tweaks in init.el and user.el
