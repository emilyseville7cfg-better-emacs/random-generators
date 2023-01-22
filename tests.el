;;; tests.el --- Unit tests  -*- lexical-binding: t; -*-

;; Copyright (c) 2023 Emily Grace Seville <EmilySeville7cfg@gmail.com>
;; Version: 0.1
;; Package-Requires: ((emacs "27.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;  This package is the part of Better Emacs project.

;; URL: https://github.com/emilyseville7cfg-better-emacs/random-generators

;;; Code:

(load-file "./random-generators.el")

(ert-deftest random-generators-number--expect-error-when-from-is-not-integer()
  "Expect error when FROM is not an integer."
  (should-error (random-generators-number "wrong")))

(ert-deftest random-generators-number--expect-error-when-to-is-not-integer()
  "Expect error when TO is not an integer."
  (should-error (random-generators-number 1 "wrong")))

(ert-deftest random-generators-number--expect-error-when-from-greater-than-to()
  "Expect error when FROM is greater than TO."
  (should-error (random-generators-number 10 1)))

(ert-deftest random-generators-number--expect-correct-number-when-parameters-are-correct()
  "Expect error when FROM is greater than TO."
  (let ((result (random-generators-number 1 10)))
    (should (and (<= 1 result) (<= result 10)))))

;;; tests.el ends here
