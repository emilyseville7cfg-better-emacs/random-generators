# Random generators

[![CI](https://github.com/emilyseville7cfg-better-emacs/random-generators/actions/workflows/ci.yml/badge.svg)](https://github.com/emilyseville7cfg-better-emacs/random-generators/actions/workflows/ci.yml)

Functions to generate random numbers and data structures.

## Requirenments

- `emacs 27.1` higher

## Features

- [x] Predictable random number generation
- [x] Predictable lazy random ranges generation
- [x] Predictable random lists generation

## Installation

### Copy-paste plugin script contents to `~/.emacs` while enabling lexical-binding

Example `~/.emacs` config:

```emacs
;;; -*- lexical-binding: t; -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; The extension file content with all comments removed can be placed here.

(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(package-selected-packages '(markdown-mode)))
(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
)
```

## Functionality

All `from`, `to` and `length` parameters are optional and default to the following values respectively: `0`, `100`, and `10`.
By convention all parameters are ordered as follows:

- `length`, `from`, and `to` (for functions accepting random number ranges)
- `sequence`, and `length` (for functions accepting another sequence)

Functions ending with `-from` generate sequences or lists from items of existing sequences. 
Below square brackets are used to represent optional parameters and **not** arrays.

- Function: `random-generators-number [from to]`
  Description: Generate a number inside specific boundaries.
- Function: `random-generators-sequence [length from to]`
  Description: Generate a sequence with a specific length.
- Function: `random-generators-list [length from to]`
  Description: Generate a list with a specific length.
- Function: `random-generators-sequence-from sequence [length]`
  Description: Generate a sequence with a specific length from another one.
- Function: `random-generators-sequence-from-or-empty sequence [length]`
  Description: Try generate a sequence with a specific length from another one.
- Function: `random-generators-list-from sequence [length]`
  Description: Generate a list with a specific length from another one.
- Function: `random-generators-list-from-or-empty sequence [length]`
  Description: Try generate a list with a specific length from another one.

## Examples

Generate a random number within `[10..20]` range:

```lisp
(random-generators-number 10 20)
```

Generate a sequence of 5 random numbers within `[10..20]` range:

```lisp
(iter-do (item (random-generators-sequence 5 10 20)) (message (format "item is %d" item)))
```

Generate a list of 5 random numbers within `[10..20]` range:

```lisp
(random-generators-list 5 10 20)
```

Generate a sequence of 5 randomly choosen numbers from a list:

```lisp
(iter-do (item (random-generators-sequence-from '(2 4 6 8) 5)) (message (format "item is %d" item)))
```

Note `random-generators-sequence-from-or-empty` can be used if instead of non-empty sequence like `'(2 4 6 8)` you pass possibly empty one as
in this case no error will be thown for `'()`. The same rule applies to `random-generators-list-from` function too.

## FAQ

- Why provided functions are more predictable than standard ones?
  Because they explicitly mandate user to pass just integer arguments for range borders and
  unlike `random` don't generate unconstrained random numbers with `LIMIT` < 0 which can be
  unexpected behavior.
- Why to use generators to generate random sequences?
  As long as sequences can be extremely long not to consume too much memory it's better to use generators.
