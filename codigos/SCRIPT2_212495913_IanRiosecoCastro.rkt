#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")


; 1. Creación de jugadores
(define p1 (player 1 "Thomas" "red" 0 0 0 21))
(define p2 (player 2 "Isi" "yellow" 0 0 0 21))

; 2. Creación de piezas
(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))

; 3. Creación del tablero inicial
(define empty-board board)

; 4. Creación de un nuevo juego
(define g0 (game p1 p2 empty-board 1))

; 5. Realizando movimientos para una victoria horizontal del jugador 2 después de 10 turnos cada uno
(define g1 (game-player-set-move g0 p1 0))   ; Juan coloca en columna 0
(define g2 (game-player-set-move g1 p2 6))   ; Mauricio coloca en columna 6
(define g3 (game-player-set-move g2 p1 1))   ; Juan coloca en columna 1
(define g4 (game-player-set-move g3 p2 1))   ; Mauricio coloca en columna 1
(define g5 (game-player-set-move g4 p1 3))   ; Juan coloca en columna 3
(define g6 (game-player-set-move g5 p2 6))   ; Mauricio coloca en columna 6
(define g7 (game-player-set-move g6 p1 6))   ; Juan coloca en columna 6
(define g8 (game-player-set-move g7 p2 5))   ; Mauricio coloca en columna 5
(define g9 (game-player-set-move g8 p1 3))   ; Juan coloca en columna 3
(define g10 (game-player-set-move g9 p2 3))  ; Mauricio coloca en columna 3
(define g11 (game-player-set-move g10 p1 1)) ; Juan coloca en columna 1
(define g12 (game-player-set-move g11 p2 2)) ; Mauricio coloca en columna 2
(define g13 (game-player-set-move g12 p1 2)) ; Juan coloca en columna 2
(define g14 (game-player-set-move g13 p2 2)) ; Mauricio coloca en columna 2
(define g15 (game-player-set-move g14 p1 4)) ; Juan coloca en columna 4
(define g16 (game-player-set-move g15 p2 4)) ; Mauricio coloca en columna 4
(define g17 (game-player-set-move g16 p1 5)) ; Juan coloca en columna 5
(define g18 (game-player-set-move g17 p2 0)) ; Mauricio coloca en columna 0
(define g19 (game-player-set-move g18 p1 0)) ; Juan coloca en columna 0
(define g20 (game-player-set-move g19 p2 0)) ; Mauricio coloca en columna 0 
(define g21 (game-player-set-move g20 p1 1)) ; Juan coloca en columna 1
(define g22 (game-player-set-move g21 p2 4)) ; Mauricio coloca en columna 4
(define g23 (game-player-set-move g22 p1 6)) ; Juan coloca en columna 6
(define g24 (game-player-set-move g23 p2 5)) ; Mauricio coloca en columna 4


; 6. Verificación de victoria
(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board g24))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board g24))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board g24))

(display "Verificación de empate: ")
(game-is-draw? g24)
(newline)

; 7. el jugador 2 quiere jugar cuando no es su turno
(display "cuando no es turno de algun jugador: ")
(newline)
(define g25 (game-player-set-move g24 p2 5))
(newline)
(newline)

; 8. Estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board g24)
(newline)

; 9. Historial despues de la victoria
(display "Historial de movimientos: ")
(newline)
(game-history g24)
(newline)


; 10. Finalizar el juego y actualizar estadísticas
(display "se termina el juego y se muestra:")
(newline)
(define ended-game (game-set-end g24))
(display ended-game)
(newline)
(newline)


; 11. Mostrar estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board ended-game)
