;;color theme
(add-to-list 'load-path "~/.emacs.d/lisps/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

;;set windows numbering
(require 'window-numbering)
(window-numbering-mode 1)

(defadvice kill-ring-save (before slickcopy activate compile)  
   (interactive  
    (if mark-active (list (region-beginning) (region-end))  
      (list (line-beginning-position)  
            (line-beginning-position 2)))))  
 (defadvice kill-region (before slickcut activate compile)  
   (interactive  
    (if mark-active (list (region-beginning) (region-end))  
      (list (line-beginning-position)  
            (line-beginning-position 2))))) 


;;(ac-config-default)
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)                                                
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default) 


;;try to install melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;;w3m
(require 'w3m-setting)


;;mew setting
;; mew mode
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/elpa/mew-20150813.2354"))
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
              'mew-send-hook))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(tetris-height 20)
 '(tetris-width 15))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:foreground "pale turquoise" :weight bold)))))


;;org-mode配置
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2015/bin/x86_64-darwin/"))
  (setq exec-path (append exec-path '("/usr/local/texlive/2015/bin/x86_64-darwin/")))


;;my-org-setting
(add-to-list 'load-path "~/.emacs.d/.emacs")
(require 'latex-org-setting-new)


;; iimage mode
(add-to-list 'load-path "~/.emacs.d/lisps/")
(require 'iimage)                  
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
;;如果想在 Emacs org 模式里启用 iimage 模式，把下面的代码放到配置文件里，则可以在 Emacs Org 的编辑区里显示图片。
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
    (set-face-underline-p 'org-link t))
    (iimage-mode))

;;补全括号
(electric-pair-mode t)


;; **** keisen-mule.el ****
;(if (or (boundp 'MULE)
;	(featurep 'meadow))
   (if window-system
	(autoload 'keisen-mode "keisen-mouse" "MULE table" t)
 (autoload 'keisen-mode "keisen-mule" "MULE table" t))

;;matlab-emacs
(add-to-list 'load-path "~/.emacs.d/lisps/matlab-emacs")
  (load-library "matlab-load")

(column-number-mode t);显示列号

(display-time-mode 1);显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;;显示时间的格式
;(setq display-time-format "%y年%mm%dd%A%H:%M")

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)
; put files

;;一键快速编译 C++-mode
(defun quick-compile ()
  "A quick compile funciton for C++"
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (compile (format "%s -o %s  %s %s %s"
		     (or (getenv "CC") "g++")
		     (file-name-sans-extension file)
		     (or (getenv "CPPFLAGS") "")
		     (or (getenv "CFLAGS") "-Wall")
		     file))))
  ;; (let (file (file-name-nondirectory buffer-file-name)))
  ;; (compile (concat "g++ -Wall -o " (file-name-sans-extension file)))
  ;; )
(global-set-key [(f9)] 'quick-compile)  ;;快捷键F9

;;aspell
;;(add-to-list 'exec-path "/usr/local/Cellar")
(setq exec-path (append "/usr/local/bin" exec-path))
(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-dictionary-alist
      (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
		       ("-B" "-d" "english" "--dict-dir"
			"/usr/local/Cellar/aspell/0.60.6.1/lib")
		       nil iso-8859-1)))
	`((nil ,@default)
	  ("english" ,@default)))
      ;;(setq ispell-extra-args '("--sug-mode=ultra"))
      ;;(setq ispell-personal-dictionary "~/.aspell.en.pws")
      ;;(setq flyspell-issue-message-flag nil)
      )
;;

