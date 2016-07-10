(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)

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


(setq org-latex-to-pdf-process
	  '("xelatex -interaction nonstopmode %b.tex"
		"xelatex -interaction nonstopmode %b.tex"
		"rm -rf %b.tex %b.log img-*.png"	; 可以删除一些中间文件
		"rm -rf auto"					; 可以删除一些中间文件夹
		))


(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("article"
               "
\\documentclass[10pt,a4paper]{article}
\\usepackage{amssymb,amsmath,amsfonts,amsthm} %导入数学、符号包
\\usepackage{eucal}
\\usepackage{titletoc}%要调整章节标题在目录页中的格式
\\usepackage{graphicx}	%图形包
\\usepackage{multirow}	%表格包
\\usepackage{xcolor}	%代码高亮
\\usepackage{listings}  %插入代码
\\usepackage{xeCJK}
\\usepackage{lmodern}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{geometry}
\\usepackage{algorithm}
\\usepackage{algorithmic}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{titlesec}

\\usepackage[xetex,colorlinks=true,linkcolor=blue,urlcolor=blue,menucolor=blue]{hyperref} % 生成书签
\\usepackage{fontspec,xunicode,xltxtra} %字体和编码
\\usepackage{natbib}		%导入参考文献用
\\usepackage{fancyhdr}
\\usepackage{indentfirst}
\%-----设置图片搜索路径
%\\graphicspath{{E:/codoon/}}

%\\setmainfont{Times New Roman}
%\\setCJKmainfont[ItalicFont={STKaiti}, BoldFont={SimHei}]{SimSun}
%\\setCJKsansfont{SimHei}
%\\setCJKmonofont{STFangsong}

\\setmainfont{PT Serif}
\\setsansfont{PT Sans}
\\setmonofont{PT Mono}  
\\newcommand\\fontnamemono{STXihei}
\\newfontinstance\\MONO{\\fontnamemono}
\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[BoldFont=STHeiti, ItalicFont=STKaiti]{STSong}%中文字体
\\setCJKsansfont{STHeiti}
\\setCJKmonofont{STFangsong}

\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt

\\hypersetup{unicode=true}
\%设置页面格式
\\geometry{a4paper, textwidth=6in, textheight=10in,marginparsep=7pt, marginparwidth=.6in}

\\makeatletter
\\newcommand{\\rmnum}[1]{\\romannumeral #1}
\\newcommand{\\Rmnum}[1]{\\expandafter\\@slowromancap\\romannumeral #1@}
\\makeatother

\\newenvironment{enum-0}{
\\begin{enumerate}[(1)]
  \\setlength{\\itemsep}{1pt}  %列表各项之间垂直空白
  \\setlength{\\parskip}{-12pt}
  \\setlength{\\parsep}{-1pt}}
\{\\end{enumerate}}

\\pagestyle{fancy}
\\lhead{\\includegraphics[width=1.5cm]{logo}}
\%lhead{\\bfseries{BITMAN}}
\%chead{\\bfseries{\\thepage{}}}
\\lhead{\\bfseries{www.codoon.com}}  
\\rhead{\\bfseries{lxc}}  
\\lfoot{}
\\cfoot{\\bfseries{\\thepage}}
\\rfoot{}
\\renewcommand{\\headrulewidth}{0.4pt}
\\renewcommand{\\footrulewidth}{0.4pt}

\\newtheorem{Definition}{\hspace{2em}定义}[section] 
\\newtheorem{Proposition}{\hspace{2em}命题}
\\newtheorem{Theorem}{\hspace{2em}定理}[section]
\\newtheorem{Contents}{目录}[chapter]
\\newtheorem{Remark}{\hspace{2em}注}[chapter]
\\newtheorem{corollary}[definition]{\hspace{2em}推论}
\\newtheorem{proposition}[definition]{\hspace{2em}命题}
\\newtheorem{lemma}[definition]{\hspace{2em}引理}
\\newtheorem{axiom}[definition]{\hspace{2em}公理}

\%在下面的org-export-latex-listings-options也有设置，此处基本没有用
\%lstset{numbers=left, %设置行号位置, 
\% 		 numberstyle=\\tiny, %设置行号大小
\% 		 keywordstyle=\\color{blue}, %设置关键字颜色
\% 		 commentstyle=\\color[cmyk]{1,0,1,0}, %设置注释颜色
\%       frame=single, %设置边框格式
\%        escapeinside=``, %逃逸字符(1左面的键)，用于显示中文
\%        breaklines, %自动折行
\%        extendedchars=false, %解决代码跨页时,章节标题，页眉等汉字不显示
\%        xleftmargin=8em,xrightmargin=2em, aboveskip=0.5em, %设置边距
\%        tabsize=4, %设置tab空格数
\%        showspaces=false} %不显示空格


\\definecolor{qianhui}{RGB}{220,220,204}		%浅灰
\\definecolor{foreground}{RGB}{50,50,50}		%浅黑
\%definecolor{background}{RGB}{62,62,62}		%浅黑
\\definecolor{background}{RGB}{255,255,255}		%浅肉色
\\definecolor{preprocess}{RGB}{250,187,249}		%浅紫
\\definecolor{var}{RGB}{239,224,174}			%浅肉色
\\definecolor{string}{RGB}{154,150,230}			%浅紫色
\\definecolor{type}{RGB}{225,225,116}			%浅黄
\\definecolor{function}{RGB}{0,0,0}				%黑色
\%definecolor{function}{RGB}{140,206,211}		%浅天蓝
\\definecolor{keyword}{RGB}{239,224,174}		%浅肉色
\\definecolor{comment}{RGB}{0,255,127}			%浅绿
\%definecolor{doc}{RGB}{175,215,175}			%浅铅绿
\\definecolor{doc}{RGB}{0,0,205}				%蓝色
\\definecolor{comdil}{RGB}{111,128,111}			%深灰
\\definecolor{constant}{RGB}{220,162,170}		%粉红
\\definecolor{buildin}{RGB}{127,159,127}		%深铅绿

\\punctstyle{kaiming}
\\tolerance=1000
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-export-latex-listings t)

;; Options for \lset command（reference to listing Manual)
(setq org-export-latex-listings-options
      '(("basicstyle" "\\color{foreground}\\small\\mono")           ; 源代码字体样式
        ("keywordstyle" "\\color{function}\\bfseries\\small\\mono") ; 关键词字体样式
        ("identifierstyle" "\\color{doc}\\small\\mono")
        ("commentstyle" "\\color{comment}\\small\\itshape")         ; 批注样式
        ("stringstyle" "\\color{string}\\small")                    ; 字符串样式
        ("showstringspaces" "false")                                ; 字符串空格显示
        ("numbers" "left")                                          ; 行号显示
        ("numberstyle" "\\color{preprocess}")                       ; 行号样式
        ("stepnumber" "1")                                          ; 行号递增
        ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
        ("tabsize" "4")                                             ; TAB等效空格数
        ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
        ("breaklines" "true")                                       ; 自动断行
        ("breakatwhitespace" "true")                                ; 只在空格分行
        ("showspaces" "false")                                      ; 显示空格
        ("columns" "flexible")                                      ; 列样式
        ("frame" "shadowbox")                                       ; 代码框：阴影盒
        ("frameround" "tttt")                                       ; 代码框： 圆角
        ("framesep" "0pt")
        ("framerule" "8pt")
        ("rulecolor" "\\color{background}")
        ("fillcolor" "\\color{qianhui}")
        ("rulesepcolor" "\\color{comdil}")
		("xleftmargin" "8em")					;设置左边距
		("xrightmargin" "2em")					;设置右边距
		("aboveskip" "0.5em")					;设置上边距
        ("framexleftmargin" "10mm")))

(provide 'my-org-latex)
