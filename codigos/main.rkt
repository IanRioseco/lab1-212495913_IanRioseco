#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")

#| EJEMPLO DE COMO ACTUALIZAR LOS DATOS DE UN JUGADOR |#
;; Definimos un jugador inicial
(display "PRUEBA FUNCION CREAR JUGADOR")
(newline)
(define jugador-actualizado3 (player 1 "Ian" "red" 2 1 0 21)); Jugador inicial con 21 piezas
(display jugador-actualizado3)
(newline)
(define jugador2 (player 2 "nai" "yellow" 2 1 0 21))
(display jugador2)
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



; 4. Creación de un nuevo juego
(define g0 (game jugador-actualizado3 jugador2 tablero 1))
(display g0)
(newline)
(game-get-board g0)
(newline)

(define g1 (game-player-set-move g0 jugador-actualizado3 0))
(display g1)
(newline)
(define g2 (game-player-set-move g1 jugador2 1))  ; Mauricio coloca en columna 1
(display g2)
(newline)
(define g3 (game-player-set-move g2 jugador-actualizado3 1))  ; Juan coloca en columna 1
(display g3)
#|
(define g3 (game-player-set-move g2 jugador-actualizado3 1))  ; Juan coloca en columna 1
(define g4 (game-player-set-move g3 jugador2 2))  ; Mauricio coloca en columna 2
(define g5 (game-player-set-move g4 jugador-actualizado3 2))  ; Juan coloca en columna 2
(define g6 (game-player-set-move g5 jugador2 3))  ; Mauricio coloca en columna 3
(define g7 (game-player-set-move g6 jugador-actualizado3 2))  ; Juan coloca en columna 2
(define g8 (game-player-set-move g7 jugador2 3))  ; Mauricio coloca en columna 3
(define g9 (game-player-set-move g8 jugador-actualizado3 3))  ; Juan coloca en columna 3
(define g10 (game-player-set-move g9 jugador2 0)) ; Mauricio coloca en columna 0
(define g11 (game-player-set-move g10 jugador-actualizado3 3)) ; Juan coloca en columna 3
(display g11)
|#
#|
(define g3 (game-player-set-move g2 jugador2 1))  ; Juan coloca en columna 1
(define g4 (game-player-set-move g3 jugador-actualizado3 2))  ; Mauricio coloca en columna 2
(define g5 (game-player-set-move g4 jugador2 2))  ; Juan coloca en columna 2
(define g6 (game-player-set-move g5 jugador-actualizado3 3))  ; Mauricio coloca en columna 3
(define g7 (game-player-set-move g6 jugador2 2))  ; Juan coloca en columna 2
(define g8 (game-player-set-move g7 jugador-actualizado3 3))  ; Mauricio coloca en columna 3
(define g9 (game-player-set-move g8 jugador2 3))  ; Juan coloca en columna 3
(define g10 (game-player-set-move g9 jugador-actualizado3 0)) ; Mauricio coloca en columna 0
(define g11 (game-player-set-move g10 jugador2 3)) ; Juan coloca en columna 3

|#

#|(define tab (board-set-play-piece tablero 0 red-piece))
(define tab2 (board-set-play-piece tab 1 yellow-piece))
(define tab3 (board-set-play-piece tab2 1 red-piece))
(define tab4 (board-set-play-piece tab3 2 yellow-piece))
(define tab5 (board-set-play-piece tab4 2 red-piece))
(define tab6 (board-set-play-piece tab5 3 yellow-piece))
(define tab7 (board-set-play-piece tab6 2 red-piece))
(define tab8 (board-set-play-piece tab7 3 yellow-piece))
(define tab9 (board-set-play-piece tab8 3 red-piece))
(define tab10 (board-set-play-piece tab9 0 yellow-piece))
(define tab11 (board-set-play-piece tab10 3 red-piece))
|#
#|
; 5. Realizando movimientos para crear una victoria diagonal
(define g1 (game-player-set-move g0 jugador-actualizado3 0))  ; Juan coloca en columna 0
(define g2 (game-player-set-move g1 jugador2 1))  ; Mauricio coloca en columna 1
(define g3 (game-player-set-move g2 jugador-actualizado3 1))  ; Juan coloca en columna 1
(define g4 (game-player-set-move g3 jugador2 2))  ; Mauricio coloca en columna 2
(define g5 (game-player-set-move g4 jugador-actualizado3 2))  ; Juan coloca en columna 2
(define g6 (game-player-set-move g5 jugador2 3))  ; Mauricio coloca en columna 3
(define g7 (game-player-set-move g6 jugador-actualizado3 2))  ; Juan coloca en columna 2
(define g8 (game-player-set-move g7 jugador2 3))  ; Mauricio coloca en columna 3
(define g9 (game-player-set-move g8 jugador-actualizado3 3))  ; Juan coloca en columna 3
(define g10 (game-player-set-move g9 jugador2 0)) ; Mauricio coloca en columna 0
(define g11 (game-player-set-move g10 jugador-actualizado3 3)) ; Juan coloca en columna 3 
(newline)
(newline)

(display "prueba funcion verificar victoria vertical")
(newline)
(board-check-vertical-win g11)
(newline)

(display "prueba funcion crear juego")
(newline)
(define new-game (game jugador jugador2 g11 2))
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
(board-check-horizontal-win tab11)
(newline)
(newline)

(display "prueba funcion verificar victoria diagonal")
(newline)
(board-check-diagonal-win tab11)
(newline)
(newline)


(display "prueba funcion verificar estado actual del tablero para ver si hay ganador")
(newline)
(board-who-is-winner g11)
|#
(newline)