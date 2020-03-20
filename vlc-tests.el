;;; vlc-tests.el --- Tests                           -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Xu Chunyang

;; Author: Xu Chunyang

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

;; vlc.el tests.

;;; Code:

(require 'vlc)
(require 'ert)

(ert-deftest vlc--url-encode-params ()
  (should (string= (vlc--url-encode-params nil) ""))
  (should (string= (vlc--url-encode-params '(:command pl_pause)) "command=pl_pause"))
  (should (string= (vlc--url-encode-params '(:command in_play :input "file:///" :option "novideo"))
                   "command=in_play&input=file%3A%2F%2F%2F&option=novideo")))

(ert-deftest vlc--uniquify ()
  (should (string= (vlc--uniquify "a" nil) "a"))
  (should (string= (vlc--uniquify "a" '("a")) "a<2>"))
  (should (string= (vlc--uniquify "a" '("a" "a<2>")) "a<3>"))
  (should (string= (vlc--uniquify "a" '("a" "b" "c" "a<2>" "a<3>")) "a<4>")))

(provide 'vlc-tests)
;;; vlc-tests.el ends here
