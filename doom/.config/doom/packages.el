;;;  -*- lexical-binding: t; -*-

;; Appearance ;;
(package! catppuccin-theme)
(package! olivetti :recipe (:host github :repo "rnkn/olivetti"))
(package! org-modern)
(package! all-the-icons)
(package! org-modern-indent :recipe (:host github :repo "jdtsmith/org-modern-indent"))
(package! diredfl :disable t)
(package! spacious-padding)
(package! mixed-pitch)

;; Functional packages ;;

;; Org
(package! org-web-tools)
(package! org-transclusion)
(package! org-super-agenda)
(package! org-appear)
(package! rainbow-delimiters)
;; (package! org-gcal)

;; Denote
(package! denote)
(package! denote-journal)
(package! denote-markdown)
(package! denote-search)
(package! denote-explore)
(package! consult-denote)
(package! denote-menu)
(package! denote-org)

;; Fun
(package! parrot)
(package! nyan-mode)

;; Other
(package! casual-suite)
(package! beframe)
(package! websocket)
(package! super-save)
(package! windresize)
(unpin! dirvish)
(package! esup)
(package! info+)
(package! nov)
(package! emacs-syncthing :recipe (:host github :repo "KeyWeeUsr/emacs-syncthing"))
(package! xclip)
(package! org-ql :recipe (:host github :repo "alphapapa/org-ql"))
(package! origami)
(package! magit-delta)

;; Things that I gave up on
;; (package! org-outer-indent
;;   :recipe (:host github :repo "rougier/org-outer-indent"))
;; (package! org-auto-tangle)
;; (package! scroll-on-jump :recipe (:host github :repo "emacsmirror/scroll-on-jump"))
;; (package! org-padding :recipe (:host github :repo "TonCherAmi/org-padding"))
