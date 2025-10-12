;; -*- lexical-binding: t; -*-

(setq fancy-splash-image "/home/josh/Pictures/doom-banners/splashes/doom/doom-emacs-white.svg")

(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha)
(setq display-line-numbers-type nil)
(setq global-hl-line-modes nil)
(remove-hook 'prog-mode-hook #'hl-line-mode)
(remove-hook 'text-mode-hook #'hl-line-mode)

(custom-theme-set-faces! 'catppuccin
  `(org-document-title :weight bold :foreground ,(catppuccin-color 'text))
  `(org-level-1 :foreground ,(catppuccin-color 'lavender))
  `(org-level-2 :foreground ,(catppuccin-color 'mauve))
  `(org-level-3 :foreground ,(catppuccin-color 'sapphire))
  `(org-level-4 :foreground ,(catppuccin-color 'teal))
  `(org-level-5 :foreground ,(catppuccin-color 'green))
  `(org-level-6 :foreground ,(catppuccin-color 'yellow))
  `(org-level-7 :foreground ,(catppuccin-color 'peach))
  `(org-level-8 :foreground ,(catppuccin-color 'rosewater))
  `(org-todo :foreground ,(catppuccin-color 'green))
  `(org-quote :extend t :background ,(catppuccin-color 'mantle) :foreground ,(catppuccin-color 'rosewater))
  `(italic :slant italic :foreground ,(catppuccin-color 'pink))
  `(bold :weight bold :foreground ,(catppuccin-color 'sapphire))
  `(org-link :inherit link :foreground ,(catppuccin-color 'sky))
  `(org-todo :foreground ,(catppuccin-color 'flamingo))
  `(org-code :foreground ,(catppuccin-color 'teal))
  `(org-verbatim :foreground ,(catppuccin-color 'rosewater))
  `(doom-dashboard-menu-title :foreground ,(catppuccin-color 'mauve))
  `(doom-dashboard-menu-desc :foreground ,(catppuccin-color 'flamingo))
  )

(setf (alist-get 'width default-frame-alist) '(text-pixels . 1626))
(setf (alist-get 'height default-frame-alist) '(text-pixels . 1016))
(setf (alist-get 'width initial-frame-alist) '(text-pixels . 1626))
(setf (alist-get 'height initial-frame-alist) '(text-pixels . 1016))

(setq
 doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 11.0 :weight 'demi-bold)
 doom-variable-pitch-font (font-spec :family "Rubik" :weight 'regular :size 12.0))

(custom-set-faces!
  '(bold :weight bold)
  '(org-bold :weight bold)
  )

;; Increase line spacing
;; org-modern-mode tries to adjust the tag label display based on the value of line-spacing. This looks best if line-spacing has a value between 0.1 and 0.4 in the Org buffer. Larger values of line-spacing are not recommended, since Emacs does not center the text vertically
(setq-default line-spacing 0.2)

;; Fallbacks to ensure that all-the-icons display appropriately
(set-fontset-font t 'unicode "file-icons" nil 'append)
(set-fontset-font t 'unicode "all-the-icons" nil 'append)
(set-fontset-font t 'unicode "Material Icons" nil 'append)
(set-fontset-font t 'unicode "FontAwesome" nil 'append)
(set-fontset-font t 'unicode "weathericons" nil 'append)

(after! doom-modeline 
  (setq doom-modeline-buffer-file-name-style 'buffer-name)
  )

(line-number-mode -1)
(column-number-mode -1)
(size-indication-mode -1)

;; (after! doom-modeline (nyan-mode 1))

;; (after! nyan-mode
;;   (setq
;;    nyan-bar-length 48
;;    nyan-cat-face-number 1
;;    nyan-wavy-trail nil
;;    nyan-animate-nyancat t
;;    nyan-animation-frame-interval 0.1
;;    ))

(scroll-bar-mode -1)

(window-divider-mode -1)

(defun my/org-olivetti-maybe ()
  (let* ((file (or buffer-file-name ""))
         (in-doom (and (boundp 'doom-emacs-dir)
                       file
                       (file-in-directory-p file doom-emacs-dir))))
    (when (and (derived-mode-p 'org-mode)
               (not buffer-read-only)
               (not (string-match-p "config\\.org\\'" file))
               (not in-doom))
      (olivetti-mode 1))))

(add-hook 'org-mode-hook #'my/org-olivetti-maybe)

(after! olivetti
  (setq olivetti-body-width 110)
  ;; (setq olivetti-style 'margins)
  (setq olivetti-style 'fancy)
  )

(map!
 :leader
 :prefix "t"
 :desc "Toggle Olivetti" "o" #'olivetti-mode
 )

(add-hook! 'org-mode-hook #'rainbow-mode)

(use-package! spacious-padding)

;; These are the default values, but I keep them here for visibility.
(setq spacious-padding-widths
      '( :internal-border-width 10
         :header-line-width 4
         :mode-line-width 1
         :tab-width 4
         :right-divider-width 25
         :scroll-bar-width 8
         :fringe-width 10))

;; Read the doc string of `spacious-padding-subtle-mode-line' as it
;; is very flexible and provides several examples.
(setq spacious-padding-subtle-frame-lines nil)
      ;; `( :mode-line-active 'default
      ;;    :mode-line-inactive vertical-border))

(spacious-padding-mode 1)

(add-hook! 'dired-mode-hook (spacious-padding-mode -1))

;; ;; Set a key binding if you need to toggle spacious padding.
;; (define-key global-map (kbd "<f8>") #'spacious-padding-mode)

;; Save my pinkies
(map! :after evil :map general-override-mode-map
      :nv "zj" #'evil-scroll-down
      :nv "zk" #'evil-scroll-up
      :nv "E" #'evil-end-of-line
      :nv "B" #'evil-first-non-blank
      :nv "ga" #'evil-avy-goto-line
      :nv "g/" #'evil-avy-goto-char-timer
      )

;; Give me the universal argument in insert mode
(setq! evil-want-C-u-scroll nil
       evil-want-C-u-delete nil)

(setq evil-auto-indent nil)

(map!
 :leader
 :desc "Raise popup" "`" #'+popup/raise
 :desc "Toggle popup" "-" #'+popup/toggle
 )

(map!
 :leader
 :prefix "o"
 :desc "re-builder" "B" #'re-builder)

(map!
 :leader
 :prefix "s"
 :desc "Consult-fd" "f" #'consult-fd
 :desc "Locate file" "F" #'consult-locate)

(map!
 :leader
 :prefix "h"
 :desc "Consult-info" "c" #'consult-info)

(add-hook! 'doom-first-buffer-hook #'global-auto-revert-mode)

(add-hook! 'prog-mode-hook #'rainbow-delimiters-mode)

;; (setq garbage-collection-messages t) ;; show when garbage collection is happening

;; (setq gc-cons-percentage 0.1)

(add-hook 'text-mode-hook (lambda () (electric-indent-local-mode -1)))

;; (remove-hook 'doom-first-buffer-hook #'ws-butler-global-mode)

;; (after! org
;;   (ws-butler-mode -1))

;; (dired-hide-details-mode 1)
(map! :after dired :map dired-mode-map
      :n "o" #'dired-do-open
      :n "H" #'dired-do-kill-lines)

(setq scroll-conservatively 5)
(pixel-scroll-precision-mode 1)

;; (setq fcitx-remote-command "fcitx5-remote")

;; Keep Orderless simple; no fancy builders that expand to huge regexps.
;; (after! orderless
;;   (setq orderless-matching-styles
;;         '(orderless-literal orderless-initialism orderless-regexp))

;;   ;; If the Chinese module added a pinyin dispatcher, drop it.
;;   (when (boundp 'orderless-style-dispatchers)
;;     (require 'cl-lib)
;;     (setq orderless-style-dispatchers
;;           (cl-remove-if (lambda (fn)
;;                           (string-match-p "pinyin" (symbol-name fn)))
;;                         orderless-style-dispatchers))))

(setq evil-escape-key-sequence "jk")
(setq evil-escape-unordered-key-sequence t)

(after! gptel
  (setq gptel-default-mode 'org-mode)
  (add-hook 'gptel-mode-hook (lambda () (olivetti-mode -1)))
  
  (setq
   gptel-model 'gemini-2.5-flash
   gptel-backend (gptel-make-gemini "Gemini"
                   :key gptel-api-key
                   :stream t))
  
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  )

(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files")

(after! ace-window
  (map!
   :leader
   :prefix "w"
   :desc "Ace-Window" "a" #'ace-window)
  (custom-set-faces!
    '(aw-leading-char-face
      :foreground "#cdd6f4" :background "#f38ba8"
      :weight bold :height 1.5 :box (:line-width 5 :color "#f38ba8")))
  )

(after! windresize
  (setq windresize-modifiers
        '((meta)            ; select window
          (meta control)    ; move the up/left border (instead of bottom/right)
          (meta shift)      ; move window while keeping the width/height
          (control)))       ; temporarily negate the increment value
  )

(map! :leader
      :prefix "w"
      :desc "Resize Window" "r" #'windresize)

(super-save-mode +1)

(setq
 super-save-auto-save-when-idle t
 super-save-all-buffers t
 super-save-delete-trailing-whitespace nil
 )
(add-to-list 'super-save-triggers 'org-agenda-quit)

;; Turn off default auto-save in favor of super-save
(setq auto-save-default nil)

(setq which-key-idle-delay 0.3)
(setq which-key-idle-secondary-delay 0.05)

;; Evil-surround stuff
(after! evil-surround
  (defun evil-surround-source-block ()
    "Wrap selection in source block as input in minibuffer"
    (let ((fname (evil-surround-read-from-minibuffer "Source block type: " "")))
      (cons (format "#+begin_src %s" (or fname ""))
            "#+end_src"))
    )

  ;; This isn't working and I can't for the life of me figure out why
  ;; (defun evil-surround-after-block ()
  ;;   "Read a mode name from the minibuffer and wrap selection an after! block for that mode"
  ;;   (let ((fname (evil-surround-read-from-minibuffer "Mode name: " "")))
  ;;     (cons (format "(after! %s" (or fname ""))
  ;;           ")"))
  ;;   )

  (push '(?\" . ("“" . "”")) evil-surround-pairs-alist)
  (push '(?\' . ("‘" . "’")) evil-surround-pairs-alist)
  (push '(?b . ("*" . "*")) evil-surround-pairs-alist)
  (push '(?* . ("*" . "*")) evil-surround-pairs-alist)
  (push '(?i . ("/" . "/")) evil-surround-pairs-alist)
  (push '(?/ . ("/" . "/")) evil-surround-pairs-alist)
  (push '(?= . ("=" . "=")) evil-surround-pairs-alist)
  (push '(?~ . ("~" . "~")) evil-surround-pairs-alist)
  (push '(?s . evil-surround-source-block) evil-surround-pairs-alist)
  ;; (push '(?a . evil-surround-after-block) evil-surround-pairs-alist)
  )

(after! org-transclusion
  (map! :leader
        :prefix "t"
        :desc "Toggle Org Transclusion" "t" #'org-transclusion-mode)
  (map! :leader
        :prefix "n d"
        :desc "Add Org transclusion" "T" #'org-transclusion-add)
  )

(add-hook 'org-mode-hook #'org-transclusion-mode)

(after! evil
  ;; This advice intercepts `evil-delete` and changes the register to `_`.
  (defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
    (apply orig-fn beg end type ?_ args))
  (advice-add 'evil-delete :around 'bb/evil-delete)

  ;; This function first yanks the selection to the kill-ring/clipboard,
  ;; then deletes it. The delete operation will use the black hole register
  ;; because of the advice above, which is exactly what we want.
  (defun custom-yank-and-delete (beg end)
    "Yank the region, then delete it."
    (interactive "r")
    (evil-yank beg end)
    (evil-delete beg end))

  ;; Bind 'x' in visual mode to this new "yank and delete" command.
  (map! :after evil :map general-override-mode-map
        :v "x" #'custom-yank-and-delete)
  )

(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell "/usr/bin/fish")
(setq-default explicit-shell-file-name "/usr/bin/fish")

(after! dirvish
  (setq! dirvish-quick-access-entries
         `(("h" "~/" "Home")
           ("e" ,user-emacs-directory "Emacs user directory")
           ("o" "~/org/" "Org")
           ("H" "~/.config/hypr/" "hypr")
           ("O" "~/.local/share/omarchy/" "Omarchy")
           ("/" "/" "/")
           ("c" "~/.config/" ".config")
           ("s" "~/stow/" "Stow")
           ("C" "~/code/" "Code")
           ("d" "~/Downloads/" "Downloads")
           ("g" "~/Documents/Geek stuff" "Geek stuff")
           ("D" "~/Documents/" "Documents")
           ("m" "/mnt/" "Mounted drives")
           ("t" "~/.local/share/Trash/files/" "Trash")))
  (setq dirvish-hide-details t)
  (setq dirvish-attributes
        (append
         ;; The order of these attributes is insignificant, they are always
         ;; displayed in the same position.
         '(vc-state subtree-state nerd-icons)
         ;; Other attributes are displayed in the order they appear in this list.
         '(file-size))
        )
  (setq dirvish-override-dired-mode t)
  (setq dirvish-default-layout '(1 0.15 0.5))
  (setq dirvish-layout-recipes '((0 0 0.8) (1 0.15 0.5) (1 0.11 0.7)))
  
  (map! :after dirvish
        :map dirvish-mode-map
        :n "F"   #'dirvish-layout-switch)
  )

(defun dirvish-pre-redisplay-h (window)
  "Record root WINDOW and redisplay sessions in selected frame."
  (when (eq (frame-selected-window) window)
    (setq dirvish--selected-window (frame-selected-window))
    (when-let* ((dv (dirvish-curr))) (setf (dv-root-window dv) window))
    (dirvish--redisplay)))

(use-package! casual-suite)
(map! :after calc
      :map calc-mode-map
      :n "?" #'casual-calc-tmenu)
(map! :after dired
      :map dired-mode-map
      :n "?" #'casual-dired-tmenu)
(map! :after isearch
      :map isearch-mode-map "C-o" #'casual-isearch-tmenu)
(map! :after ibuffer
      :map ibuffer-mode-map
      :n "?" #'casual-ibuffer-tmenu
      :n "F" #'casual-ibuffer-filter-tmenu
      :n "s" #'casual-ibuffer-sortby-tmenu)
(map! :after info
      :map Info-mode-map
      :n "?" #'casual-info-tmenu)
(map! :after re-builder
      :map reb-mode-map
      :n "?" #'casual-re-builder-tmenu
      :map reb-lisp-mode-map
      :n "?" #'casual-re-builder-tmenu)
;; (map! :map bookmark-bmenu-mode-map "C-o" #'casual-bookmarks-tmenu)
(map! :after org-agenda
      :map org-agenda-mode-map
      :n "?" #'casual-agenda-tmenu)
(map! :map general-override-mode-map "M-g" #'casual-avy-tmenu)
(map! :after symbol-overlay
      :map symbol-overlay-map
      :n "?" #'casual-symbol-overlay-tmenu)
;; (map! :map general-override-mode-map "C-o" #'casual-editkit-main-tmenu)

(after! org
  (setq org-directory "~/org"
        org-ellipsis " >"
        org-auto-align-tags nil
        org-cycle-separator-lines 1
        org-pretty-entities t
        org-startup-indented t
        org-startup-truncated nil
        org-adapt-indentation t
        org-special-ctrl-a/e nil
        org-M-RET-may-split-line '((item . nil))
        org-fold-catch-invisible-edits 'smart
        org-edit-src-content-indentation 0
        org-src-preserve-indentation t
        org-fontify-quote-and-verse-blocks t
        org-fontify-done-headline nil
        org-fontify-whole-heading-line t
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-blank-before-new-entry '((heading . t) (plain-list-item . nil))
        org-archive-location "~/org/--org-archive@@20250917T103324.org::* From %s"
        )
  )

(setq org-super-agenda-groups
      '(;; Each group has an implicit boolean OR operator between its selectors.
        (:name "Today"  
         :time-grid t  
         :scheduled today
         :order 0)  
        (:name "Important"
         :priority "A"
         :order 1)
        (:name "Fun"
         :tag "fun"
         :order 19)
        (:name "Maybe"
         :tag "maybe"
         :order 20)
        (:name "People"
         :tag "people"
         :order 2)
        (:name "This Week"
         :tag "thisweek"
         :order 4)
        (:name "Weekend"
         :tag "weekend"
         :order 4)
        (:name "Waiting"
         :todo "WAIT"
         :order 5)
        ;; After the last group, the agenda will display items that didn't
        ;; match any of these groups, with the default order position of 99
        ))

(map! :after org-super-agenda :map org-super-agenda-header-map 
      :desc "Fold node" "f" #'origami-toggle-node
      :desc "Previous line" "k" 'org-agenda-previous-line
      :desc "Next line" "j" 'org-agenda-next-line)

(map! :after org-super-agenda :map org-agenda-mode-map
      "[" #'org-agenda-earlier
      "]" #'org-agenda-later)

;; Automatically fold specific groups in agenda views
;; This isn't working yet
(defvar my/org-super-agenda-auto-show-groups
    '("Calendar" "Today" "Bills" "People" "Waiting" "Important"))

  (defun my/org-super-agenda-origami-fold-default ()
    "Fold certain groups by default in Org Super Agenda buffer."
    (forward-line 3)
    (cl-loop do (origami-forward-toggle-node (current-buffer) (point))
             while (origami-forward-fold-same-level (current-buffer) (point)))
    (--each my/org-super-agenda-auto-show-groups
      (goto-char (point-min))
      (when (re-search-forward (rx-to-string `(seq bol " " ,it)) nil t)
        (origami-show-node (current-buffer) (point)))))

(add-hook! 'org-agenda-mode-hook #'origami-mode)
;; (add-hook! 'org-agenda-finalize-hook #'my/org-super-agenda-origami-fold-default)
(add-hook! 'org-agenda-mode-hook #'org-super-agenda-mode)

(setq org-agenda-files (list (concat org-directory "/agenda")))

(after! org-agenda
  (setq org-agenda-start-day "+0d"
        org-agenda-span 'day
        org-agenda-timegrid-use-ampm t
        org-agenda-tags-column 0
        org-agenda-todo-ignore-scheduled 'future
        org-agenda-todo-ignore-deadlines 'far
        org-agenda-skip-deadline-prewarning-if-scheduled t
        org-deadline-warning-days 2
        org-agenda-tags-todo-honor-ignore-options nil
        org-agenda-dim-blocked-tasks nil
        org-agenda-use-tag-inheritance t
        org-agenda-inhibit-startup t
        org-agenda-ignore-properties '(stats)
        org-agenda-window-setup 'current-window
        org-agenda-restore-windows-after-quit nil
        org-log-done 'time
        org-log-into-drawer t
        org-agenda-include-deadlines t
        org-agenda-breadcrumbs-separator " ❱ "
        org-agenda-todo-keyword-format "%-1s"
        org-agenda-use-time-grid t
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-hide-tags-regexp (regexp-opt '("people" "finances" "key" "open" "project" "meta" "maybe" "weekend" "thisweek" "computer" "agenda" "emacs" "kickish" "linux" "next" "tech" "actualplay" "now"))
        org-agenda-skip-deadline-if-done t
        org-agenda-show-future-repeats nil
        org-agenda-block-separator nil
        org-agenda-scheduled-leaders '("" "Sched.%2dx: ")
        org-agenda-deadline-leaders '("Deadline:  " "In %3d d.: " "%2d d. ago: ")
        org-agenda-current-time-string "<──────── now"
        org-agenda-time-grid '((today require-timed remove-match) (800 1000 1200 1400 1600 1800 2000) "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")

        org-agenda-prefix-format
        '((agenda . " %-12:c%?-16t% s")
          (todo . " %?-12c ")
          (tags . " %?-12c ")
          (search . " %?-12:c "))

        org-agenda-custom-commands
        '(
          ("f" "Focused agenda"
           ((agenda ""
                    (
                     (org-deadline-warning-days 0)
                     (org-agenda-overriding-header "Calendar")
                     )))
           ((org-agenda-tag-filter-preset '("-people"))))
          ("w" "This Week"
           ((agenda ""
                    (
                     (org-agenda-overriding-header "Calendar")
                     (org-agenda-time-grid (quote ((today require-timed remove-match) () "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")))
                     ))
            (org-ql-block '(and (todo) (tags "thisweek"))
                          ((org-ql-block-header "\nThis Week")))
            ))
          ("e" "Weekend"
           ((agenda ""
                    (
                     (org-agenda-overriding-header "Calendar")
                     (org-agenda-time-grid (quote ((today require-timed remove-match) () "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")))
                     ))
            (org-ql-block '(and (todo) (tags "weekend"))
                          ((org-ql-block-header "\nWeekend")))
            ))
          ("i" "Inbox"
           ((todo "" ((org-agenda-files '("~/org/agenda/--inbox@@20250814T155838.org"))
                      (org-agenda-overriding-header "Inbox Items")))))
          ("p" "People Tasks"
           ((tags-todo "people")))
          )

        org-agenda-sorting-strategy '((agenda time-up ts-up urgency-down)
                                      (todo priority-down)
                                      (tags priority-down)
                                      (search category-keep))
        )

  (custom-set-faces!
    `(org-agenda-structure :inherit org-level-2 :foreground ,(catppuccin-color 'lavender))
    `(org-agenda-date :inherit org-level-2 :foreground ,(catppuccin-color 'lavender) :weight bold)
    `(org-agenda-date-weekend-today :inherit org-level-2 :foreground ,(catppuccin-color 'lavender))
    `(org-agenda-date-today :inherit org-level-3 :foreground ,(catppuccin-color 'mauve))
    '(org-scheduled-today :inherit default :foreground nil :weight regular)
    '(org-scheduled :inherit default :foreground nil :weight regular)
    `(org-scheduled-previously :inherit default :weight bold :foreground ,(catppuccin-color 'red))
    `(org-upcoming-deadline :inherit default :foreground ,(catppuccin-color 'peach))
    '(org-agenda-current-time :inherit org-meta-line)
    '(org-time-grid :inherit org-meta-line)
    )
  )

(require 'org-protocol)
(require 'org-web-tools)

;; (setq org-stuck-projects
;;       '("TODO=\"PROJ\"&-TODO=\"DONE\"" ("TODO") nil ""))

(custom-set-faces!
  ;; Font sizes
  '(org-document-title :height 1.5 :weight bold)
  '(org-date :inherit org-meta-line)
  ;; '(org-level-1 :height 1.2 :weight bold)
  ;; '(org-level-2 :height 1.2 :weight bold)
  ;; '(org-level-3 :height 1.2 :weight bold)
  ;; '(org-level-4 :height 1.2 :weight bold)
  ;; '(org-level-5 :height 1.2 :weight bold)
  ;; '(org-level-6 :height 1.2 :weight bold)
  ;; '(org-level-7 :height 1.2 :weight bold)
  ;; '(org-level-8 :height 1.2 :weight bold)
  ;; '(org-indent :height 1.2 :weight bold)
  )

(after! org-capture
  (add-hook 'org-capture-mode-hook
            (lambda nil
              (setq-local header-line-format nil)))
  (setq org-capture-templates
        '(("t" "Todo" entry (file "~/org/agenda/--inbox@@20250814T155838.org")
           "* TODO %?")
          ("c" "Clipboard Todo" entry (file "~/org/agenda/--inbox@@20250814T155838.org")
           "* TODO %?\n%(string-trim (shell-command-to-string \"wl-paste -n\"))")
          ("o" "bin/org-capture Todo" entry (file "~/org/agenda/--inbox@@20250814T155838.org")
           "* TODO %?\n%(string-trim (shell-command-to-string \"wl-paste -n\"))\n")
          ("e" "Emacs Todo" entry (file "~/org/agenda/--emacs-todos__agenda_emacs@@20250811T110445.org")
           "* TODO %? :emacs:\n")
          ("p" "People Todo" entry (file "~/org/agenda/--yiyi-todos__agenda@@20250814T095858.org")
           "* TODO %? :people:\n")
          ;; Not working fully yet
          ;; ("W" "Web Page (With Content)" plain
          ;;  (file denote-last-path)
          ;;  #'denote-org-capture
          ;;  :immediate-finish nil
          ;;  :kill-buffer t
          ;;  :jump-to-captured t)
          ;; ("w" "Web Page (Link Only)" plain
          ;;  (file denote-last-path)
          ;;  #'denote-org-capture
          ;;  :immediate-finish nil
          ;;  :kill-buffer t
          ;;  :jump-to-captured t)
          ))
  )

;; (org-roam-capture-ref-templates
;;  '(("W" "Web Page (With Content)" plain
;;     "%(org-web-tools--url-as-readable-org \"${ref}\")"
;;     :target (file+head "clips/${slug}.org" "#+title: ${title}\n\n")
;;     :unnarrowed t)
;;    ("w" "Web Page (Link Only)" plain
;;     "[[${ref}][${title}]]\n\n%?"
;;     :target (file+head "clips/${slug}.org" "#+title: ${title}\n\n")
;;     :unnarrowed t)
;;    ))

(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "WAIT(w)"
         "SOMEDAY(s)"
         "BACKLOG(b)"
         "SCRIPTING(s)"
         "|"
         "DONE(d)"
         "CANCELED(c)"))
      )

(after! org-modern
  (setq org-modern-list '((43 . "•")
                          (45 . "•")))
  (setq org-modern-tag nil)
  (setq org-modern-todo nil)
  (setq org-modern-star 'replace)
  ;; (setq org-modern-hide-stars t)
  (setq org-modern-timestamp nil)
  (setq org-modern-block-fringe t)
  )
;; (add-hook! 'org-mode-hook #'adaptive-wrap-prefix-mode)

(use-package! org-modern-indent
  :ensure t
  :config
  :hook
  (org-mode . org-modern-indent-mode)
  )

(set-face-attribute 'fixed-pitch nil :family "JetBrainsMono Nerd Font" :height 1.0)

;; (after! org-auto-tangle
;;   (add-hook 'org-mode 'org-auto-tangle-mode)
;;   (setq org-auto-tangle-default nil))

(add-hook 'org-mode-hook #'org-appear-mode)

(add-hook! 'before-save-hook #'org-update-all-dblocks)

(after! denote
  ;; Make Denote links clickable
  (add-hook 'text-mode-hook #'denote-fontify-links-mode-maybe)
  ;; Apply colors to Denote names in Dired
  (add-hook 'dired-mode-hook #'denote-dired-mode)
  (add-hook 'dirvish-setup-hook #'denote-dired-mode)
  (setq denote-directory (expand-file-name "~/org/"))
  (setq denote-file-type 'org)
  (setq denote-dired-directories-include-subdirectories t)
  (setq denote-save-buffers t)
  (setq denote-infer-keywords t)
  (setq denote-sort-keywords t)
  (setq denote-rename-confirmations '(rewrite-front-matter modify-file-name))
  (setq denote-backlinks-display-buffer-action
        (quote ((display-buffer-reuse-window display-buffer-in-side-window)
                (side . right)
                (slot . 99)
                (window-width . 0.3)
                (dedicated . t)
                (preserve-size . (t . t)))))

  ;; Pick dates, where relevant, with Org's advanced interface:
  (setq denote-date-prompt-use-org-read-date t)

  ;; Automatically rename Denote buffers when opening them so that
  ;; instead of their long file name they have, for example, a literal
  ;; "[D]" followed by the file's title.  Read the doc string of
  ;; `denote-rename-buffer-format' for how to modify this.
  (denote-rename-buffer-mode 1)
  )

(setq denote-file-name-components-order '(title keywords signature identifier))

(defun my-denote-rename-all-to-reorder-components ()
  "Call `denote-dired-rename-files' without any prompts.
     In other words, preserve the value of each Denote file name component.

     Use this command if you want to modify the user option
     `denote-file-name-components-order' and then want your files to
     retroactively follow that order."
  (interactive)
  (let ((denote-prompts nil))
    (call-interactively 'denote-dired-rename-files)))

(custom-set-faces!
  `(denote-faces-date :foreground ,(catppuccin-color 'subtext0))
  `(denote-faces-title :foreground ,(catppuccin-color 'white))
  `(denote-faces-keywords :foreground ,(catppuccin-color 'red))
  `(denote-faces-link :inherit link :foreground ,(catppuccin-color 'blue))
  )

(map! :leader
      (:prefix ("n" . "notes")
               (:prefix ("d" . "denote")
                :desc "Link or create a note" "l" #'denote-link-or-create
                :desc "Add links" "L" #'denote-add-links
                :desc "Link to heading" "h" #'denote-org-link-to-heading
                :desc "Query contents" "q" #'denote-query-contents-link
                :desc "Query filenames" "Q" #'denote-query-filenames-link
                :desc "Backlinks" "b" #'denote-backlinks
                :desc "Denote dired" "D" #'denote-dired
                :desc "Open or create a note" "n" #'denote-open-or-create
                :desc "Goto journal" "j" #'denote-journal-new-or-existing-entry
                :desc "Link or create journal" "J" #'denote-journal-link-or-create-entry
                :desc "Search notes (ripgrep)" "s" #'consult-denote-grep
                :desc "Denote menu" "m" #'denote-menu-list-notes
                :desc "Denote template" "t" #'denote-template
                :desc "Create note using date" "N" #'denote-create-note-using-date
                :desc "Extract subtree" "x" #'denote-org-extract-org-subtree
                :desc "Convert links to denote" "C" #'denote-org-convert-links-to-denote-type
                )))

(map! :leader
      (:prefix ("n" . "notes")
               (:prefix ("d" . "denote")
                        (:prefix ("r" . "rename")
                         :desc "Rename" "r" #'denote-rename-file
                         :desc "Rename keywords" "k" #'denote-rename-file-keywords
                         :desc "Rename title" "t" #'denote-rename-file-title
                         :desc "Rename date" "d" #'denote-rename-file-date
                         :desc "Rename identifier" "i" #'denote-rename-file-identifier
                         :desc "Rename using front matter" "f" #'denote-rename-file-using-front-matter
                         ))))

(map! :leader
      (:prefix ("n" . "notes")
               (:prefix ("d" . "denote")
                        (:prefix ("d" . "dynamic blocks")
                         :desc "Backlinks" "b" #'denote-org-dblock-insert-backlinks
                         :desc "Files" "f" #'denote-org-dblock-insert-files
                         :desc "Links" "l" #'denote-org-dblock-insert-links
                         :desc "Update" "u" #'org-dblock-update
                         :desc "Files as headings" "h" #'org-dblock-insert-files-as-headings
                         ))))

(map! :leader
      :desc "Close other windows" "w D" #'delete-other-windows)

(after! denote-menu
  (setq
   denote-menu-title-column-width 80
   denote-menu-keywords-column-width 40
   )
  )
(map! :after denote-menu
      :map denote-menu-mode-map
      :nv "dr" #'denote-menu-filter
      :nv "dk" #'denote-menu-filter
      :nv "do" #'denote-menu-filter
      :nv "dc" #'denote-menu-clear-filters
      :nv "de" #'denote-menu-export-to-dired
      )

(after! denote-journal
  (add-hook 'calendar-mode-hook #'denote-journal-calendar-mode)
  ;; Use the "journal" subdirectory of the `denote-directory'. Set this
  ;; to nil to use the `denote-directory' instead.
  (setq denote-journal-directory
        (expand-file-name "journal" denote-directory))
  ;; Default keyword for new journal entries. It can also be a list of
  ;; strings.
  (setq denote-journal-keyword "journal")
  ;; Read the doc string of `denote-journal-title-format'.
  (setq denote-journal-title-format "%Y-%0m-%0d")
  )

(after! consult-denote
  (consult-denote-mode 1)
  (setq consult-denote-grep-command #'consult-ripgrep)
  )
(map! :leader
      (:prefix ("n" . "notes")
       (:prefix ("d" . "denote")
       :desc "Consult Denote Find" "f" #'consult-denote-find
       :desc "Consult Denote Grep" "g" #'consult-denote-grep
       )
      ))

(add-hook! 'magit-mode-hook (magit-delta-mode +1))

(map! :leader
      :prefix "s"
      (:prefix ("q" . "Org QL")
       :desc "Search" "s" #'org-ql-search
       :desc "Sidebar" "b" #'org-ql-view-sidebar
       :desc "View" "v" #'org-ql-view
       :desc "Find" "f" #'org-ql-find
       :desc "Save View" "S" #'org-ql-view-save
       :desc "Delete View" "D" #'org-ql-view-delete
       :desc "Refresh View" "r" #'org-ql-view-refresh
       :desc "Find In Agenda" "a" #'org-ql-find-in-agenda
       :desc "Find In Org Directory" "o" #'org-ql-find-in-org-directory
       ))

(map! :after org-ql
      :map org-ql-view-list-map
      :n [return] #'org-ql-view-switch)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width 80)

(map!
 :leader
 :prefix "o"
 :desc "Calendar" "c" #'cfw:open-org-calendar)

(use-package! xclip
  :config
  (setq xclip-program "wl-copy")
  (setq xclip-select-enable-clipboard t)
  (setq xclip-mode t)
  (setq xclip-method (quote wl-copy))
  )

(setq rmh-elfeed-org-files '("/home/josh/org/--elfeed-feeds__elfeed@@20250824T113650.org"))

(map!
 :leader
 :prefix "o"
 :desc "Elfeed" "e" #'elfeed)

(add-hook 'elfeed-search-mode-hook #'elfeed-update)

(setq elfeed-goodies/entry-pane-size 0.6)

(defun logseq-md-headings-to-org ()
  "Convert Logseq-style headings to Org headings, removing leading dash and indentation."
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "^\\s-*\\(-\\s-*\\)?\\(#+\\)\\s-+" nil t)
    (let* ((hashes (match-string 2))
           (stars (make-string (length hashes) ?*)))
      (replace-match (concat stars " ") nil t))))

(defun markdown-links-to-org (&optional beg end)
  "Convert [text](url) → [[url][text]] in region or whole buffer.
Also unwrap URLs like {{video https://...}}."
  (interactive (if (use-region-p) (list (region-beginning) (region-end))))
  (save-excursion
    (save-restriction
      (when (and beg end) (narrow-to-region beg end))
      (goto-char (point-min))
      (let ((re "\\[\\([^]\n]+\\)\\](\\([^)\n]+\\))"))
        (while (re-search-forward re nil t)
          (let* ((txt (match-string 1))
                 (url (match-string 2)))
            ;; unwrap {{video ...}}
            (when (string-match "\\`{{video[[:space:]]+\\([^}]+\\)}}\\'" url)
              (setq url (match-string 1 url)))
            (replace-match (concat "[[" url "][" txt "]]") t t)))))))

(defun modi/org-entity-get-name (char)
  "Return the entity name for CHAR. For example, return \"ast\" for *."
  (let ((ll (append org-entities-user
                    org-entities))
        e name utf8)
    (catch 'break
      (while ll
        (setq e (pop ll))
        (when (not (stringp e))
          (setq utf8 (nth 6 e))
          (when (string= char utf8)
            (setq name (car e))
            (throw 'break name)))))))

(defun modi/org-insert-org-entity-maybe (&rest args)
  "When the universal prefix C-u is used before entering any character,
    insert the character's `org-entity' name if available.

    If C-u prefix is not used and if `org-entity' name is not available, the
    returned value `entity-name' will be nil."
  ;; It would be fine to use just (this-command-keys) instead of
  ;; (substring (this-command-keys) -1) below in emacs 25+.
  ;; But if the user pressed "C-u *", then
  ;;  - in emacs 24.5, (this-command-keys) would return "^U*", and
  ;;  - in emacs 25.x, (this-command-keys) would return "*".
  ;; But in both versions, (substring (this-command-keys) -1) will return
  ;; "*", which is what we want.
  ;; http://thread.gmane.org/gmane.emacs.orgmode/106974/focus=106996
  (let ((pressed-key (substring (this-command-keys) -1))
        entity-name)
    (when (and (listp args) (eq 4 (car args)))
      (setq entity-name (modi/org-entity-get-name pressed-key))
      (when entity-name
        (setq entity-name (concat "\\" entity-name "{}"))
        (insert entity-name)
        (message (concat "Inserted `org-entity' "
                         (propertize entity-name
                                     'face 'font-lock-function-name-face)
                         " for the symbol "
                         (propertize pressed-key
                                     'face 'font-lock-function-name-face)
                         "."))))
    entity-name))

;; Run `org-self-insert-command' only if `modi/org-insert-org-entity-maybe'
;; returns nil.
(advice-add 'org-self-insert-command :before-until #'modi/org-insert-org-entity-maybe)

(defun thanos/wtype-text (text)
  "Process TEXT for wtype, handling newlines properly."
  (let* ((has-final-newline (string-match-p "\n$" text))
         (lines (split-string text "\n"))
         (last-idx (1- (length lines))))
    (string-join
     (cl-loop for line in lines
              for i from 0
              collect (cond
                       ;; Last line without final newline
                       ((and (= i last-idx) (not has-final-newline))
                        (format "wtype -s 350 \"%s\"" 
                                (replace-regexp-in-string "\"" "\\\\\"" line)))
                       ;; Any other line
                       (t
                        (format "wtype -s 350 \"%s\" && wtype -k Return" 
                                (replace-regexp-in-string "\"" "\\\\\"" line)))))
     " && ")))

(defun thanos/type ()
  "Launch a temporary frame with a clean buffer for typing."
  (interactive)
  (let ((frame (make-frame '((name . "emacs-float")
                             (fullscreen . 0)
                             (undecorated . t)
                             (width . 70)
                             (height . 20))))
        (buf (get-buffer-create "emacs-float")))
    (select-frame frame)
    (switch-to-buffer buf)
    (erase-buffer)
    (org-mode)
    (setq-local header-line-format
                (format " %s to insert text or %s to cancel."
                        (propertize "C-c C-c" 'face 'help-key-binding)
			(propertize "C-c C-k" 'face 'help-key-binding)))
    (local-set-key (kbd "C-c C-k")
		   (lambda () (interactive)
		     (kill-new (buffer-string))
		     (delete-frame)))
    (local-set-key (kbd "C-c C-c")
		   (lambda () (interactive)
		     (start-process-shell-command
		      "wtype" nil
		      (thanos/wtype-text (buffer-string)))
		     (delete-frame)))))
