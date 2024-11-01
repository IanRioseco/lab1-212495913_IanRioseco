#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")

(display "----------------------------------PRUEBA 1------------------------------------------------")
(newline)
(newline)

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
(define g2 (game-player-set-move g1 p2 2))  ; Mauricio coloca en columna 2
(define g3 (game-player-set-move g2 p1 1))  ; Juan coloca en columna 1
(define g4 (game-player-set-move g3 p2 3))  ; Mauricio coloca en columna 3
(define g5 (game-player-set-move g4 p1 4))  ; Juan coloca en columna 4
(define g6 (game-player-set-move g5 p2 6))  ; Mauricio coloca en columna 6
(define g7 (game-player-set-move g6 p1 5))  ; Juan coloca en columna 5
(define g8 (game-player-set-move g7 p2 0))  ; Mauricio coloca en columna 0
(define g9 (game-player-set-move g8 p1 2))  ; Juan coloca en columna 2
(define g10 (game-player-set-move g9 p2 1)) ; Mauricio coloca en columna 1
(define g11 (game-player-set-move g10 p1 3)) ; Juan coloca en columna 3
(define g12 (game-player-set-move g11 p2 4)) ; Mauricio coloca en columna 4
(define g13 (game-player-set-move g12 p1 6)) ; Juan coloca en columna 6
(define g14 (game-player-set-move g13 p2 5)) ; Mauricio coloca en columna 5
(define g15 (game-player-set-move g14 p1 0)) ; Juan coloca en columna 0
(define g16 (game-player-set-move g15 p2 2)) ; Mauricio coloca en columna 2
(define g17 (game-player-set-move g16 p1 1)) ; Juan coloca en columna 1
(define g18 (game-player-set-move g17 p2 3)) ; Mauricio coloca en columna 3
(define g19 (game-player-set-move g18 p1 4)) ; Juan coloca en columna 4
(define g20 (game-player-set-move g19 p2 6)) ; Mauricio coloca en columna 6
(define g21 (game-player-set-move g20 p1 5)) ; Juan coloca en columna 5
(define g22 (game-player-set-move g21 p2 0)) ; Mauricio coloca en columna 0
(define g23 (game-player-set-move g22 p1 2)) ; Juan coloca en columna 2
(define g24 (game-player-set-move g23 p2 1)) ; Mauricio coloca en columna 1
(define g25 (game-player-set-move g24 p1 3)) ; Juan coloca en columna 3
(define g26 (game-player-set-move g25 p2 4)) ; Mauricio coloca en columna 4
(define g27 (game-player-set-move g26 p1 6)) ; Juan coloca en columna 6
(define g28 (game-player-set-move g27 p2 5)) ; Mauricio coloca en columna 5
(define g29 (game-player-set-move g28 p1 0)) ; Juan coloca en columna 0
(define g30 (game-player-set-move g29 p2 2)) ; Mauricio coloca en columna 2
(define g31 (game-player-set-move g30 p1 1)) ; Juan coloca en columna 1
(define g32 (game-player-set-move g31 p2 3)) ; Mauricio coloca en columna 3
(define g33 (game-player-set-move g32 p1 4)) ; Juan coloca en columna 4
(define g34 (game-player-set-move g33 p2 6)) ; Mauricio coloca en columna 6
(define g35 (game-player-set-move g34 p1 5)) ; Juan coloca en columna 5
(define g36 (game-player-set-move g35 p2 0)) ; Mauricio coloca en columna 0
(define g37 (game-player-set-move g36 p1 2)) ; Juan coloca en columna 2
(define g38 (game-player-set-move g37 p2 1)) ; Mauricio coloca en columna 1
(define g39 (game-player-set-move g38 p1 3)) ; Juan coloca en columna 3
(define g40 (game-player-set-move g39 p2 4)) ; Mauricio coloca en columna 4
(define g41 (game-player-set-move g40 p1 6)) ; Juan coloca en columna 6
(define g42 (game-player-set-move g41 p2 5)) ; Mauricio coloca en columna 5


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
(newline)

; 11. Mostrar estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board ended-game)
(newline)
(display ended-game)
(newline)
(newline)

(display "----------------------------------PRUEBA 2------------------------------------------------")
(newline)
(newline)

; 1. Creación de jugadores
(define player1 (player 1 "Luis" "red" 0 0 0 21))
(define player2 (player 2 "Ana" "yellow" 0 0 0 21))

; 2. Creación de piezas
(define redpiece (piece "red"))
(define yellowpiece (piece "yellow"))

; 3. Creación del tablero inicial
(define board-empty board)

; 4. Creación de un nuevo juego
(define game0 (game player1 player2 board-empty 1))

