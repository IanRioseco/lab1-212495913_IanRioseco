#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")

(display "----------------------------------PRUEBA 1------------------------------------------------")
(newline)
; 1. Creación de jugadores
(define p1 (player 1 "Thomas" "red" 0 0 0 10))
(define p2 (player 2 "Isi" "yellow" 0 0 0 10))

; 2. Creación de piezas
(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))

; 3. Creación del tablero inicial y verificación de jugabilidad
(define empty-board board)
(display "¿Puede jugar en el tablero vacío? ")
(display (board-can-play? empty-board))
(newline)
(newline)

; 4. Creación de un nuevo juego
(define g0 (game p1 p2 empty-board 1))

; 5. Realizando movimientos para una victoria horizontal del jugador 2 después de 10 turnos cada uno
(define g1 (game-player-set-move g0 p1 6))   ; Thomas coloca en columna 6
(define g2 (game-player-set-move g1 p2 6))   ; Isi coloca en columna 6
(define g3 (game-player-set-move g2 p1 1))   ; Thomas coloca en columna 1
(define g4 (game-player-set-move g3 p2 1))   ; Isi coloca en columna 1
(define g5 (game-player-set-move g4 p1 3))   ; Thomas coloca en columna 3
(define g6 (game-player-set-move g5 p2 6))   ; Isi coloca en columna 6
(define g7 (game-player-set-move g6 p1 6))   ; Thomas coloca en columna 6
(define g8 (game-player-set-move g7 p2 5))   ; Isi coloca en columna 5
(define g9 (game-player-set-move g8 p1 3))   ; Thomas coloca en columna 3
(define g10 (game-player-set-move g9 p2 3))  ; Isi coloca en columna 3
(define g11 (game-player-set-move g10 p1 2)) ; Thomas coloca en columna 2
(define g12 (game-player-set-move g11 p2 2)) ; Isi coloca en columna 2
(define g13 (game-player-set-move g12 p1 2)) ; Thomas coloca en columna 2
(define g14 (game-player-set-move g13 p2 4)) ; Isi coloca en columna 4
(define g15 (game-player-set-move g14 p1 4)) ; Thomas coloca en columna 4
(define g16 (game-player-set-move g15 p2 5)) ; Isi coloca en columna 5
(define g17 (game-player-set-move g16 p1 1)) ; Thomas coloca en columna 1
(define g18 (game-player-set-move g17 p2 4)) ; Isi coloca en columna 4
(define g19 (game-player-set-move g18 p1 6)) ; Thomas coloca en columna 6
(define g20 (game-player-set-move g19 p2 5)) ; Isi coloca en columna 5


; 6. Verificación de victoria
(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board g20))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board g20))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board g20))

(display "Verificación de empate: ")
(game-is-draw? g20)
(newline)

; 7. el jugador 2 quiere jugar cuando no es su turno
(display "cuando no es turno de algun jugador: ")
(define g21 (game-player-set-move g12 p2 0))
(newline)
(newline)

; 8. cuendo un jugador quiere jugar sin tener fichas
(display "cuando no es turno de algun jugador: ")
(define g22 (game-player-set-move g20 p1 0))
(newline)
(newline)


; 9. Estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board g20)
(newline)

; 10. Historial despues de la victoria
(display "Historial de movimientos: ")
(newline)
(game-history g20)
(newline)


; 11. Finalizar el juego y actualizar estadísticas
(display "se termina el juego y se muestra:")
(newline)
(define ended-game (game-set-end g20))
(display ended-game)
(newline)
(newline)


; 12. Mostrar estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board ended-game)
(newline)

(display "----------------------------------PRUEBA 2------------------------------------------------")
(newline)

; 1. Creación de jugadores
(define player1 (player 1 "jose" "red" 0 0 0 21))
(define player2 (player 2 "benja" "yellow" 0 0 0 21))

; 2. Creación de piezas
(define piece-red (piece "red"))
(define piece-yellow (piece "yellow"))

; 3. Creación del tablero inicial y verificación de jugabilidad
(define board-empty board)
(display "¿Puede jugar en el tablero vacío? ")
(display (board-can-play? board-empty))
(newline)
(newline)

; 4. Creación de un nuevo juego
(define game0 (game player1 player2 board-empty 1))

