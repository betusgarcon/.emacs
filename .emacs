(add-to-list 'load-path "~/add-ons/vendor")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

 ;; Use C-SPC to toggle input status
(ibus-define-common-key ?\C-\s nil)
(global-set-key (kbd "C-SPC") 'ibus-toggle)

(global-set-key (kbd "C-q") 'other-window)
(global-set-key (kbd "C-j") 'goto-line)

;; 修改meta-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

(global-set-key (kbd "C-w") 'backward-kill-word)

;; 修改剪切按键
(global-set-key (kbd "C-x C-k") 'kill-region)
;;(global-set-key (kbd "C-c C-k") 'kill-region) 容错备份

;; Use C-/ for Undo command
;;(ibus-define-common-key ?\C-/ nil)
;; Change cursor color depending on IBus status
;;(setq ibus-cursor-color '("red" "blue" "limegreen"))

;;设置初始目录(c-x c-f)
(setq default-directory "~/python_study")

;;启用ibuffer支持，增强*buffer*  
(require 'ibuffer)  
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;默认进入text-mode，而不是没有什么功能的fundamental-mode  
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;
(global-set-key "\367" (quote clipboard-kill-ring-save))
(put 'upcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(show-paren-mode t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Use S-SPC for Set Mark command
;;(global-set-key[?\S- ] 'set-mark-command)

(setq user-full-name "Betus")
(setq user-mail-address "beyondsc1986@gmail.com")

(setq load-path (cons "~/Downloads/org/org-7.7/lisp" load-path))
(setq load-path (cons "~/Downloads/org/org-7.7/contrib/lisp" load-path))


;;设置字体微Inconsolata
;;(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(set-default-font "-microsoft-YaHei Consolas Hybrid-normal-normal-normal-*-17-*-*-*-*-0-iso10646-1")

(require 'org-install)
(require 'org-publish)

(setq org-log-done t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;左侧显示行号
(global-linum-mode t)
 
;;颜色设置，其实有个color-theme.el可以将Emacs设置丰富多彩，非常漂亮，不过启动有些慢（我得机器不行），我只是选择了一些颜色设置。
;; 指针颜色设置为白色
(set-cursor-color "white")
;; 鼠标颜色设置为白色
(set-mouse-color "white")
;; 设置背景颜色和字体颜色
(set-foreground-color "white")
(set-background-color "black")
;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

(require 'ido)
(ido-mode t)
(show-paren-mode 't)

;;窗口启动最大化
(defun my-max-window()
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
(run-with-idle-timer 0.5 nil 'my-max-window)

(global-font-lock-mode t);语法高亮
(setq c-basic-offset 8);默认缩进8
(fset 'yes-or-no-p 'y-or-n-p);y/n 代替 yes/no

(setq show-paren-style 'parenthesis) ;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
(display-time-mode t);显示时间，格式如下  
(setq display-time-24hr-format t)      
;(setq display-time-day-and-date t)  
(tool-bar-mode nil);去掉那个大大的工具栏  
;(menu-bar-mode nil);去掉菜单栏
(scroll-bar-mode nil);去掉滚动栏

(setq inhibit-startup-message t);关闭emacs启动界面
(setq gnus-inhibit-startup-message t);关闭gnus启动界面

(global-set-key [f5] 'gdb-many-windows);启动gdb
(global-set-key [f6] 'eshell);启动shell
(setq kill-ring-max 200);用一个很大的 kill ring. 这样防止我不小心删掉重要的东西.

;;定义c-z 为前缀命令
(define-prefix-command 'ctl-z-map)  
(global-set-key (kbd "C-z") 'ctl-z-map) 

;; 定义打开.emacs文件的函数
(defun open-init-file ()(interactive)
(find-file "~/emacs_config/.emacs"))

;;c-z z 打开.emacs配置文件
(global-set-key "\C-zz" 'open-init-file)

;;添加cc-mode插件
;(require 'cc-mode)
;(c-set-offset 'inline-open 0)
;(c-set-offset 'friend '-)

;(c-set-offset 'substatement-open 0)

;;cc-mode配置 
;缩进设置
;(setq c-basic-offset 6)
;设置code style
; (setq c-default-style '((java-mode . "java")
;			 (awk-mode . "awk")
;			 (other . "linux")))

;设置<ret>为回车加缩进
(defun my-make-CR-do-indent ()
            (define-key c-mode-base-map "\C-m" 'c-context-line-break))
          (add-hook 'c-initialization-hook 'my-make-CR-do-indent)

;添加yasnippet 补全插件 (另一种方式，所有模板集成在bundle中)
;(add-to-list 'load-path
;             "~/add-ons/yasnippet")
;(require 'yasnippet-bundle)

(progn (cd "~/add-ons/vendor")
       (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/add-ons/vendor/auto-complete")

(require 'auto-complete)
(require 'python)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; python-mode
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Initialize Pymacs                                                                                           
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; Initialize Rope
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;python 插件
;(require 'init_python)
;(global-auto-complete-mode t)

;yasnippet 各种语言补全包
(add-to-list 'load-path
              "~/add-ons/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/add-ons/yasnippet/snippets")

;; 不产生备份文件,临时文件
(setq make-backup-files nil)
(setq-default make-backup-files nil)

;; 打开图片显示功能
(auto-image-file-mode t)

;;页面平滑滚动， scroll-margin 3 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。 
(setq scroll-margin 3 
      scroll-conservatively 10000)

;; share clipboard with outside programs
(setq x-select-enable-clipboard t)

;;设置emacs 打开默认的浏览器为chrome
(setq browse-url-browser-function 'browse-url-generic 
          browse-url-generic-program "/opt/google/chrome/google-chrome") 

;;设置org-mode todo列表
(setq org-todo-keywords
       '((sequence "TODO" "DOING" "|" "DONE" "CONCLUDE")))

;;set the goto-line 
(global-set-key [f5] 'goto-line)

;;设置scala-mode加载目录
(add-to-list 'load-path
	     "~/add-ons/scala-mode")

;;获取scala-mode插件
(require 'scala-mode-auto)

;;设置scala的yasnippet对应目录
(setq yas/scala-mode
      "~/add-ons/scala-mode/contrib/yasnippet/snippets")
(yas/load-directory yas/scala-mode)

(add-hook 'scala-mode-hook
            '(lambda ()
               (yas/minor-mode-on)
               ))

;; 设置ruby-mode加载目录
(add-to-list 'load-path "~/add-ons/ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)

;; 自动缩进
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

;; running ruby inside emacs
(require 'inf-ruby)

;; electric-help
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))


;; 设置多行注释及反注释 m--
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
  If no region is selected and current line is not blank and we are not at the end of the line,
  then comment current line.
  Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
(interactive "*P")
(comment-normalize-vars)
(if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
(comment-or-uncomment-region (line-beginning-position) (line-end-position))
(comment-dwim arg)))

(global-set-key (kbd "M--") 'qiang-comment-dwim-line)


;; 复制当前行
;; Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))
 
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))
 
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
 
;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
                  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
 
(global-set-key (kbd "M-k") 'qiang-copy-line)

;; erc 设置
(setq erc-default-coding-system '(utf-8 . utf-8))
(setq erc-nick "betus"
      erc-user-full-name "betus Su")

