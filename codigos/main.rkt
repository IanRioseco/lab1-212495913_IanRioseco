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
(define yellow-piece (piece 'yellow))
(define red-piece (piece 'red))
(display red-piece)
(newline)
(newline)


(display "prueba funcion poner ficha en tablero")
(newline)
(define tab (board-set-play-piece tablero 1 red-piece))
(define tab2 (board-set-play-piece tab 1 red-piece))
(define tab3 (board-set-play-piece tab2 3 red-piece))
(define tab4 (board-set-play-piece tab3 5 red-piece))
(define tab5 (board-set-play-piece tab4 1 red-piece))
(define tab6 (board-set-play-piece tab5 2 red-piece))
(define tab7 (board-set-play-piece tab6 3 red-piece))

(display tab7)
(newline)
(newline)

(display "prueba funcion verificar victoria vertical")
(newline)
(board-check-vertical-win tab7)
(newline)

(display "prueba funcion crear juego")
(newline)
(define new-game (game jugador jugador2 tab7 2))
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
(game-is-draw? new-game)
(newline)
(newline)

(display "prueba funcion que verifica el jugador actual")
(newline)
(game-get-current-player new-game)
(newline)
(newline)

(display "prueba funcion verificar victoria horizontal")
(newline)
(board-check-horizontal-win tab7)
(newline)
(newline)

#|
(display "prueba funcion verificar estado actual del tablero para ver si hay ganador")
(newline)
(board-who-is-winner tab7)
(newline)
|#