; 5. Simulación de movimientos para una victoria vertical del jugador 1 en la columna 3
(define game1 (game-player-set-move game0 player1 3))
(define game2 (game-player-set-move game1 player2 2))
(define game3 (game-player-set-move game2 player1 3))
(define game4 (game-player-set-move game3 player2 2))
(define game5 (game-player-set-move game4 player1 3))
(define game6 (game-player-set-move game5 player2 2))
(define game7 (game-player-set-move game6 player1 3)) ; Victoria vertical del jugador 1

; 6. Verificación de victoria
(display "Verificación de victoria vertical: ")
(display (board-check-vertical-win (game-get-board game7)))
(newline)
(newline)

(display "Verificación de victoria horizontal: ")
(display (board-check-horizontal-win (game-get-board game7)))
(newline)
(newline)

(display "Verificación de victoria diagonal: ")
(display (board-check-diagonal-win (game-get-board game7)))
(newline)
(newline)

(display "¿Quién es el ganador? ")
(display (board-who-is-winner (game-get-board game7)))
(newline)
(newline)

; 7. Intento de agregar pieza cuando ya está ocupado
(display "Intento de agregar pieza en columna 3 nuevamente: ")
(display (board-set-play-piece (game-get-board game7) 3 red-piece))
(newline)
(newline)

; 8. Verificación de empate
(display "Verificación de empate: ")
(display (game-is-draw? game7))
(newline)
(newline)

; 9. Estado final del tablero
(display "Estado final del tablero: ")
(newline)
(display (game-get-board game7))
(newline)
(newline)

; 10. Historial de movimientos
(display "Historial de movimientos: ")
(newline)
(display (game-history game7))
(newline)
(newline)


; 11. Finalizar el juego y mostrar estado final del tablero
(display "Finalización del juego y estado del tablero: ")
(newline)
(define end-game (game-set-end game7))
(display end-game)
(newline)
(newline)
(display (game-get-board end-game))
(newline)
(newline)


(display "----------------------------------PRUEBA 3------------------------------------------------")
(newline)
(newline)

; 1. Creación de jugadores
(define jugador1 (player 1 "juan" "yellow" 0 0 0 10))
(define jugador2 (player 2 "vicente" "red" 0 0 0 10))

; 2. Creación de piezas
(define pieza-roja (piece "red"))
(define pieza-amarilla (piece "yellow"))

; 3. Creación del tablero inicial y verificación de jugabilidad
(define tablero-vacio board)
(display "¿Puede jugar en el tablero vacío? ")
(display (board-can-play? tablero-vacio))
(newline)
(newline)

; 4. Creación de un nuevo juego
(define juego0 (game jugador1 jugador2 tablero-vacio 1))

; 5. Simulación de movimientos que llenan el tablero sin victoria (empate)
(define juego1 (game-player-set-move juego0 jugador1 0))
(define juego2 (game-player-set-move juego1 jugador2 1))
(define juego3 (game-player-set-move juego2 jugador1 2))
(define juego4 (game-player-set-move juego3 jugador2 3))
(define juego5 (game-player-set-move juego4 jugador1 4))
(define juego6 (game-player-set-move juego5 jugador2 5))
(define juego7 (game-player-set-move juego6 jugador1 6))
; Continúa llenando el tablero alternando entre columnas y jugadores...

; 6. Verificación de victoria y empate
(display "Verificación de victoria vertical: ")
(display (board-check-vertical-win (game-get-board juego7)))
(newline)
(newline)

(display "Verificación de victoria horizontal: ")
(display (board-check-horizontal-win (game-get-board juego7)))
(newline)
(newline)

(display "Verificación de victoria diagonal: ")
(display (board-check-diagonal-win (game-get-board juego7)))
(newline)
(newline)

(display "¿Quién es el ganador? ")
(display (board-who-is-winner (game-get-board juego7)))
(newline)
(newline)

(display "Verificación de empate: ")
(display (game-is-draw? juego7))
(newline)
(newline)

; 7. Estado final del tablero
(display "Estado final del tablero: ")
(newline)
(display (game-get-board juego7))
(newline)
(newline)

; 8. Historial de movimientos
(display "Historial de movimientos: ")
(newline)
(display (game-history juego7))
(newline)
(newline)


; 9. Finalizar el juego y mostrar estado final del tablero
(display "Finalización del juego y estado del tablero: ")
(newline)
(define juego-terminado (game-set-end juego7))
(display juego-terminado)
(newline)
(newline)
(display (game-get-board juego-terminado))
