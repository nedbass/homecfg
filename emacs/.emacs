(global-font-lock-mode 1)
(global-set-key "\C-o"     'other-window)
(load-file "/usr/share/emacs/site-lisp/xcscope.el")
(require 'xcscope)

(display-time)
(global-font-lock-mode 1)
(load "view")
(ansi-color-for-comint-mode-on)
(cond ((not window-system)
       (set-face-foreground 'mode-line "green")
       (set-face-foreground 'font-lock-function-name-face "yellow")
       (set-face-foreground 'font-lock-builtin-face "cyan")
       (set-face-foreground 'font-lock-comment-face "white")
       (set-background-color "black")
))

(defun View-scroll-line-forward-leaving-point ()
  "Scroll view forward by one line but don't move point."
  (interactive)
  (let ((original (point)))
    (View-scroll-line-forward)
    (goto-char original)))

(defun move-point-to-top-of-window ()
  "Moves the point to the top of the current window."
  (interactive)
  (move-to-window-line 0))

(defun move-point-to-bottom-of-window ()
  "Moves the point to the bottom of the current window."
  (interactive)
  (move-to-window-line -1))
(defun move-point-to-middle-of-window ()
  "Moves the point to the middle of the current window."
  (interactive)
  (move-to-window-line nil))

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

(defun combine-what-cursor-position-and-what-line ()
  "Displays the combined output of the what-cursor-position and what-line
functions."
  (interactive)
  (message "%s" (concat (what-cursor-position) (what-line))))

(defun copy-rest-of-line-as-kill ()
  "Copies the region from the point to the end of the line into the kill
buffer."
  (interactive)
  (let ((original (point)))
    (end-of-line)
    (copy-region-as-kill original (point))
    (goto-char original))
  (message "Rest of line copied to kill buffer."))

(defun delete-above-lines ()
  "Deletes all lines in the buffer above the position of the cursor."
  (interactive "*")
  (save-excursion
    (beginning-of-line)
    (delete-region (point-min) (point))))

(defun delete-ctrl-m ()
  "Deletes all CTRL-M characters (^M = return key) in a buffer."
  (interactive "*")
  (save-excursion
    (goto-char (point-min))
    (replace-string "\015" "")))

(defun delete-point-to-point-max ()
  "Deletes all characters from the current position of the cursor to
the end of the buffer."
  (interactive "*")
  (delete-region (point) (point-max)))

(defun delete-spaces (NUM)
  "Delete the specified number of spaces at the current cursor position."
  (interactive "*P")
  (if (>= NUM 0)
      (if (search-forward (make-string NUM (string-to-char " "))
                          (+ (point) NUM) t)
          (replace-match ""))))
(defun insert-hash-at-beginning-of-line (LINES)
  "Inserts a hash character (#) at the beginning of the line."
  (interactive "*p")
  (let ((direction (if (< LINES 0) -1 1))
        (numLines (abs LINES)))
    (while (> numLines 0)
      (beginning-of-line)
      (insert "#")
      (next-line direction)
      (beginning-of-line)
      (setq numLines (1- numLines)))))

(defun kill-whitespace-as-text (LINE)
  "Identical to kill-line, but only kills the newline if it's the first
character after the point and the prefix argument is nil."
  (interactive "*P")
  (if LINE
      (kill-line LINE)
    (let ((start (point)))
      (end-of-line)
      (if (= start (point))
          (forward-char 1))
      (kill-region start (point)))))

(defun line-to-top (LINE)
  "Moves the current line to be LINE lines from the top of the screen."
  (interactive "P")
  (if LINE
      (recenter LINE)
    (recenter 0)))


(global-set-key "\C-o"     'other-window)
(global-set-key "\C-x="    'combine-what-cursor-position-and-what-line)
(define-key esc-map "c"    'copy-rest-of-line-as-kill)
(define-key esc-map "h"    'help-command)
(global-set-key "\C-c#"    'insert-hash-at-beginning-of-line)
(global-set-key "\C-ce"    'delete-point-to-point-max)
(global-set-key "\C-cd"    'delete-above-lines)
(global-set-key "\C-cs"    'shell)
(global-set-key "\C-ch"    'move-point-to-top-of-window)
(global-set-key "\C-cm"    'move-point-to-middle-of-window)
(global-set-key "\C-cl"    'move-point-to-bottom-of-window)
(global-set-key "\C-c#"    'comment-region)
(global-set-key "\C-h"     'backward-delete-char)
(global-set-key "\C-\M-n"  'View-scroll-line-forward-leaving-point)
(global-set-key "\C-\M-p"  'View-scroll-line-backward)
(global-set-key "\eg" 'goto-line)   
(global-set-key "%" 'match-paren)


