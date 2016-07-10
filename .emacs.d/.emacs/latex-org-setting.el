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
	    (setq truncate-lines nil)
	    (if (member "REFTEX" org-todo-keywords-1)
		(org-mode-article-modes))))
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(setq org-latex-classes
      '(("article"
	 "
\\documentclass{article}
\\usepackage[a4paper,headheight=12pt,headsep=25pt,includeheadfoot,centering,
             top=2.5cm,bottom=1cm,left=3cm]{geometry}

%\\usepackage{pdflatex}

\\usepackage{xeCJK}  %
%\\usepackage{fontspec}
%\\setromanfont{Microsoft Sans Serif}
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

%\\setmonofont[Scale=0.9]{Courier New} % 等寬字型 [FIXME] Courier 中文會爛掉！
%\\font\\cwSong=''cwTeXFangSong'' at 10pt%
%\\font\\cwHei=''cwTeXHeiBold'' at 10p %不知為何這套字型一用就爆掉...
%\\font\\cwYen=''cwTeXYen'' at 10ptA%
%\\font\\cwKai=''cwTeXKai'' at 10pt
%\\font\\cwMing=''cwTeXMing'' at 10pt
%\\font\\wqyHei=''文泉驛正黑'' at 10pt
%\\font\\wqyHeiMono=''文泉驛等寬正黑'' at 10pt
%\\font\\wqyHeiMicro=''文泉驛微米黑'' at 10pt
\\XeTeXlinebreaklocale ``zh''
\\XeTeXlinebreakskip = 0pt plus 1pt
\\linespread{1.391}
\\parskip=0bp plus 10bp minus 1bp %段距为最大10磅,仅为行距一半,最小可以压缩1磅。
\\raggedbottom

%设置调用图表宏包
\\usepackage[format=hang,labelsep=space]{caption}
\\intextsep=6bp %段距为最大10磅,仅为行距一半,最小可以压缩1磅。
\\textfloatsep=6bp %设置浮动体在页面顶端或底端时多个之间的距离
\\floatsep=6bp %分别设置表和图的标题与正文的距离
\\captionsetup[figure]{aboveskip=0bp,belowskip=0bp}
\\captionsetup[table]{aboveskip=0bp,belowskip=6bp}

%设置图表说明
\\usepackage{booktabs,tabularx,threeparttable,longtable}
\\captionsetup{font=capfont}
%\\renewcommand{\\thefigure}{(+ 0 org-level-1)\\textendash\\arabic{figure}}
%\\renewcommand{\\thetable}{'org-level-1\\textendash\\arabic{table}}
%
\\usepackage[below]{placeins}
\\usepackage{flafter}


% [FIXME] ox-latex 的設計不良導致 hypersetup 必須在這裡插入
\\usepackage{hyperref}
\\hypersetup{
  colorlinks=true, %把紅框框移掉改用字體顏色不同來顯示連結
  linkcolor=blue, %[rgb]{0,0.37,0.53},
  citecolor=magenta, %[rgb]{0,0.47,0.68},
  filecolor=yellow, %[rgb]{0,0.37,0.53},
  urlcolor=red, %[rgb]{0,0.37,0.53},
  pagebackref=true,
  linktoc=all,}
"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ))



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
        ("" "adjmulticol" t)  ; 這是我另外加的，因為常需要多欄位文件版面。
        ("" "amssymb" t)
        "\\tolerance=1000"))


(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %b.tex"
        "xelatex -interaction nonstopmode -output-directory %o %b.tex"
        "xelatex -interaction nonstopmode -output-directory %o %b.tex"
        "rm -rf %b.tex %b.log"
        ))


(setq org-file-apps '((auto-mode . emacs)
                      ("\\.mm\\'" . default)
                      ("\\.x?html?\\'" . "xdg-open %s")
                      ("\\.pdf\\'" . "kde-open %s")
                      ("\\.jpg\\'" . "kde-open %s")))
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
(provide 'latex-org-setting)
