#lang racket
(provide (all-defined-out))
(require "TDAboard.rkt")
; Descripción: Funcion que verifica si es posible realizar una jugada.
; Dom: tablero (board).
; Rec: boleano (#t si se puede jugar, #f si no).
; Tipo recursión: natural.
 (define (board-can-play? board) 
   (define (fila-tiene-espacio fila)
     (member 'vacio fila))
   
   (define (tablero-tiene-espacio filas)
     (cond
       ((null? filas) #f)
        ((fila-tiene-espacio (car filas)) #t)
         (else (tablero-tiene-espacio (cdr filas)))))
   
   (tablero-tiene-espacio board))
     
       

