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
  "Expect a correct number when all parameters are correct."
  (let ((result (random-generators-number 1 10)))
    (should (and (<= 1 result) (<= result 10)))))

(ert-deftest random-generators-sequence--expect-error-when-length-is-not-integer()
  "Expect error when LENGTH is not an integer."
  (should-error (iter-do (item (random-generators-sequence "wrong")) (message "unreachable"))))

(ert-deftest random-generators-sequence--expect-error-when-from-is-not-integer()
  "Expect error when FROM is not an integer."
  (should-error (iter-do (item (random-generators-sequence 5 "wrong")) (message "unreachable"))))

(ert-deftest random-generators-sequence--expect-error-when-to-is-not-integer()
  "Expect error when TO is not an integer."
  (should-error (iter-do (item (random-generators-sequence 5 1 "wrong")) (message "unreachable"))))

(ert-deftest random-generators-sequence--expect-correct-sequence-when-parameters-are-correct()
  "Expect a correct sequence when all parameters are correct."
  (iter-do (item (random-generators-sequence 1 1 10)) (should (and (<= 1 item) (<= item 10)))))

(ert-deftest random-generators-list--expect-error-when-length-is-not-integer()
  "Expect error when LENGTH is not an integer."
  (should-error (random-generators-list "wrong")))

(ert-deftest random-generators-list--expect-error-when-from-is-not-integer()
  "Expect error when FROM is not an integer."
  (should-error (random-generators-list 5 "wrong")))

(ert-deftest random-generators-list--expect-error-when-to-is-not-integer()
  "Expect error when TO is not an integer."
  (should-error (random-generators-list 5 1 "wrong")))

(ert-deftest random-generators-list--expect-correct-list-when-parameters-are-correct()
  "Expect a correct list when all parameters are correct."
  (let ((result (car (random-generators-list 1 1 10))))
    (should (and (<= 1 result) (<= result 10)))))

(ert-deftest random-generators-sequence-from--expect-error-when-sequence-is-nil()
  "Expect error when SEQUENCE is nil."
  (should-error (random-generators-sequence-from)))

(ert-deftest random-generators-sequence-from--expect-error-when-length-is-not-integer()
  "Expect error when LENGTH is not an integer."
  (should-error (iter-do (item (random-generators-sequence-from '(1) "wrong")) (message "unreachable"))))

(ert-deftest random-generators-sequence-from--expect-correct-sequence-when-parameters-are-correct()
  "Expect a correct sequence when all parameters are correct."
  (iter-do (item (random-generators-sequence-from '(1) 5)) (should (equal item 1))))

(ert-deftest random-generators-list-from--expect-error-when-sequence-is-nil()
  "Expect error when SEQUENCE is nil."
  (should-error (random-generators-list-from)))

(ert-deftest random-generators-list-from--expect-error-when-length-is-not-integer()
  "Expect error when LENGTH is not an integer."
  (should-error (random-generators-list-from '(1) "wrong")))

(ert-deftest random-generators-list-from--expect-correct-sequence-when-parameters-are-correct()
  "Expect a correct sequence when all parameters are correct."
  (should (equal (random-generators-list-from '(1) 5) '(1 1 1 1 1))))

;;; tests.el ends here
