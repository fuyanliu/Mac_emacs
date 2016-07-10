;;w3m
(add-to-list 'load-path "~/.emacs.d/elpa/w3m-20121224.1747")
(require 'w3m)
(require 'w3m-lnum)
(require 'w3m-util)
(require 'w3m-image)
(defvar w3m-buffer-name-prefix "*w3m" "Name prefix of w3m buffer")
(defvar w3m-buffer-name (concat w3m-buffer-name-prefix "*") "Name of w3m buffer")
(defvar w3m-bookmark-buffer-name (concat w3m-buffer-name-prefix "-bookmark*") "Name of w3m buffer")

;;设定w3m运行的参数，分别为使用cookie和使用框架  
(setq w3m-command-arguments '("-cookie" "-F"))

;; 使用cookies
(setq w3m-use-cookies t)

(setq w3m-use-mule-ucs t)

;;设置主页
(setq w3m-home-page "https://www.google.com.hk/?gws_rd=ssl")
;; 默认显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
;; 使用w3m作为默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-view-this-url-new-session-in-background t)
;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)
;;C-c C-p 打开，这个好用
(setq w3m-view-this-url-new-session-in-background t)  

(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)
(defun remove-w3m-output-garbages ()
  "去掉w3m输出的垃圾."
  (interactive)
  (let ((buffer-read-only))
    (setf (point) (point-min))
    (while (re-search-forward "[\200-\240]" nil t)
      (replace-match " "))
    (set-buffer-multibyte t))
  (set-buffer-modified-p nil))

(defun w3m-settings ()
  (make-local-variable 'hl-line-face)
    (setq hl-line-face 'hl-line-nonunderline-face)
      (setq hl-line-overlay nil)
;        (color-theme-adjust-hl-line-face))

(add-hook 'w3m-mode-hook 'w3m-settings)

(defun w3m-save-current-buffer ()
  "Save current w3m buffer."
    (interactive)
      (save-excursion
          (mark-whole-buffer)
	      (call-interactively 'copy-region-as-kill-nomark))
	        (with-temp-buffer
		    (call-interactively 'yank)
		        (call-interactively 'write-file)))

(defun w3m-print-current-url ()
  "Display current url."
    (interactive)
      (w3m-message "%s" (w3m-url-readable-string w3m-current-url)))

(defun w3m-copy-current-url ()
  "Display the current url in the echo area and put it into `kill-ring'."
    (interactive)
      (when w3m-current-url
          (let ((deactivate-mark nil))
	        (kill-new w3m-current-url)
		      (w3m-print-current-url))))

(defun view-w3m-bookmark ()
  "View w3m bokmark."
    (interactive)
      (let ((buffer (get-buffer w3m-bookmark-buffer-name)))
          (if buffer
	          (switch-to-buffer buffer)
		        (with-current-buffer (get-buffer-create w3m-bookmark-buffer-name)
			        (w3m-mode)
				        (w3m-bookmark-view)))))

(defun switch-to-w3m ()
  "Switch to *w3m* buffer."
    (interactive)
      (let ((buffer (get-buffer w3m-buffer-name)))
          (if buffer
	          (switch-to-buffer buffer)
		        (message "Could not found w3m buffer."))))

(defun w3m-browse-current-buffer ()
  "Use w3m browser current buffer."
    (interactive)
      (w3m-browse-buffer))

(defun w3m-browse-buffer (&optional buffer)
  "Use w3m browser buffer BUFFER."
  (interactive "bBuffer to browse use w3m: ")
   (unless buffer (setq buffer (current-buffer)))
   (let* ((file (buffer-file-name buffer))
	  (name (buffer-name buffer)))
      (if file
          (w3m-goto-url-new-session file)
         (with-current-buffer buffer
	   (save-excursion
	      (mark-whole-buffer)
	      (call-interactively 'copy-region-as-kill-nomark)))
	(let* ((new-name
		(concat
		w3m-buffer-name-prefix
		"-"
		(if (string= "*" (substring name 0 1))
		    (substring name 1)
		  (concat name "*"))))
	       (new-buffer (get-buffer-create new-name)))
	       (switch-to-buffer new-buffer)
	       (call-interactively 'yank)
	       (w3m-buffer)
	       (w3m-mode)
	       (setq w3m-current-title (buffer-name))))))

;; fix small bug about of `w3m-auto-show'
;; see my-blog/emacs/w3m-auto-show-bug.htm
(defun w3m-auto-show ()
  "Scroll horizontally so that the point is visible."
    (when (and truncate-lines
    	  w3m-auto-show
	  (not w3m-horizontal-scroll-done)
	  (not (and (eq last-command this-command)
	  (or (eq (point) (point-min))
	  (eq (point) (point-max)))))
	  (or (memq this-command '(beginning-of-buffer end-of-buffer))
	  (string-match "\\`i?search-"
	  (if (symbolp this-command) (symbol-name this-command) ""))
	  (and (markerp (nth 1 w3m-current-position))
	  (markerp (nth 2 w3m-current-position))
	  (>= (point)
	  (marker-position (nth 1 w3m-current-position)))
	  (<= (point)
	  (marker-position (nth 2 w3m-current-position))))))
	  (w3m-horizontal-on-screen))
	  (setq w3m-horizontal-scroll-done nil))

(defun w3m-link-numbering (&rest args)
  "Make overlays that display link numbers."
    (when w3m-link-numbering-mode
        (save-excursion
	(goto-char (point-min))
	(let ((i 0)
	overlay num)
	(catch 'already-numbered
	(while (w3m-goto-next-anchor)
	(when (get-char-property (point) 'w3m-link-numbering-overlay)
	(throw 'already-numbered nil))
	(setq overlay (make-overlay (point) (1+ (point)))
	num (format "[%d]" (incf i)))
	(w3m-static-if (featurep 'xemacs)
	(progn
	(overlay-put overlay 'before-string num)
	(set-glyph-face (extent-begin-glyph overlay)
	'w3m-link-numbering))
	(w3m-add-face-property 0 (length num) 'w3m-link-numbering num)
	(overlay-put overlay 'before-string num)
	(overlay-put overlay 'evaporate t))
	(overlay-put overlay 'w3m-link-numbering-overlay i)))))))
)

(provide 'w3m-setting)
