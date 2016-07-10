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
\\usepackage[
a4paper,
headheight=12pt,
paperwidth=210mm,
headsep=20pt,
includeheadfoot,
centering,
top=2.5cm,
bottom=1cm,
left=3cm
]{geometry}
\\usepackage{xeCJK}  %
\\usepackage{fontspec,xunicode,xltxtra}
\\setmainfont{Times New Roman}
\\setsansfont{Times New Roman}
\\setmonofont{Times}                                                     
%\\newcommand\\fontnamemono{STXihei}
\\newfontinstance\\MONO{\\fontnamemono}                                        
\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[BoldFont=STHeiti, ItalicFont=STKaiti]{STSong}%中文字体
\\setCJKsansfont{STHeiti}
\\setCJKmonofont{STFangsong} 
%设置字体快捷命令 
\\newcommand\\fontnamehei{STHeiti}
\\newcommand\\fontnamesong{STSong}
\\newcommand\\fontnamekai{STKaiti}
\\newcommand\\fontnamefangsong{STFangsong}
\\newcommand\\fontnamehuahei{STHeiti}
\\setCJKfamilyfont{kai}{\\fontnamekai}
\\setCJKfamilyfont{hei}{\\fontnamehei}
\\setCJKfamilyfont{song}{\\fontnamesong}
\\setCJKfamilyfont{fs}{\\fontnamefangsong}
\\setCJKfamilyfont{huahei}{\\fontnamehuahei}
\\newcommand{\\song}{\\CJKfamily{song}}    % 宋体
\\newcommand{\\fs}{\\CJKfamily{fs}}             % 仿宋体
\\newcommand{\\kai}{\\CJKfamily{kai}}          % 楷体
\\newcommand{\\hei}{\\CJKfamily{hei}}         % 黑体
\\newcommand{\\hhei}{\\CJKfamily{huahei}}       %娃娃体
%设置字号快捷命令
\\newcommand{\\yihao}{\\fontsize{26pt}{36pt}\\selectfont}           % 一号, 1.4 倍行距
\\newcommand{\\erhao}{\\fontsize{22pt}{28pt}\\selectfont}          % 二号, 1.25倍行距
\\newcommand{\\xiaoer}{\\fontsize{18pt}{18pt}\\selectfont}          % 小二, 单倍行距
\\newcommand{\\sanhao}{\\fontsize{16pt}{24pt}\\selectfont}        % 三号, 1.5倍行距
\\newcommand{\\xiaosan}{\\fontsize{15pt}{22pt}\\selectfont}        % 小三, 1.5倍行距
\\newcommand{\\sihao}{\\fontsize{14pt}{21pt}\\selectfont}            % 四号, 1.5 倍行距
\\newcommand{\\banxiaosi}{\\fontsize{13pt}{19.5pt}\\selectfont}    % 半小四, 1.5倍行距
\\newcommand{\\xiaosi}{\\fontsize{12pt}{18pt}\\selectfont}            % 小四, 1.5倍行距
\\newcommand{\\dawuhao}{\\fontsize{11pt}{11pt}\\selectfont}       % 大五号, 单倍行距
\\newcommand{\\wuhao}{\\fontsize{10.5pt}{15.75pt}\\selectfont}    % 五号, 单倍行距

\\usepackage{etoolbox}  % Quote 部份的字型設定
\\newfontfamily\\quotefont{Songti SC}
\\AtBeginEnvironment{quote}{\\quotefont\\small}

\\XeTeXlinebreaklocale ``zh''
\\XeTeXlinebreakskip = 0pt plus 1pt
\\linespread{1.391}
%首行缩进
\\usepackage{indentfirst}
\\setlength{\\parindent}{0.75cm}
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
%\\captionsetup{font=capfont} %生成tex文件不能编译
%\\renewcommand{\\thefigure}{(+ 0 org-level-1)\\textendash\\arabic{figure}}
%\\renewcommand{\\thetable}{'org-level-1\\textendash\\arabic{table}}

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
	("" "enumerate" t)
	("" "multicol" t)
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

;; 导出Beamer的设置
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(add-to-list 'org-latex-classes
	     ;; beamer class, for presentations
	     '("beamer"
	       "
\\documentclass[slidestop,compress,mathserif]{beamer}
\\mode
%beamer主题选择，在每个section之前加入这个section的目录，封面页去掉页眉和页脚
\\usetheme{{{Antibes}}}%Beamer主题样式
\\usecolortheme{lily}%Beamer颜色主题样式
\\AtBeginSection{\\begin{frame}{Outline} 
\\tableofcontents[currentsection]
\\end{frame}}
\\setbeamertemplate{navigation symbols}{}
%\\renewcommand\\maketitle{\\frame[plain]{titlepage}}

\\beamertemplateballitem
\\setbeameroption{show notes}
\\usepackage{graphicx}
\\usepackage{tikz}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{amsmath}
\\usepackage{lmodern}
\\usepackage{polyglossia}
%设置字体。
\\usepackage{fontspec,xunicode,xltxtra}
\\documentclass[UTF8]{ctexart} % 采用Mac字体                                  
\\setmainfont{Times New Roman}
\\setsansfont{Times New Roman}      
\\setmonofont{Times}                                                     
\\setCJKmainfont[BoldFont=STHeiti, ItalicFont=STKaiti]{STSong}%中文字体        
\\setCJKsansfont{STHeiti}                                                      
\\setCJKmonofont{STFangsong}
%参考文献
\\usepackage[backend = biber,natbib=true,style=science,sorting=none]{biblatex}
\\addbibresource{Pharmaron.bib}
\\AtBeginBibliography{\\footnotesize}
\\setbeamertemplate{bibliography item}[text]
%取消断词overpic包
\\usepackage[none]{hyphenat}
\\usepackage[abs]{overpic} 

\\usepackage{verbatim}
\\usepackage{listings}
\\institute{{{{beamerinstitute}}}}
\\subject{{{{beamersubject}}}}"
			      ("\\section{%s}" . "\\section*{%s}")
			      ("\\begin{frame}[fragile]\\frametitle{%s}"
			       "\\end{frame}"
			       "\\begin{frame}[fragile]\\frametitle{%s}"
			       "\\end{frame}")))

(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)


(provide 'latex-org-setting-new)
