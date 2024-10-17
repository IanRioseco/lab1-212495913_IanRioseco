#lang racket
(provide (all-defined-out))
; Descripción: funcion con la cual se crea una piece especificando el color del cual la quiere.
; Dom: color (string).
; Rec: piece.
; Tipo recursión: No aplica.

;constructor

#|(define (piece-color color)
  (list color)
  (car piece-color))|#

(define (piece color)
  color)

;selector
(define (color piece)
  (piece))
