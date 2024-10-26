#lang racket
(provide (all-defined-out))
(require "TDAplayer.rkt")

;; Inicializar lista vacía de colores
(define player-colors '())

;; Función para agregar el color de un jugador y mantener solo dos valores
(define (add-player-color color player-colors)
  (if (< (length player-colors) 2)
      (append player-colors (list color))  ;; Añade el color si hay menos de dos valores
      player-colors))  ;; Devuelve sin cambios si ya tiene dos colores

(define (get-player1 player-colors)
  (cdr player-colors))


