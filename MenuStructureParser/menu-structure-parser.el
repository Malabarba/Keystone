;;; menu-structure-parser.el --- 

;; Copyright (C) 2014 Artur Malabarba <bruce.connor.am@gmail.com>

;; Author: Artur Malabarba <bruce.connor.am@gmail.com>
;; URL: http://github.com/Bruce-Connor/Keystone
;; Version: 0.1a
;; 

;;; Change Log:
;; 0.1a - 2014/01/01 - Created File.
;;; Code:

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
   (lambda (x) (mapcar 'table-element-parser x))
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


(defun write-ahk-file (outfile bs bc)
  "Take a list of buttons structure BS and a list of button coordinates BC and generate an ahk script OUTFILE for navigating the structure. "
  (setq outfile (expand-file-name (or outfile "menus.ahk")))
  (unless (file-writable-p outfile)
    (error "File %s isn't writable!" outfile))
  (with-temp-file outfile
    (insert )))

(let ((buttons-coord-list--impl (copy-list buttons-coord-list))
      (buttons-structure (parse-orgfile (car command-line-args-left))))
  (write-ahk-file (cadr command-line-args-left)
                  buttons-coord-list--impl
                  buttons-structure))
;;; menu-structure-parser.el ends here.