; 5. Realizando movimientos para victoria horizontal de "Luis"
(define game1 (game-player-set-move game0 player1 0))  
(define game2 (game-player-set-move game1 player2 1))  
(define game3 (game-player-set-move game2 player1 0))  
(define game4 (game-player-set-move game3 player2 1))  
(define game5 (game-player-set-move game4 player1 2))  
(define game6 (game-player-set-move game5 player2 3))  
(define game7 (game-player-set-move game6 player1 4))  
(define game8 (game-player-set-move game7 player2 0))  
(define game9 (game-player-set-move game8 player1 2))  
(define game10 (game-player-set-move game9 player2 3)) 
(define game11 (game-player-set-move game10 player1 4))
(define game12 (game-player-set-move game11 player2 3))
(define game13 (game-player-set-move game12 player1 4))
(define game14 (game-player-set-move game13 player2 2))
(define game15 (game-player-set-move game14 player1 6))
(define game16 (game-player-set-move game15 player2 1))

; 6. Verificaciones
(display "¿Se puede jugar en el tablero? ")
(board-can-play? (game-get-board game16))

(display "Jugador actual: ")
(game-get-current-player game16)

(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board game16))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board game16))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board game16))

(display "Verificación de ganador: ")
(board-who-is-winner (game-get-board game16))

(display "¿Es empate? ")
(game-is-draw? game16)

; 7. Finalizar el juego y actualizar estadísticas
(define end-game (game-set-end game16))


; 8. Mostrar historial de movimientos
(display "Historial de movimientos: ")
(newline)
(game-history end-game)
(newline)

; 9. Estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board end-game)
(newline)
(display end-game)
(newline)





(display "----------------------------------PRUEBA 3------------------------------------------------")
(newline)

; 1. Creación de jugadores
(define jugador1 (player 1 "Carlos" "red" 0 0 0 21))
(define jugador2 (player 2 "Lucía" "yellow" 0 0 0 21))

; 2. Creación de piezas
(define pieza-roja (piece "red"))
(define pieza-amarilla (piece "yellow"))

; 3. Creación del tablero inicial
(define tablero-vacio board)

; 4. Creación de un nuevo juego
(define juego0 (game jugador1 jugador2 tablero-vacio 1))

; 5. Realizando movimientos para victoria diagonal de "Lucía"
(define juego1 (game-player-set-move juego0 jugador1 0))     ; Carlos coloca en columna 0
(define juego2 (game-player-set-move juego1 jugador2 1))     ; Lucía coloca en columna 1
(define juego3 (game-player-set-move juego2 jugador1 1))     ; Carlos coloca en columna 1
(define juego4 (game-player-set-move juego3 jugador2 2))     ; Lucía coloca en columna 2
(define juego5 (game-player-set-move juego4 jugador1 2))     ; Carlos coloca en columna 2
(define juego6 (game-player-set-move juego5 jugador2 3))     ; Lucía coloca en columna 3
(define juego7 (game-player-set-move juego6 jugador1 2))     ; Carlos coloca en columna 2
(define juego8 (game-player-set-move juego7 jugador2 3))     ; Lucía coloca en columna 3
(define juego9 (game-player-set-move juego8 jugador1 3))     ; Carlos coloca en columna 3
(define juego10 (game-player-set-move juego9 jugador2 1))    ; Lucía coloca en columna 3
(define juego11 (game-player-set-move juego10 jugador1 0))   ; Carlos coloca en columna 0
(define juego12 (game-player-set-move juego11 jugador2 0))   ; Lucía coloca en columna 0
(define juego13 (game-player-set-move juego12 jugador1 4))   ; Carlos coloca en columna 4
(define juego14 (game-player-set-move juego13 jugador2 1))   ; Lucía coloca en columna 1
(define juego15 (game-player-set-move juego14 jugador1 4))   ; Carlos coloca en columna 4
(define juego16 (game-player-set-move juego15 jugador2 1))   ; Lucía coloca en columna 1
(define juego17 (game-player-set-move juego16 jugador1 4))   ; Carlos coloca en columna 4
(define juego18 (game-player-set-move juego17 jugador2 2))   ; Lucía coloca en columna 2
(define juego19 (game-player-set-move juego18 jugador1 6))   ; Carlos coloca en columna 4
(define juego20 (game-player-set-move juego19 jugador2 2))   ; Lucía coloca en columna 2
(define juego21 (game-player-set-move juego20 jugador1 1))   ; Carlos coloca en columna 1
(define juego22 (game-player-set-move juego21 jugador2 5))   ; Lucía coloca en columna 3 (Victoria diagonal)
(define juego23 (game-player-set-move juego22 jugador1 3))   ; Carlos coloca en columna 3 (Victoria diagonal)

; 6. Verificaciones
(display "¿Se puede jugar en el tablero? ")
(board-can-play? (game-get-board juego23))

(display "Jugador actual: ")
(game-get-current-player juego23)

(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board juego23))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board juego23))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board juego23))

(display "Verificación de ganador: ")
(board-who-is-winner (game-get-board juego23))

(display "¿Es empate? ")
(game-is-draw? g23)

; 7. Finalizar el juego y actualizar estadísticas
(define juego-terminado (game-set-end juego23))

; 8. Mostrar historial de movimientos
(display "Historial de movimientos: ")
(newline)
(game-history juego-terminado)
(newline)

; 9. Estado final del tablero
(display "Estado final del tablero: ")
(newline)
(game-get-board juego-terminado)
(newline)
(display juego-terminado)
(newline)
