# random-generators

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
By convention all parameters are ordered as follows: `sequence`, `from`, `to`, and `length`.
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
- Function: `random-generators-list-from sequence [length]`
  Description: Generate a list with a specific length from another one.

## FAQ

- Why provided functions are more predictable than standard ones?
  Because they explicitly mandate user to pass just integer arguments for range borders and
  unlike `random` don't generate unconstrained random numbers with `LIMIT` < 0 which can be
  unexpected behavior.
- Why to use generators to generate random sequences?
  As long as sequences can be extremely long not to consume too much memory it's better to use generators.