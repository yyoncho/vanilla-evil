;;; vanilla-evil.el --- Vanila Evil                   -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Ivan Yonchovski


;; Author: Ivan Yonchovski <yyoncho@gmail.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'evil)

(defun vanilla-evil-delete ()
  (interactive)
  (setq unread-command-events (listify-key-sequence "\C-od")))

(defun vanilla-evil-yank ()
  (interactive)
  (setq unread-command-events (listify-key-sequence "\C-oy")))

(defvar vanilla-evil-map (let ((map (make-sparse-keymap)))
                           (define-key map (kbd "C-o") #'evil-execute-in-normal-state)
                           (define-key map (kbd "C-w") #'vanilla-evil-delete)
                           (define-key map (kbd "M-w") #'vanilla-evil-yank)
                           map)
  "Keymap for `vanilla-evil-mode'.")

(define-minor-mode vanilla-evil-mode
  "Minor mode which enables "
  :global t
  :keymap vanilla-evil-map)

(provide 'vanilla-evil)
;;; vanilla-evil.el ends here
