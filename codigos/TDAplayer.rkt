#lang racket
(provide (all-defined-out))
;TDA player
;representacion, lista que contiene [id, nombre, color, victorias, derrotas, empates, fichas restantes]
;constructor de un jugador en conecta4
;para ayudarme en la creacion de este TDA se lepregunto a chat-gpt sobre el uso de listas y la funcionalidad de car y cdr

;Name:get-id-line
;Dom: line
;Rec: id
#|Desc: Funcion que obtiene la id de la linea|#
(define (player id name color wins losses draws remaining-pieces)
  (list id name color wins losses draws remaining-pieces))


;selector de jugadores

;Name:get-player-id
;Dom: player
;Rec: id del jugador
#|Desc: Funcion que obtiene la id de la linea|#
(define (get-player-id player)
  (car player))

;Name:get-palyer-name
;Dom: player
;Rec: nombre del jugador
#|Desc: Funcion que obtiene la id de la linea|#
(define (get-player-name player)
  (cadr player))

;Name:get-palyer-color
;Dom: player
;Rec: color de las fichas del jugador
#|Desc: Funcion que obtiene la id de la linea|#
(define (get-player-color player)
  (caddr player))

;Name:get-player-wins
;Dom: player
;Rec: numero de victorias
#|Desc: Funcion que obtiene la id de la linea|#
(define (get-player-wins player)
  (cadddr player))

;Name:get-player-losses
;Dom: player
;Rec: numero de derrotas
#|Desc: Funcion que obtiene la id de la linea|#
(define (get-player-losses player)
  (car(cddddr player)))

;Name:get-player-draws
;Dom: player
;Rec: numero de empates
#|Desc: Funcion que obtiene la id de la linea|#
(define (get-player-draws player)
  (cadr (cddddr player)))

;Name:get-player-remaining-pieces
;Dom: player
;Rec: numero de piezas restantes
#|Desc: Funcion que obtiene la id de la linea|#
(define (get-player-remaining-pieces player)
  (caddr (cdddr player)))


