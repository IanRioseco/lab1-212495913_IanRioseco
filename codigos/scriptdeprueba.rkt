#lang racket
(require "TDAplayer.rkt")
(require "TDApiece.rkt")
(require "TDAboard.rkt")
(require "TDAgame.rkt")
(require "main.rkt")


#| EJEMPLO DE COMO ACTUALIZAR LOS DATOS DE UN JUGADOR |#
;; Definimos un jugador inicial
(display "PRUEBA FUNCION CREAR JUGADOR")
(newline)
(define jugador-actualizado3 (player 1 "Ian" "yellow" 0 0 0 21)); Jugador inicial con 21 piezas
(display jugador-actualizado3)
(newline)
(define jugador2 (player 2 "nai" "red" 0 0 0 21))
(display jugador2)
(newline)

;; Ejemplo de uso
(define lista (add-player-color (get-player-color jugador2) player-colors)) ;; Jugador 2 pone una pieza
(add-player-color (get-player-color jugador-actualizado3) lista)  ;; Jugador 1 pone otra pieza

(display player-colors)

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
(define g2 (game-player-set-move g1 jugador2 1))  ; Mauricio coloca en columna 1
(define g3 (game-player-set-move g2 jugador-actualizado3 1))  ; Juan coloca en columna 1
(define g4 (game-player-set-move g3 jugador2 2))  ; Mauricio coloca en columna 2
(define g5 (game-player-set-move g4 jugador-actualizado3 2))  ; Juan coloca en columna 2
(define g6 (game-player-set-move g5 jugador2 3))  ; Mauricio coloca en columna 3
(define g7 (game-player-set-move g6 jugador-actualizado3 2)) ; Juan coloca en columna 2
(define g8 (game-player-set-move g7 jugador2 3))  ; Mauricio coloca en columna 3
(define g9 (game-player-set-move g8 jugador-actualizado3 3))  ; Juan coloca en columna 3
(define g10 (game-player-set-move g9 jugador2 0)) ; Mauricio coloca en columna 0
(define g11 (game-player-set-move g10 jugador-actualizado3 3)) ; Juan coloca en columna 3
(display g11)
(newline)
(newline)
(define ended-game (game-set-end g11))
(display ended-game)
(newline)
(newline)

(display (game-get-board g11))
(newline)
(newline)


(define a (game-get-board g11))
(display a)
(newline)

(define test-board
  (list
    (list 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio)
    (list 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio)
    (list 'vacio 'vacio 'vacio 'yellow 'vacio 'vacio 'vacio)
    (list 'vacio 'vacio 'yellow 'vacio 'vacio 'vacio 'vacio)
    (list 'vacio 'yellow 'vacio 'vacio 'vacio 'vacio 'vacio)
    (list 'yellow 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio)))

(board-check-diagonal-win a)

(game-get-board g11)