;;;  -*- lexical-binding: t; -*-


;; Appearance ;;
(package! catppuccin-theme)
(package! olivetti :recipe (:host github :repo "rnkn/olivetti"))
(package! org-modern)
(package! all-the-icons)
(package! org-modern-indent :recipe (:host github :repo "jdtsmith/org-modern-indent"))
(package! diredfl :disable t)


;; Functional packages ;;

;; Org
(package! org-web-tools)
(package! org-transclusion)
(package! org-ql :recipe (:host github :repo "alphapapa/org-ql"))
(package! org-super-agenda)

;; Denote
(package! denote)
(package! denote-journal)
(package! denote-markdown)
(package! denote-search)
(package! denote-explore)
(package! consult-denote)
(package! denote-menu)
(package! denote-org)

;; Other
(package! websocket)
(package! super-save)
(package! windresize)
(unpin! dirvish)
(package! esup)
(package! info+)
(package! nov)
(package! scroll-on-jump :recipe (:host github :repo "emacsmirror/scroll-on-jump"))

;; Things that I gave up on
;; (package! org-outer-indent
;;   :recipe (:host github :repo "rougier/org-outer-indent"))
;; (package! spacious-padding)
;; (package! org-auto-tangle)
;; (package! org-padding :recipe (:host github :repo "TonCherAmi/org-padding"))
