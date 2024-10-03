#lang racket
(require "TDAplayer.rkt")
;funcion para actualizar las victorias del jugador
;La función increment-player-wins toma un jugador (una lista que representa sus datos) y devuelve una nueva lista donde el número de victorias del jugador ha sido incrementado en 1
;DOM: playerXincremento de victorias
;REC:player
(define increment-player-wins
  (lambda (player)
    (list (get-player-id player)             
          (get-player-name player)           
          (get-player-color player)          
          (+ 1 (get-player-wins player))     
          (get-player-losses player)         
          (get-player-draws player)          
          (get-player-remaining-pieces player))))

;funcion para disminuir el numero de fichas
(define decrease-player-pieces
  (lambda (player)
    (list (get-player-id player)             
          (get-player-name player)           
          (get-player-color player)          
          (+ 1 (get-player-wins player))     
          (get-player-losses player)         
          (get-player-draws player)          
          (get-player-remaining-pieces player))))