#lang racket
(provide (all-defined-out))

; Descripción: Funcion que permite crear una nueva partida.
; Dom: player1(player) X player2(player) X board(board)X current-turn(int)
; Rec: game
; Tipo recursión: No aplica.

; TDA Game
; Constructor de un juego de Conecta4

(define (game player1 player2 board current-turn)
  (list player1 player2 board current-turn '()))

; Selectores del juego
(define (game-player1 game) (car game))
(define (game-player2 game) (cadr game))
(define (game-board game) (caddr game))
(define (game-current-turn game) (cadddr game))
(define (game-history game)(car (cddddr game)))



; Descripción: Funcion que permite crear una nueva partida.
; Dom: player1(player) X player2(player) X board(board)X current-turn(int)
; Rec: game
; Tipo recursión: No aplica.

