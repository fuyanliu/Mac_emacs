;;This is the settings for the org-mood to export PDF.
;;2016/4/19
;;start with xelatex
(defun org-mode-my-init ()
  (define-key org-mode-map (kbd "＊") (kbd "*"))
  )

(add-hook 'org-mode-hook 'org-mode-my-init)



;; code执行免应答（Eval code without confirm）
(setq org-confirm-babel-evaluate nil)
;; Auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(defun org-mode-article-modes ()
 (reftex-mode t)
  (and (buffer-file-name)
     (file-exists-p (buffer-file-name))
     (reftex-parse-all)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (if (member "REFTEX" org-todo-keywords-1)
		(org-mode-article-modes))))
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-hook 'org-mode-hook (lambda ()(setq truncate-lines nil)))

(add-to-list 'org-latex-classes
	     '("article"
	       "\\documentclass[10pt,a4paper]{article}
\\usepackage[paperwidth=18.4cm, paperheight=26cm,left=2.2cm,right=1.7cm,top=2cm,bottom=2cm,includehead,includefoot]{geometry}
\\usepackage{indentfirst}
\\usepackage{xeCJK} 
\\usepackage{fontspec,xunicode,xltxtra}
\\documentclass[UTF8]{ctexart} % 采用Mac字体
\\setmainfont{PT Serif}
\\setsansfont{PT Sans}
\\setmonofont{PT Mono}
\\newcommand\\fontnamemono{STXihei}
\\newfontinstance\\MONO{\\fontnamemono}
\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[BoldFont=STHeiti, ItalicFont=STKaiti]{STSong}%中文字体
\\setCJKsansfont{STHeiti}
\\setCJKmonofont{STFangsong}

\\usepackage{etoolbox}  % Quote 部份的字型設定
\\newfontfamily\\quotefont{Songti SC}
\\AtBeginEnvironment{quote}{\\quotefont\\small}

\\XeTeXlinebreaklocale ``zh''
\\XeTeXlinebreakskip = 0pt plus 1pt
\\linespread{1.3}

\\usepackage{indentfirst}
\\setlength{\\parindent}{2em} 
%\\addtolength{\\parskip}{3pt}

\\usepackage{hyperref}
\\hypersetup{
        colorlinks=true, %把紅框框移掉改用字體顏色不同來顯示連結
        linkcolor=[rgb]{0,0.37,0.53},
        citecolor=[rgb]{0,0.47,0.68},
        filecolor=[rgb]{0,0.37,0.53},
        urlcolor=[rgb]{0,0.37,0.53},
        pagebackref=true,
        linktoc=all,
		}
"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(setq org-latex-with-hyperref t)


(setq org-latex-default-packages-alist
      '(("" "hyperref" nil)
        ("AUTO" "inputenc" t)
        ("" "fixltx2e" nil)
        ("" "graphicx" t)
	("" "calc" t)
        ("" "longtable" nil)
        ("" "float" t)
        ("" "wrapfig" nil)
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "marvosym" t)
        ("" "wasysym" t)
        ("" "amssymb" t)
	("" "adjmulticol" t)
        "\\tolerance=1000"))


(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %b.tex"
	"xelatex -interaction nonstopmode -output-directory %o %b.tex"
	"xelatex -interaction nonstopmode -output-directory %o %b.tex"
	"rm -rf %b.tex %b.log"
	        )) 

(setq org-file-apps '((auto-mode . emacs)
                      ("\\.mm\\'" . default)
                      ("\\.x?html?\\'" . default)
                      ("\\.pdf\\'" . default)
                      ("\\.jpg\\'" . default)))



;; Make Org use ido-completing-read for most of its completing prompts.

;(setq org-completion-use-ido t)

;; 各种Babel语言支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (matlab . t)
   (C . t)
   (perl . t)
   (sh . t)
   (ditaa . t)
   (python . t)
   (haskell . t)
   (dot . t)
   (latex . t)
   (js . t)
   ))

(provide 'my-org-setting)
