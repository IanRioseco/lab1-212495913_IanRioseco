#lang racket
;TDA player
;representacion, lista que contiene [id, nombre, color, victorias, derrotas, empates, fichas restantes]
;constructor de un jugador en conecta4
;para ayudarme en la creacion de este TDA se lepregunto a chat-gpt sobre el uso de listas y la funcionalidad de car y cdr

(define (player id name color wins losses draws remaining-pieces)
  (list id name color wins losses draws remaining-pieces))
;selector de jugadores
(define (get-player-id player)
  (car player))
;
(define (get-player-name player)
  (cadr player))
;
(define (get-player-color player)
  (caddr player))
;
(define (get-player-wins player)
  (cadddr player))
;
(define (get-player-losses player)
  (car(cddddr player)))
;
(define (get-player-draws player)
  (cadr (cddddr player)))
;
(define (get-player-remaining-pieces player)
  (caddr (cdddr player)))

;modificador de los datos del player si es que llega a ser necesario


