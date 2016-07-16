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
\\documentclass[12pt,a4paper]{article}
\\setlength{\\textwidth}{360pt}
\\setlength{\\textheight}{600pt}
\\usepackage[top=1.5cm,bottom=0.6in,left=1in,right=1in]{geometry}
\\usepackage{listings}
\\usepackage{xcolor}
\\usepackage{fancyhdr}
%\\title{}
%\\fancyfoot[C]{\\bfseries\\thepage}
%\\chead{\\MakeUppercase\\sectionmark}
%\\pagestyle{fancy}
\\usepackage{xeCJK}  %
\\usepackage{fontspec,xunicode,xltxtra}
\\setmainfont{Times New Roman}
\\setsansfont{Times New Roman}
\\setmonofont{Times}                                                     
%\\newcommand\\fontnamemono{Times}
%\\newfontinstance{\\MONO}{\\fontnamemono}                                        
%\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[BoldFont=STHeiti, ItalicFont=STKaiti]{STSong}%中文字体
\\setCJKsansfont{STHeiti}
\\setCJKmonofont{STFangsong} 
%设置字体快捷命令 
\\newcommand\\fontnamehei{STHeiti}
\\newcommand\\fontnamesong{STSong}
\\newcommand\\fontnamekai{STKaiti}
\\newcommand\\fontnamefangsong{STFangsong}
\\newcommand\\fontnamehuahei{STHeiti}
\\newcommand\\fontnamemono{Times New Roman}
\\setCJKfamilyfont{kai}{\\fontnamekai}
\\setCJKfamilyfont{hei}{\\fontnamehei}
\\setCJKfamilyfont{song}{\\fontnamesong}
\\setCJKfamilyfont{fs}{\\fontnamefangsong}
\\setCJKfamilyfont{huahei}{\\fontnamehuahei}
\\setCJKfamilyfont{mono}{\\fontnamemono}
\\newcommand{\\song}{\\CJKfamily{song}}    % 宋体
\\newcommand{\\fs}{\\CJKfamily{fs}}             % 仿宋体
\\newcommand{\\kai}{\\CJKfamily{kai}}          % 楷体
\\newcommand{\\hei}{\\CJKfamily{hei}}         % 黑体
\\newcommand{\\hhei}{\\CJKfamily{huahei}}       %娃娃体
\\newcommand{\\mono}{\\CJKfamily{mono}}
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

%设置颜色指令
\\definecolor{foreground}{RGB}{220,220,204}
\\definecolor{background}{RGB}{62,62,62}
\\definecolor{preprocess}{RGB}{250,187,249}
\\definecolor{var}{RGB}{239,224,174}
\\definecolor{string}{RGB}{154,150,230}
\\definecolor{type}{RGB}{225,225,116}
\\definecolor{function}{RGB}{140,206,211}
\\definecolor{keyword}{RGB}{239,224,174}
\\definecolor{comment}{RGB}{180,98,4}
\\definecolor{doc}{RGB}{175,215,175}
\\definecolor{comdil}{RGB}{111,128,111}
\\definecolor{constant}{RGB}{220,162,170}
\\definecolor{buildin}{RGB}{127,159,127}

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

%Options for \lset command（reference to listing Manual)
\\newcommand{\\lstsetn}{\\lstset{
 basicstyle=\color{foreground}\small\mono,           % 源代码字体样式
  keywordstyle=\color{function}\bfseries\small\mono, % 关键词字体样式
  identifierstyle=\color{doc}\small\monno,
  commentstyle=\color{comment}\small\itshape,        %批注样式
   escapeinside={\%*}{*)},            % if you want to add LaTeX within your code
  morekeywords={*,...}               % if you want to add more keywords to the set
  stringstyle=\color{string}\small,            %字符串样式
  showstringspaces=false,                               %字符串空格显示
  numbers=left,                                         %行号显示
  numberstyle=\color{preprocess},                      %行号样式
  stepnumber=1,                                         %行号递增
  numbersep=5pt,
  backgroundcolor=\color{background},                   % 代码框背景色
  tabsize=4,                                             % TAB等效空格数
  captionpos=t,                                          % 标题位置 top or buttom(t|b)
  breaklines=true,                                       % 自动断行
  breakatwhitespace=false,                                % 只在空格分行
  showspaces=false,                                      % 显示空格 
  columns=flexible,                                      % 列样式
  %title=\lstname,
  frame=single,                                          % 代码框：阴影盒
  frameround=tttt,                                       % 代码框： 圆角
  framesep=0pt,
  framerule=8pt,
  rulecolor=\color{background},
  fillcolor=\color{white},
  rulesepcolor=\color{comdil},
  framexleftmargin=4.5mm
  }}

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

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-export-latex-listings t)

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


(provide 'latex-org-setting-new)
