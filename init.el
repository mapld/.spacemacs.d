;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (setq-default )
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ruby
     windows-scripts
     yaml
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     (c-c++ :variables
              c-c++-default-mode-for-headers 'c++-mode)

     auto-completion
     ;; better-defaults
     emacs-lisp
     semantic
     git
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     java
     c-c++
     c++-rtags
     python

     sql

     osx

     shell

     markdown

     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(git-auto-commit-mode ensime sbt-mode groovy-mode groovy-imports sql-indent org-super-agenda irony company-irony flycheck-irony flycheck-pos-tip helm-gtags flyspell-lazy meghanada)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   dotspacemacs-line-numbers 'relative
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configurationcxczfsdsdfsdf
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default helm-recentf-fuzzy-match t)
  (setq-default helm-mode-fuzzy-match t)
  ;;(push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(ensime . "melpa-stable") package-pinned-packages)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
this function is called at the very end of spacemacs initialization after
layers configuration.
this is the place where most of your configurations should be done. unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ( setq-default evil-escape-key-sequence "jk" )
  ( setq-default evil-escape-delay 0.5)
  (global-hl-line-mode -1)

  ;; spell check
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq ispell-program-name "aspell")

  ;; java
  ;; (setq eclim-eclipse-dirs "C:/Users/Alrehn/java-neon/eclipse"
  ;;       eclim-executable "C:/Users/Alrehn/java-neon/eclipse/eclim")

  ;; (use-package ensime
  ;;   :commands ensime ensime-mode)
  ;; (add-hook 'java-mode-hook 'ensime-mode)

  ;; ( define-key evil-normal-state-map (kbd "C-O") 'ensime-edit-definition)
  ;; ( define-key evil-normal-state-map (kbd "C-P") 'ensime-edit-definition-other-window)

  ;; groovy
  (add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
  (setq groovy-imports-cache-name "~/org/.groovy-imports")
  (setq groovy-imports-find-block-function 'groovy-imports-find-place-sorted-block)
  (add-hook 'groovy-mode-hook 'groovy-imports-scan-file)
  (spacemacs/set-leader-keys-for-major-mode 'groovy-mode "i" 'groovy-imports-add-import-dwim)
  (spacemacs/set-leader-keys-for-major-mode 'groovy-mode "tf" 'ggtags-find-tag-dwim)
  (spacemacs/set-leader-keys-for-major-mode 'groovy-mode "tn" 'ggtags-find-tag-continue)

  (spacemacs/set-leader-keys-for-major-mode 'java-mode "tf" 'ggtags-find-tag-dwim)
  (spacemacs/set-leader-keys-for-major-mode 'java-mode "tn" 'ggtags-find-tag-continue)

  (use-package sbt-mode
    :commands sbt-start sbt-command
    :config
    (substitute-key-definition
     'minibuffer-complete-word
     'self-insert-command
     minibuffer-local-completion-map))


  ;; company mode
  (setq company-idle-delay 0.8)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)


  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (add-hook 'c++-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           'company-irony)))

;;  (eval-after-load 'c++-mode
;;    (when (boundp 'company-backends)
;;    (make-local-variable 'company-backends)
;;    (setq company-backends (delete 'company-dabbrev-code company-backends))
;;    (add-to-list (company-backends) 'company-irony)))

;;  (eval-after-load 'company
;;    '(add-to-list 'company-backends 'company-irony))

  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

  ;;(defun my-c-common-setup ()    ;; function called by c-mode-common-hook
  ;;  (irony-mode 1)
  ;;  (company-mode))

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
     (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (when (boundp 'w32-pipe-read-delay)
    (setq w32-pipe-read-delay 0))
  ;; Set the buffer size to 64K on Windows (from the original 4K)
  (when (boundp 'w32-pipe-buffer-size)
    (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

  ;; make this a variable
  ;;(add-hook 'c++-mode-hook
   ;;         (lambda ()
   ;;           ( setq company-clang-executable "clang++.exe")
   ;;           ( setq company-clang-arguments '("-std=c++11" "-stdlib=libc++" "-Ic:\\vs_dev_lib\\include" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++\\x86_64-w64-mingw32 -IC:\\vs_dev_lib\\lib\\include -I../include"))
   ;;           ( setq flycheck-clang-args '("-std=c++11" "-stdlib=libc++" "-Ic:\\vs_dev_lib\\include" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++\\x86_64-w64-mingw32"))
   ;;           ))

  (flyspell-lazy-mode 1)

  ;; ( global-set-key (kbd "C-h") 'delete-backward-char)
  ( define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

  ;; tramp (used for remote editing files)
  ( setq-default tramp-default-method "pscp")

  ;; irc
  (setq rcirc-server-alist
        '(("irc.freenode.net"
                  :nick "alrehnn"
                  :user-name "alrehnn"
                  :port "6667"
                  :channels ("#emacs" "##c" "##c++" "#reddit-gamedev" "#gamedev" "#Moosader" "#bbg" "#C++-general" "#learnprogramming" "##c++-basic" "##C++-social" "#dota2" "#books" "##books" "#music"))))

  ;; Navigation between windows
  ( define-key evil-normal-state-map (kbd "<DEL>") 'evil-window-left)
  ( define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  ( define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  ( define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)

  ( define-key evil-normal-state-map (kbd "B") 'evil-digit-argument-or-evil-beginning-of-line)
  ( define-key evil-normal-state-map (kbd "E") 'evil-end-of-line)

  ( define-key evil-insert-state-map (kbd "C-<tab>") 'company-complete)


  ;; org stuff
  ( global-set-key (kbd "C-b") 'helm-find-files-up-one-level)
  ( spacemacs/set-leader-keys-for-major-mode 'org-mode "p" 'org-priority)

 ;; structure templates
 ;; (add-to-list 'org-structure-template-alist
 ;;              (list "p" (concat ":PROPERTIES:\n"
 ;;                                "?\n"
 ;;                                ":END:")))
 ;; (add-to-list 'org-structure-template-alist
 ;;              (list "eh" (concat ":EXPORT_FILE_NAME: ?\n"
 ;;                                 ":EXPORT_TITLE:\n"
 ;;                                 ":EXPORT_OPTIONS: toc:nil html-postamble:nil num:nil")))

  ;; mobileorg
  (setq org-mobile-directory "C:/Users/Alrehn/Dropbox/Apps/MobileOrg")
  (if (eq system-type 'darwin)
       (setq org-mobile-directory "/Users/arrehnby/Dropbox/Apps/MobileOrg")
     )
  ;; (defvar org-mobile-sync-idle-secs (* 60 10)) 
  ;; (defun org-mobile-sync ()
  ;;   (interactive)
  ;;   (org-mobile-pull)
  ;;   (org-mobile-push)) 
  ;; (defun org-mobile-sync-enable ()
  ;;   "enable mobile org idle sync"
  ;;   (interactive)
  ;;   (setq org-mobile-sync-timer
  ;;         (run-with-idle-timer org-mobile-sync-idle-secs t
  ;;                              'org-mobile-sync))) 
  ;; (defun org-mobile-sync-disable ()
  ;;   "disable mobile org idle sync"
  ;;   (interactive)
  ;;   (cancel-timer org-mobile-sync-timer)) 
  ;; (org-mobile-sync-enable)


  ;; autocommit var
  ( setq-default gac-automatically-push-p t )

  ( setq org-directory "~/org")
  ( setq-default org-agenda-files '("~/org"))
  ( setq org-default-notes-file "~/org/notes.org" )

  (setq org-hierarchical-todo-statistics nil)

  (setq org-todo-keywords
         '(
           (sequence
                     "TODO"
                     "|"
                     "DONE"
           )
           (sequence
                     "FUTURE"
                     "WAITING"
                     "NEXT"
                     "DOING"
                     "|"
                     "COMPLETE"
                     "DELEGATED"
                     "CANCELLED"
                     ))) 

  ;; custom agenda display bound to SPC o c
  (setq org-agenda-custom-commands
        '(
          ("g" todo "TODO|DOING|NEXT")
          ("c" "Agenda view"
           (
            (agenda "" ((org-agenda-span 1)) )
            (todo "DOING|WAITING|NEXT")
            (todo "TODO"
                  ((org-agenda-overriding-header "\nUnscheduled TODO")
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))
                   ))
          ))))
  (defun org-agenda-show-todos (&optional arg)
    (interactive "P")
    (org-agenda arg "g"))
  (spacemacs/set-leader-keys "ot" 'org-agenda-show-todos)
  ;; schedule bound to SPC o a
  (defun org-agenda-show-schedule (&optional arg)
    (interactive "P")
    (org-agenda arg "c"))
  (spacemacs/set-leader-keys "oa" 'org-agenda-show-schedule)
  (defun org-agenda-show-week (&optional arg)
    (interactive "P")
    (org-agenda arg "a"))
  (spacemacs/set-leader-keys "ow" 'org-agenda-show-week)


  (setq org-refile-targets '(
                             ("~/org/plan.org" :maxlevel . 2)
                             ("~/org/abe.org" :maxlevel . 6)
                             ("~/org/CSC475.org" :maxlevel . 1)
                             ("~/org/CSC421.org" :maxlevel . 1)
                             ("~/org/CSC483A.org" :maxlevel . 1)
                             ("~/org/MUS115.org" :maxlevel . 1)
                             ("~/org/AHVS311.org" :maxlevel . 1)
                             ))
  ;; super agenda
  (org-super-agenda-mode)

  ;;(let ((deadline-date  (org-read-date nil nil "+7") ) )
  (setq org-super-agenda-groups
         '(
           (:name "Deadlines"
                  :deadline t)
           (:name "Active Projects/Stories"
                  :tag ("story" "project")
                  :and (:children t :todo "DOING")
                  )
           (:name "Active Tasks"
                  :and (:not (:children t) :todo "DOING")
                  )
           (:name "Waiting"
                  :todo "WAITING"
                  )
           (:name "Next"
                  :todo "NEXT"
                  )
           (:name ""
                  :and (:not (:children t) :todo "DOING")
                  )
           (:name "Today"
                  :time-grid t
                  :tag ("today" "chores"))
           (:name "Personal"
                  :tag "personal"
                  :and (:habit t
                  :not (:tag ("work" "school"))))
           (:name "Work"
                  :tag ("work" "abe"))
           (:name "School"
                  :tag ("school"))
           (:name "Next"
                  :todo "NEXT" )
           ;;(:auto-category t)
           )) 
  ;;) 

  ;; ( setq org-capture-templates
  ;;        ;; todos
  ;;        '( ("t" "todo" entry (file "~/org/inbox.org")
  ;;                 "* TODO %?\n %i\n %a" :clock-in t :clock-resume t)
  ;;        ;; general notes
  ;;        ("n" "note" entry (file "~/org/inbox.org")
  ;;                 "* NOTE %?\n %i\n %a" :clock-in t :clock-resume t)

  ;;        ;; local notes that won't be pushed to git
  ;;        ("N" "local" entry (file "~/org/localnotes.org")
  ;;         "* NOTE %?\n %i\n %a" :clock-in t :clock-resume t)
  ;;        ("T" "local" entry (file "~/org/localtodo.org")
  ;;         "* TODO %?\n %i\n %a" :clock-in t :clock-resume t)
  ;;        ) )

  (spacemacs/set-leader-keys
    "oc" 'org-capture)

  (spacemacs/set-leader-keys
    "op" 'org-columns)

  (spacemacs/set-leader-keys
    "oq" 'org-columns-quit)

  (defun magit-diff-master (&optional args)
    "Show diff range develop...HEAD"
    (interactive)
    (magit-diff "master" args))
  (spacemacs/set-leader-keys "gdm" 'magit-diff-master)
  (spacemacs/set-leader-keys "gdd" 'magit-diff)


  ( spacemacs/set-leader-keys-for-major-mode 'c++-mode "j" 'semantic-ia-fast-jump)

  ( spacemacs/set-leader-keys-for-major-mode 'c++-mode "s" 'helm-gtags-dwim)

  ( setq python-shell-interpreter "c:/Users/Alrehn/Anaconda3/Scripts/ipython3.exe")

  ;; set this to t to have more details popup when errors happen
  ;;(setq debug-on-error t)

  ;; babel langauge support
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t)
   (python . t))) 

  (setq org-src-tab-acts-natively t) 

  ;; make this a variable
  (add-hook 'c++-mode-hook
             (lambda ()
               ( setq company-clang-arguments '("-std=c++11" "-stdlib=libc++" "-Ic:\\vs_dev_lib\\include" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++\\x86_64-w64-mingw32"))
               ( setq flycheck-clang-args '("-std=c++11" "-stdlib=libc++" "-Ic:\\vs_dev_lib\\include" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++" "-Ic:\\mingw64\\x86_64-w64-mingw32\\include\\c++\\x86_64-w64-mingw32"))
                            ))

    )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-modules (quote (org-habit)))
 '(package-selected-packages
   (quote
    (realgud test-simple loc-changes load-relative ivy-rtags ivy google-c-style helm-rtags flycheck-rtags company-rtags rtags cmake-ide levenshtein rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby org-super-agenda ht ggtags groovy-imports pcache winum fuzzy flyspell-lazy helm-gtags powershell flycheck-irony company-irony irony yaml-mode org-outlook groovy-mode mmm-mode markdown-toc markdown-mode gh-md ensime sbt-mode scala-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl sql-indent org goto-chg undo-tree diminish yapfify uuidgen py-isort org-projectile org-download live-py-mode link-hint hide-comnt git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump company-emacs-eclim eclim column-enforce-mode stickyfunc-enhance srefactor helm-flyspell auto-dictionary pyvenv pytest pyenv-mode py-yapf pip-requirements hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic f git-auto-commit-mode rcirc-notify rcirc-color ws-butler window-numbering volatile-highlights vi-tilde-fringe toc-org spaceline s powerline smooth-scrolling smeargle restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox hydra spinner page-break-lines orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets open-junk-file neotree move-text magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger flycheck-pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav disaster define-word company-statistics company-quickhelp pos-tip company cmake-mode clean-aindent-mode clang-format buffer-move bracketed-paste auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-Ic:/vs_dev_lib/include/")
     (company-clang-arguments "c:/vs_dev_lib/include/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-modules (quote (org-habit)))
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet-snippets symon string-inflection spaceline-all-the-icons all-the-icons memoize font-lock+ solarized-theme ruby-refactor pippel password-generator overseer org-category-capture org-brain nameless mvn monokai-theme meghanada maven-test-mode importmagic epc ctable concurrent deferred helm-purpose window-purpose imenu-list gradle-mode evil-org ghub evil-lion evil-cleverparens paredit editorconfig company-c-headers realgud test-simple loc-changes load-relative ivy-rtags ivy google-c-style helm-rtags flycheck-rtags company-rtags rtags cmake-ide levenshtein rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby org-super-agenda ht ggtags groovy-imports pcache winum fuzzy flyspell-lazy helm-gtags powershell flycheck-irony company-irony irony yaml-mode org-outlook groovy-mode mmm-mode markdown-toc markdown-mode gh-md ensime sbt-mode scala-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl sql-indent org goto-chg undo-tree diminish yapfify uuidgen py-isort org-projectile org-download live-py-mode link-hint hide-comnt git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump company-emacs-eclim eclim column-enforce-mode stickyfunc-enhance srefactor helm-flyspell auto-dictionary pyvenv pytest pyenv-mode py-yapf pip-requirements hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic f git-auto-commit-mode rcirc-notify rcirc-color ws-butler window-numbering volatile-highlights vi-tilde-fringe toc-org spaceline s powerline smooth-scrolling smeargle restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox hydra spinner page-break-lines orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets open-junk-file neotree move-text magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger flycheck-pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav disaster define-word company-statistics company-quickhelp pos-tip company cmake-mode clean-aindent-mode clang-format buffer-move bracketed-paste auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-Ic:/vs_dev_lib/include/")
     (company-clang-arguments "c:/vs_dev_lib/include/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
