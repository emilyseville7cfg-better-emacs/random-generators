;;; random-generators.el --- Functions to generate random numbers and data structures  -*- lexical-binding: t; -*-

;; Copyright (c) 2022 Emily Grace Seville <EmilySeville7cfg@gmail.com>
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
;;  For details view README file.

;; URL: https://github.com/Emilyseville7cfg/random-generators

;;; Code:

(defun random-generators-number(&optional from to)
  "Generate a number inside specific boundaries.
FROM: the lowest range boundary (default: 0)
TO: the highest range boundary (default: 100)"
  (unless (or (integerp from) (null from))
    (error "The lowest range boundary '%s' is not an integer or nil" from))
  (unless (or (integerp to) (null to))
    (error "The highest range boundary '%s' is not an integer or nil" to))
  
  (setq from (cond
	      ((null from) 0)
	      (t from))
	to (cond
	    ((null to) 100)
	    (t to)))
  
  (if (> from to)
      (error "The lowest range boundary '%s' exceeds the highest range boundary '%s'" from to))
  (+ from (random (1+ (- to from)))))

(iter-defun random-generators-sequence(&optional length from to)
  "Generate a sequence with a specific LENGTH.
LENGTH: the sequence length (default: 10)
FROM: the lowest range boundary (default: 0)
TO: the highest range boundary (default: 100)"
  (unless (or (integerp length) (null length))
    (error "The sequence length '%s' is not an integer or nil" length))
  (unless (or (integerp from) (null from))
    (error "The lowest range boundary '%s' is not an integer or nil" from))
  (unless (or (integerp to) (null to))
    (error "The highest range boundary '%s' is not an integer or nil" to))
  
  (setq length (cond
		((null length) 10)
		(t length))
	from (cond
	      ((null from) 0)
	      (t from))
	to (cond
	    ((null to) 100)
	    (t to)))

  (if (< length 0)
      (error "The sequence length '%s' is less than zero" length))
  (if (> from to)
      (error "The lowest range boundary '%s' exceeds the highest range boundary '%s'" from to))
  (dotimes (i length)
    (iter-yield (random-generators-number from to))))

(defun random-generators-list(&optional length from to)
  "Generate a list with a specific LENGTH.
LENGTH: the list length (default: 10)
FROM: the lowest range boundary (default: 0)
TO: the highest range boundary (default: 100)"
  (unless (or (integerp length) (null length))
    (error "The list length '%s' is not an integer or nil" length))
  (unless (or (integerp from) (null from))
    (error "The lowest range boundary '%s' is not an integer or nil" from))
  (unless (or (integerp to) (null to))
    (error "The highest range boundary '%s' is not an integer or nil" to))
  
  (setq length (cond
		((null length) 10)
		(t length))
	from (cond
	      ((null from) 0)
	      (t from))
	to (cond
	    ((null to) 100)
	    (t to)))

  (if (< length 0)
      (error "The list length '%s' is less than zero" length))
  (if (> from to)
      (error "The lowest range boundary '%s' exceeds the highest range boundary '%s'" from to))
  (cl-loop for i upfrom 1 upto length
	   collect (random-generators-number from to)))

(iter-defun random-generators--sequence-from-implementation(sequence &optional length)
  "Generate a sequence with a specific LENGTH from another one.
LENGTH: the sequence length (default: 10)
SEQUENCE: the sequence to take items from"
  (unless (or (integerp length) (null length))
    (error "The list length '%s' is not an integer or nil" length))

  (setq length (cond
		((null length) 10)
		(t length)))

  (if (< length 0)
      (error "The list length '%s' is less than zero" length))

  (dotimes (i length)
    (iter-yield (elt sequence (random-generators-number 0 (1- (length sequence)))))))

(iter-defun random-generators-sequence-from(sequence &optional length)
  "Generate a sequence with a specific LENGTH from another one.
LENGTH: the sequence length (default: 10)
SEQUENCE: the sequence to take items from"
  (if (null sequence)
      (error "The sequence '%s' is nil" sequence))
  (iter-do (item (random-generators--sequence-from-implementation sequence length))
    (iter-yield item)))

(iter-defun random-generators-sequence-from-or-empty(sequence &optional length)
  "Try generate a sequence with a specific LENGTH from another one.
LENGTH: the sequence length (default: 10)
SEQUENCE: the sequence to take items from"
  (if (null sequence)
      '()
    (iter-do (item (random-generators--sequence-from-implementation sequence length))
      (iter-yield item))))

(defun random-generators--list-from-implementation(sequence &optional length)
  "Generate a list with a specific LENGTH from another one.
LENGTH: the list length (default: 10)
SEQUENCE: the sequence to take items from"
  (unless (or (integerp length) (null length))
    (error "The list length '%s' is not an integer or nil" length))

  (setq length (cond
		((null length) 10)
		(t length)))

  (if (< length 0)
      (error "The list length '%s' is less than zero" length))
  
  (cl-loop for i upfrom 1 upto length
	   collect (elt sequence (random-generators-number 0 (1- (length sequence))))))

(defun random-generators-list-from(sequence &optional length)
  "Generate a list with a specific LENGTH from another one.
LENGTH: the list length (default: 10)
SEQUENCE: the sequence to take items from"
  (if (null sequence)
      (error "The sequence '%s' is nil" sequence))
  (random-generators--list-from-implementation sequence length))

(defun random-generators-list-from-or-empty(sequence &optional length)
  "Try generate a list with a specific LENGTH from another one.
LENGTH: the list length (default: 10)
SEQUENCE: the sequence to take items from"
  (if (null sequence)
      '()
    (random-generators--list-from-implementation sequence length)))

(provide 'random-generators)

;;; random-generators.el ends here
