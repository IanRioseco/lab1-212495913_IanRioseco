#lang racket
(require "TDAplayer.rkt")
;; Lista inicial de IDs de jugadores
(define player-ids '())

;; Función que recibe un jugador, saca su ID y lo agrega a la lista
(define (add-player jugador)
  (define player-id (get-player-id jugador))  ;; Saca el ID del jugador
  (set! player-ids (cons player-id player-ids)))  ;; Agrega el ID a la lista
