#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")


; 1. Creación de jugadores (21 fichas cada uno para un juego largo)
(define p1 (player 1 "Juan" "red" 0 0 0 21))
(define p2 (player 2 "Mauricio" "yellow" 0 0 0 21))

; 2. Creación de piezas
(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))

; 3. Creación del tablero inicial
(define empty-board board)

; 4. Creación de un nuevo juego
(define g0 (game p1 p2 empty-board 1))

; 5. Realizando movimientos para crear un empate (columnas de 0 a 6)
(define g1 (game-player-set-move g0 p1 0))  ; Juan coloca en columna 0
(define g2 (game-player-set-move g1 p2 2))  ; Mauricio coloca en columna 1
(define g3 (game-player-set-move g2 p1 1))  ; Juan coloca en columna 0
(define g4 (game-player-set-move g3 p2 3))  ; Mauricio coloca en columna 1
(define g5 (game-player-set-move g4 p1 4))  ; Juan coloca en columna 2
(define g6 (game-player-set-move g5 p2 6))  ; Mauricio coloca en columna 3
(define g7 (game-player-set-move g6 p1 5))  ; Juan coloca en columna 2
(define g8 (game-player-set-move g7 p2 0))  ; Mauricio coloca en columna 3
(define g9 (game-player-set-move g8 p1 2))  ; Juan coloca en columna 4
(define g10 (game-player-set-move g9 p2 1)) ; Mauricio coloca en columna 5
(define g11 (game-player-set-move g10 p1 3)) ; Juan coloca en columna 4
(define g12 (game-player-set-move g11 p2 4)) ; Mauricio coloca en columna 5
(define g13 (game-player-set-move g12 p1 6)) ; Juan coloca en columna 6
(define g14 (game-player-set-move g13 p2 5)) ; Mauricio coloca en columna 0
(define g15 (game-player-set-move g14 p1 0)) ; Juan coloca en columna 6
(define g16 (game-player-set-move g15 p2 2)) ; Mauricio coloca en columna 0
(define g17 (game-player-set-move g16 p1 1)) ; Juan coloca en columna 3
(define g18 (game-player-set-move g17 p2 3)) ; Mauricio coloca en columna 1
(define g19 (game-player-set-move g18 p1 4)) ; Juan coloca en columna 3
(define g20 (game-player-set-move g19 p2 6)) ; Mauricio coloca en columna 1
(define g21 (game-player-set-move g20 p1 5)) ; Juan coloca en columna 2
(define g22 (game-player-set-move g21 p2 0)) ; Mauricio coloca en columna 4
(define g23 (game-player-set-move g22 p1 2)) ; Juan coloca en columna 5
(define g24 (game-player-set-move g23 p2 1)) ; Mauricio coloca en columna 6
(define g25 (game-player-set-move g24 p1 3)) ; Juan coloca en columna 0
(define g26 (game-player-set-move g25 p2 4)) ; Mauricio coloca en columna 1
(define g27 (game-player-set-move g26 p1 6)) ; Juan coloca en columna 2
(define g28 (game-player-set-move g27 p2 5)) ; Mauricio coloca en columna 3
(define g29 (game-player-set-move g28 p1 0)) ; Juan coloca en columna 4
(define g30 (game-player-set-move g29 p2 2)) ; Mauricio coloca en columna 5
(define g31 (game-player-set-move g30 p1 1)) ; Juan coloca en columna 6
(define g32 (game-player-set-move g31 p2 3)) ; Mauricio coloca en columna 0
(define g33 (game-player-set-move g32 p1 4)) ; Juan coloca en columna 1
(define g34 (game-player-set-move g33 p2 6)) ; Mauricio coloca en columna 2
(define g35 (game-player-set-move g34 p1 5)) ; Juan coloca en columna 3
(define g36 (game-player-set-move g35 p2 0)) ; Mauricio coloca en columna 4
(define g37 (game-player-set-move g36 p1 2)) ; Juan coloca en columna 5
(define g38 (game-player-set-move g37 p2 1)) ; Mauricio coloca en columna 6
(define g39 (game-player-set-move g38 p1 3)) ; Juan coloca en columna 0
(define g40 (game-player-set-move g39 p2 4)) ; Mauricio coloca en columna 1
(define g41 (game-player-set-move g40 p1 6)) ; Juan coloca en columna 2
(define g42 (game-player-set-move g41 p2 5)) ; Mauricio coloca en columna 3



; 6. Verificaciones durante el juego
(display "¿Se puede jugar en el tablero vacío? ")
(board-can-play? empty-board)

(display "¿Se puede jugar después de 21 movimientos? ")
(board-can-play? (game-get-board g42))

(display "Jugador actual después de 11 movimientos: ")
(game-get-current-player g11)

(display "Jugador actual después de 21 movimientos: ")
(game-get-current-player g42)

; 7. Verificación de victoria
(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board g42))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board g42))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board g42))

(display "Verificación de ganador: ")
(board-who-is-winner (game-get-board g42))

; 8. Verificación de empate
(display "¿Es empate? ")
(game-is-draw? g42)

; 9. Finalizar el juego y actualizar estadísticas
(define ended-game (game-set-end g42))

; 10. Mostrar historial de movimientos
(display "Historial de movimientos: ")
(newline)
(game-history ended-game)

; 11. Mostrar estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board ended-game)

(display ended-game)
