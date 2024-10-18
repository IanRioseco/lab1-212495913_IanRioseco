#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")

#| EJEMPLO DE COMO ACTUALIZAR LOS DATOS DE UN JUGADOR |#
;; Definimos un jugador inicial
(display "PRUEBA FUNCION CREAR JUGADOR")
(newline)
(define jugador (player 1 "Ian" "red" 2 1 0 21)); Jugador inicial con 21 piezas
(display jugador)
(newline)
(define jugador2 (player 1 "nai" "yellow" 2 1 0 21))
(display jugador2)
(newline)
(newline)

;; Llamamos a la función para decrementar las piezas
(define jugador-actualizado (decrease-player-pieces jugador))
(define jugador-actualizado2 (increment-player-losses jugador-actualizado))
(define jugador-actualizado3 (increment-player-draw jugador-actualizado2))

;; Mostrar resultados
(display "PRUEBA FUNCIONES PARA ACTUALIZAR LAS PIEZAS,VICTORIAS,DERROTAS O EMPATES DEL JUGADOR")
(newline)
(display "Jugador actualizado: ")
(display jugador-actualizado3) ; Muestra la lista completa del jugador actualizado
(newline)
(display "Piezas restantes actualizadas jugador 3: ")
(display (get-player-remaining-pieces jugador-actualizado3))  ; Muestra las piezas restantes
(newline)
(newline)

;; creacion del tablero
(display "PRUBEA FUNCION CREAR TABLERO")
(newline)
(define tablero board)
(display tablero)
(newline)
(newline)

(display "prueba funcion si es posible realizar jugadas")
(newline)
(display "#f no es posible realizar mas jugadas")
(newline)
(display "#t es posible realizar mas jugadas")
(newline)
(board-can-play? tablero)
(newline)
(newline)


(display "prueba funcion crear ficha")
(newline)
(define yellow-piece (piece "yellow"))
(define red-piece (piece "red"))
(display red-piece)
(newline)
(newline)


(display "prueba funcion poner ficha en tablero")
(newline)
(define tab (board-set-play-piece tablero 0 red-piece))
(define tab2 (board-set-play-piece tab 1 red-piece))
(define tab3 (board-set-play-piece tab2 2 red-piece))
(define tab4 (board-set-play-piece tab3 3 red-piece))
(define tab5 (board-set-play-piece tab4 4 red-piece))
(define tab6 (board-set-play-piece tab5 5 red-piece))
(define tab7 (board-set-play-piece tab6 6 red-piece))

(define tab8 (board-set-play-piece tab7 0 yellow-piece))
(define tab9 (board-set-play-piece tab8 1 yellow-piece))
(define tab10 (board-set-play-piece tab9 2 yellow-piece))
(define tab11 (board-set-play-piece tab10 3 yellow-piece))
(define tab12 (board-set-play-piece tab11 4 yellow-piece))
(define tab13 (board-set-play-piece tab12 5 yellow-piece))
(define tab14 (board-set-play-piece tab13 6 yellow-piece))

(define tab15 (board-set-play-piece tab14 0 red-piece))
(define tab16 (board-set-play-piece tab15 1 red-piece))
(define tab17 (board-set-play-piece tab16 2 red-piece))
(define tab18 (board-set-play-piece tab17 3 red-piece))
(define tab19 (board-set-play-piece tab18 4 red-piece))
(define tab20 (board-set-play-piece tab19 5 red-piece))
(define tab21 (board-set-play-piece tab20 6 red-piece))

(define tab22 (board-set-play-piece tab21 0 yellow-piece))
(define tab23 (board-set-play-piece tab22 1 yellow-piece))
(define tab24 (board-set-play-piece tab23 2 yellow-piece))
(define tab25 (board-set-play-piece tab24 3 yellow-piece))
(define tab26 (board-set-play-piece tab25 4 yellow-piece))
(define tab27 (board-set-play-piece tab26 5 yellow-piece))
(define tab28 (board-set-play-piece tab27 6 yellow-piece))

(define tab29 (board-set-play-piece tab28 0 red-piece))
(define tab30 (board-set-play-piece tab29 1 red-piece))
(define tab31 (board-set-play-piece tab30 2 red-piece))
(define tab32 (board-set-play-piece tab31 3 red-piece))
(define tab33 (board-set-play-piece tab32 4 red-piece))
(define tab34 (board-set-play-piece tab33 5 red-piece))
(define tab35 (board-set-play-piece tab34 6 red-piece))

(define tab36 (board-set-play-piece tab35 0 yellow-piece))
(define tab37 (board-set-play-piece tab36 1 yellow-piece))
(define tab38 (board-set-play-piece tab37 2 yellow-piece))
(define tab39 (board-set-play-piece tab38 3 yellow-piece))
(define tab40 (board-set-play-piece tab39 4 yellow-piece))
(define tab41 (board-set-play-piece tab40 5 yellow-piece))
(define tab42 (board-set-play-piece tab41 6 yellow-piece))

(display tab42)
(newline)
(newline)

(display "prueba funcion verificar victoria vertical")
(newline)
(check-vertical-win tab42)
(newline)

(display "prueba funcion crear juego")
(newline)
(define new-game (game jugador jugador2 tab42 1))
(display new-game)
(newline)
(newline)

(display "prueba funcion actualizar stats")
(newline)
(define jugador-act (player-update-stats jugador 'win))
(display jugador-act)
(newline)
(newline)

(display "prueba funcion generar historial")
(newline)
(game-history new-game)
(newline)
(newline)

(display "prueba funcion que verifica si es empate o no")
(newline)
(game-is-draw new-game)
