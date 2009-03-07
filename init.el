(load-library "autostart")
(fset 'erb-expression
   [?< ?% ?= ?  ?  ?% ?> left left left])
(global-set-key (kbd "C->") 'erb-expression)
(setq indent-line-function 'indent-relative-maybe)

;; RSpec it block
(fset 'it
   [?i ?t ?  ?\" ?s ?h ?o ?u ?l ?d ?  ?\" ?  ?d ?o return tab backspace backspace ?e ?n ?d up ?\C-s ?s ?h ?o ?u ?l ?d right])

(setq load-path (cons "~/.emacs.d/rails" load-path))
(require 'rails)

(add-to-list 'load-path "~/.emacs.d/remember")                                  ;; (1)
(require 'remember-autoloads)
(setq org-remember-templates
   '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/organizer.org")                      ;; (2)
     ("Appointments" ?a "* Appointment: %?\n%^T\n%i\n  %a" "~/organizer.org")))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(eval-after-load 'remember
  '(add-hook 'remember-mode-hook 'org-remember-apply-template))
(global-set-key (kbd "C-c r") 'remember)                                         ;; (3)

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))                           ;; (4)
(global-set-key (kbd "C-c a") 'org-agenda)                                       ;; (5)
(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "DONE"))                    ;; (6)
(setq org-agenda-include-diary t)                                                ;; (7)
(setq org-agenda-include-all-todo t)                                             ;; (8)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/birthdays.org" "~/finance.org" "~/organizer.org" "~/org")))
 '(org-agenda-todo-ignore-scheduled t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-hook 'ruby-mode-hook
  (lambda ()
    (define-key ruby-mode-map (kbd "<f12>") 'rails-spec:run-this-file)
    (define-key ruby-mode-map (kbd "S-<f12>") 'rails-spec:run-this-spec)
  )
)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(require 'ido)
(ido-mode t)

(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/w3m")
(require 'w3m-load)
(setq w3m-use-cookies 1)

(add-to-list 'load-path "~/.emacs.d")
(require 'haml-mode nil 't)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(require 'sass-mode nil 't)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(display-time)
(add-hook 'diary-hook 'appt-make-list)
(diary 0)
(load "~/.emacs.d/cucumber.el/cucumber-mode.el")
(add-hook 'feature-mode-hook 'turn-on-orgtbl)

(windmove-default-keybindings 'meta)