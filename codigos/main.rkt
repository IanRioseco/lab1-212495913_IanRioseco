#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")

#| EJEMPLO DE COMO ACTUALIZAR LOS DATOS DE UN JUGADOR |#
;; Definimos un jugador inicial
(define jugador (player 1 "Ian" "red" 2 1 0 21))  ; Jugador inicial con 21 piezas
(define jugador2 (player 1 "nai" "yellow" 2 1 0 21))

;; Llamamos a la función para decrementar las piezas
(define jugador-actualizado (decrease-player-pieces jugador))
(define jugador-actualizado2 (increment-player-losses jugador-actualizado))
(define jugador-actualizado3 (increment-player-draw jugador-actualizado2))

;; Mostrar resultados
(display "Jugador actualizado: ")
(display jugador-actualizado3) ; Muestra la lista completa del jugador actualizado
(newline)

(display "Piezas restantes actualizadas jugador 3: ")
(display (get-player-remaining-pieces jugador-actualizado3))  ; Muestra las piezas restantes
(newline)
(newline)

;; creacion del tablero
(display "TABLERO")
(newline)
(define tablero (board))
(display tablero)
(newline)
(newline)

;; verificacion de si es posible
(display "#f no es posible realizar mas jugadas")
(newline)
(display "#t es posible realizar mas jugadas")
(newline)
(board-can-play? tablero)

(define red-piece (piece 'yellow))
(display red-piece)
(newline)

(define tab (board-set-play-piece tablero 4 red-piece))
(display tab)
(newline)
(define tab2 (board-set-play-piece tab 4 red-piece))
(newline)
(display tab2)
(newline)
(define tab3 (board-set-play-piece tab2 4 red-piece))
(define tab4 (board-set-play-piece tab3 4 red-piece))
(define tab5 (board-set-play-piece tab4 4 red-piece))
(display tab4)

(check-vertical-win tab5)
(newline)

(define new-game (game jugador jugador2 tab5 1))
(display new-game)
