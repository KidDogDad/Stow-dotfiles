;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ql-views
   '(("Weekend" :buffers-files
      ("/home/josh/org/agenda/--become-a-developer__open_project@@20250830T070422.org"
       "/home/josh/org/agenda/--child-support-modification-request__divorce_key_open_project@@20250526T000002.org"
       "/home/josh/org/agenda/--deca-calendar@@20250917T094620.org"
       "/home/josh/org/agenda/--emacs-todos__emacs@@20250811T110445.org"
       "/home/josh/org/agenda/--errands__agenda_errands@@20250807T000001.org"
       "/home/josh/org/agenda/--get-a-loan-2025__key_open_project@@20250814T160044.org"
       "/home/josh/org/agenda/--healthcaregov-2025-special-enrollment__open_project@@20250907T110550.org"
       "/home/josh/org/agenda/--home-todos__agenda@@20250809T104602.org"
       "/home/josh/org/agenda/--inbox@@20250814T155838.org"
       "/home/josh/org/agenda/--job-search-25__key_meta_open_project@@20250806T153544.org"
       "/home/josh/org/agenda/--main-calendar@@20250912T090330.org"
       "/home/josh/org/agenda/--make-short-term-income__finances_key_open_project@@20250908T135046.org"
       "/home/josh/org/agenda/--misc@@20250805T000001.org"
       "/home/josh/org/agenda/--org-mode-migration__emacs_open_project@@20250808T094638.org"
       "/home/josh/org/agenda/--routines@@20250814T095847.org"
       "/home/josh/org/agenda/--save-money__finances_open_project@@20250908T152915.org"
       "/home/josh/org/agenda/--someday@@20250815T104118.org"
       "/home/josh/org/agenda/--yiyi-at-moms-calendar@@20250910T235357.org"
       "/home/josh/org/agenda/--yiyi-calendar@@20250910T232108.org"
       "/home/josh/org/agenda/--yiyi-school-calendar@@20250910T235442.org"
       "/home/josh/org/agenda/--yiyi-todos__agenda@@20250814T095858.org")
      :query (and (todo) (or (scheduled :to today) (tags "weekend"))) :sort
      (date) :narrow nil :super-groups
      ((:name "Today" :time-grid t :scheduled today :order 0)
       (:name "Important" :priority "A" :order 1)
       (:name "Yiyi" :tag "yiyi" :order 2) (:name "Maybe" :tag "maybe" :order 6)
       (:name "This Week" :tag "thisweek" :order 4)
       (:name "Weekend" :tag "weekend" :order 4)
       (:name "Waiting" :todo "WAIT" :order 5))
      :title "Weekend")
     ("Today (by priority)" :buffers-files
      ("/home/josh/org/agenda/--become-a-developer__open_project@@20250830T070422.org"
       "/home/josh/org/agenda/--child-support-modification-request__divorce_key_open_project@@20250526T000002.org"
       "/home/josh/org/agenda/--deca-calendar@@20250917T094620.org"
       "/home/josh/org/agenda/--emacs-todos__emacs@@20250811T110445.org"
       "/home/josh/org/agenda/--errands__agenda_errands@@20250807T000001.org"
       "/home/josh/org/agenda/--get-a-loan-2025__key_open_project@@20250814T160044.org"
       "/home/josh/org/agenda/--healthcaregov-2025-special-enrollment__open_project@@20250907T110550.org"
       "/home/josh/org/agenda/--home-todos__agenda@@20250809T104602.org"
       "/home/josh/org/agenda/--inbox@@20250814T155838.org"
       "/home/josh/org/agenda/--job-search-25__key_meta_open_project@@20250806T153544.org"
       "/home/josh/org/agenda/--main-calendar@@20250912T090330.org"
       "/home/josh/org/agenda/--make-short-term-income__finances_key_open_project@@20250908T135046.org"
       "/home/josh/org/agenda/--misc@@20250805T000001.org"
       "/home/josh/org/agenda/--org-mode-migration__emacs_open_project@@20250808T094638.org"
       "/home/josh/org/agenda/--routines@@20250814T095847.org"
       "/home/josh/org/agenda/--save-money__finances_open_project@@20250908T152915.org"
       "/home/josh/org/agenda/--someday@@20250815T104118.org"
       "/home/josh/org/agenda/--video-omarchy-first-impressions__kickish_linux_next_tech@@20250815T163657.org"
       "/home/josh/org/agenda/--yiyi-at-moms-calendar@@20250910T235357.org"
       "/home/josh/org/agenda/--yiyi-calendar@@20250910T232108.org"
       "/home/josh/org/agenda/--yiyi-school-calendar@@20250910T235442.org"
       "/home/josh/org/agenda/--yiyi-todos__agenda@@20250814T095858.org")
      :query (and (todo) (scheduled :to today)) :sort (priority) :narrow nil
      :super-groups ((:auto-priority)) :title "Today (by priority)")
     ("Overview: Agenda-like" :buffers-files org-agenda-files :query
      (and (not (done))
           (or (habit) (deadline auto) (scheduled :to today)
               (ts-active :on today)))
      :sort (todo priority date) :super-groups org-super-agenda-groups :title
      "Agenda-like")
     ("Overview: NEXT tasks" :buffers-files org-agenda-files :query
      (todo "NEXT") :sort (date priority) :super-groups org-super-agenda-groups
      :title "Overview: NEXT tasks")
     ("Calendar: Today" :buffers-files org-agenda-files :query
      (ts-active :on today) :title "Today" :super-groups org-super-agenda-groups
      :sort (priority))
     ("Calendar: This week"
      . #[0
          "\301 \302\303\304\305\304\306\304\307\310\301 \311\1!\10>\204\34\0\312\313\314\3D\"\210\211\315H\204\232\0\211\315\316\317\320\311\6\6!\10>\2048\0\312\313\314\6\10D\"\210\5\321H\204\223\0\5\321\311\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\203\215\0\4\203\215\0\3\203\215\0\2\203\215\0\1\203\215\0\211\203\215\0\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\202\221\0\330 \266\206I\210\5\321H\"!I\210\211\315H\262\1[\6\12#&\7\302\303\332\305\333\306\333\307\310\327\301 \311\1!\10>\204\300\0\312\313\314\3D\"\210\211\315H\204>\1\211\315\316\317\320\311\6\6!\10>\204\334\0\312\313\314\6\10D\"\210\5\321H\2047\1\5\321\311\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\2031\1\4\2031\1\3\2031\1\2\2031\1\1\2031\1\211\2031\1\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\2025\1\330 \266\206I\210\5\321H\"!I\210\211\315H\262\1Z\6\13#&\7\334\335 \336\337\5\340\6\6\257\5\341\342\343\344\345\346&\10\207"
          [cl-struct-ts-tags ts-now ts-apply :hour 0 :minute :second ts-adjust
                             day type-of signal wrong-type-argument ts 7
                             string-to-number format-time-string "%w" 17 3 2 1 4
                             5 6 float-time encode-time 23 59 org-ql-search
                             org-agenda-files ts-active :from :to :title
                             "This week" :super-groups org-super-agenda-groups
                             :sort (priority)]
          34 "Show items with an active timestamp during this calendar week."
          nil])
     ("Calendar: Next week"
      . #[0
          "\301\302\303\304 #\305\306\307\310\307\311\307\301\302\304 \312\1!\10>\204 \0\313\314\315\3D\"\210\211\303H\204\236\0\211\303\316\317\320\312\6\6!\10>\204<\0\313\314\315\6\10D\"\210\5\321H\204\227\0\5\321\312\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\203\221\0\4\203\221\0\3\203\221\0\2\203\221\0\1\203\221\0\211\203\221\0\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\202\225\0\330 \266\206I\210\5\321H\"!I\210\211\303H\262\1[\6\12#&\7\305\306\332\310\333\311\333\301\302\327\304 \312\1!\10>\204\304\0\313\314\315\3D\"\210\211\303H\204B\1\211\303\316\317\320\312\6\6!\10>\204\340\0\313\314\315\6\10D\"\210\5\321H\204;\1\5\321\312\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\2035\1\4\2035\1\3\2035\1\2\2035\1\1\2035\1\211\2035\1\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\2029\1\330 \266\206I\210\5\321H\"!I\210\211\303H\262\1Z\6\13#&\7\334\335 \336\337\5\340\6\6\257\5\341\342\343\344\345\346&\10\207"
          [cl-struct-ts-tags ts-adjust day 7 ts-now ts-apply :hour 0 :minute
                             :second type-of signal wrong-type-argument ts
                             string-to-number format-time-string "%w" 17 3 2 1 4
                             5 6 float-time encode-time 23 59 org-ql-search
                             org-agenda-files ts-active :from :to :title
                             "Next week" :super-groups org-super-agenda-groups
                             :sort (priority)]
          34
          "Show items with an active timestamp during the next calendar week."
          nil])
     ("Review: Recently timestamped" . org-ql-view-recent-items)
     (#("Review: Dangling tasks" 0 22 (help-echo "Tasks whose ancestor is done"))
      :buffers-files org-agenda-files :query (and (todo) (ancestors (done)))
      :title
      #("Review: Dangling tasks" 0 22 (help-echo "Tasks whose ancestor is done"))
      :sort (todo priority date) :super-groups ((:auto-parent t)))
     (#("Review: Stale tasks" 0 19
        (help-echo "Tasks without a timestamp in the past 2 weeks"))
      :buffers-files org-agenda-files :query (and (todo) (not (ts :from -14)))
      :title
      #("Review: Stale tasks" 0 19
        (help-echo "Tasks without a timestamp in the past 2 weeks"))
      :sort (todo priority date) :super-groups ((:auto-parent t)))
     (#("Review: Stuck projects" 0 22
        (help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :buffers-files org-agenda-files :query
      (and (todo) (descendants (todo)) (not (descendants (todo "NEXT")))) :title
      #("Review: Stuck projects" 0 22
        (help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :sort (date priority) :super-groups org-super-agenda-groups)))
 '(safe-local-variable-values '((olivetti-mode)))
 '(syncthing-default-server-token "Jknmz55n99jRii7izXtf7HhTHoqjnaMx"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
