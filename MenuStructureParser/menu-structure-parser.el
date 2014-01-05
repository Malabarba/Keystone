;;; menu-structure-parser.el --- 

;; Copyright (C) 2014 Artur Malabarba <bruce.connor.am@gmail.com>

;; Author: Artur Malabarba <bruce.connor.am@gmail.com>
;; URL: http://github.com/Bruce-Connor/Keystone
;; Version: 0.1a
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;;
;; Specifically, we take no responsibility if you get banned for using
;; it or accidentally spend money as a consequence of using it.
;; USE IT AT YOUR OWN RISK.
;;
;; On a lighter note, if Blizzard decides to rule against it, we'll do
;; our best to comply and to notify everyone.

;;; Change Log:
;; 0.1a - 2014/01/01 - Created File.
;;; Code:

(require 'cl)

(defvar current-name nil "") 
(defvar buttons-coord-list--impl nil
  "List where each element is a list holding a button's name and its coordinates.")
(defvar buttons-coord-list '(("Back" "0.95" "0.85")
                             ("Option" "0.95" "0.95"))
  "List where each element is a list holding a button's name and its coordinates.
Default value.")

(defun parse-orgfile (infile)
  "Read org file INFILE and return a list with the contents"
  (setq infile (expand-file-name (or infile "menus-structure.org")))
  (unless (file-readable-p infile)
    (error "File %s isn't readable!" infile))
  (with-temp-buffer
    (insert-file-contents infile)
    (goto-char (point-min))
    (org-mode)
    (let (out)
      (while (search-forward "\n* " nil :noerror)
        (let ((current-name (name-at-point)))
          (forward-line 1)
          (add-to-list 'out (cons current-name (parse-table)))))
      out)))

(defun name-at-point ()
  "(substring-no-properties (thing-at-point 'symbol))"
  (substring-no-properties (thing-at-point 'symbol)))

(defun parse-table ()
  "Parse table under point and return it in list form."
  (mapcar
   (lambda (it) (mapcar 'table-element-parser it))
   (org-table-to-lisp)))

(defun table-element-parser (st)
  "Generate a table element from the string ST.

Assumes a dynamic binding for the variable `current-name'."
  (let* ((data (split-string st " " t))
         (var-name (car data))
         (prefixed-name (concat current-name "Menu" var-name)))
    ;; If this button already has registered coordinates, just return
    ;; its name.
    (when data
      (if (assoc var-name buttons-coord-list--impl)
          var-name
        (unless (assoc prefixed-name buttons-coord-list--impl)
          (add-to-list 'buttons-coord-list--impl (cons prefixed-name (cdr data))))
        prefixed-name))))


(defvar ahk-file-header 
  "; AutoHotkey Version: v1.1.13.01
; Language:       English
; Platform:       Win9x/NT
; Author:         Artur Malabarba <bruce.connor.am@gmail.com>
; Copyright:      Artur Malabarba <bruce.connor.am@gmail.com>
;
;; ### NO WARRANTY and DISCLAIMER ###
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;;
;; Specifically, we take no responsibility if you get banned for using
;; it or accidentally spend money as a consequence of using it.
;; USE IT AT YOUR OWN RISK.
;;
;; On a lighter note, if Blizzard decides to rule against it, we'll do
;; our best to comply and to notify everyone.
;;
;; You may read, download, modify, and compile it at your leisure, but
;; you MAY NOT distribute it (or a modified version of it) without my
;; permission.

;; THIS FILE WAS AUTOMATICALLY GENERATED.

")

(defun write-ahk-file (outfile bs bc)
  "Take a list of buttons structure BS and a list of button coordinates BC and generate an ahk script OUTFILE for navigating the structure. "
  (setq outfile (expand-file-name (or outfile "menuss.ahk")))
  (unless (file-writable-p outfile)
    (error "File %s isn't writable!" outfile))
  (message "%S" bc)
  (with-temp-file outfile
    (insert ahk-file-header
            ;; ID of menus
            (buttons-id (mapcar 'car bs))
            ;; ID of buttons
            (buttons-id (mapcar 'car bc))
            "\n\nmenusPrepareRelativeVariables() {\n  global\n\n"
            (buttons-initial-coordinate-assignments bc)
            "\n}\n\nmenusCalculateAbsoluteVariables() {\n  global\n\n"
            (buttons-absolute-coordinate-transformations bc)
            "\n\n}\n\n"
            )))

(defun buttons-id (nl)
  "Given a list of NAME's assign an integer id to each NAME."
  (let ((out "")
        (i 0))
    (dolist (it nl out)
      (setq out (concat out "id_" it " := " (int-to-string (incf i)) "\n")))))

(defun buttons-initial-coordinate-assignments (bc)
  "Given a list of (NAME X Y), return a string assigning the coordinates."
  (mapconcat
   (lambda (it)
     (concat "  " (car it) "X := " (cadr it) "\n"
             "  " (car it) "Y := " (caddr it) "\n"))
   bc ""))

(defun buttons-absolute-coordinate-transformations (bc)
  "Given a list of (NAME X Y), return a string transforming the coordinates."
  (mapconcat
   (lambda (it)
     (let ((name (car it)))
       (concat "  " name "X := WindowX + WindowWidth * " name "X\n"
               "  " name "Y := WindowY + WindowHeight * " name "Y\n")))
   bc ""))

(setq debug-on-error t)

(let* ((buttons-coord-list--impl buttons-coord-list)
       (buttons-structure (parse-orgfile (car command-line-args-left))))
  (write-ahk-file (cadr command-line-args-left)
                  buttons-structure
                  buttons-coord-list--impl))

;;; menu-structure-parser.el ends here.



