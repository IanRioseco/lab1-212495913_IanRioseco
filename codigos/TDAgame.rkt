#lang racket
(provide (all-defined-out))
(require "TDAplayer.rkt")
(require "TDAboard.rkt")


;; RF11
; Descripción: Funcion que permite crear una nueva partida.
; Dom: player1(player) X player2(player) X board(board)X current-turn(int)
; Rec: game
; Tipo recursión: No aplica.
(define (game player1 player2 board current-turn)
  (list player1 player2 board current-turn '()))

; Selectores del juego
(define (get-game-player1 game)
  (car game))
(define (get-game-player2 game)
  (cadr game))
(define (get-game-current-turn game)
  (cadddr game))
(define (get-game-history game)
  (car(cddddr game)))


;; RF12
; Nombre: TDAgame-history
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.
(define (game-history game)
  (let ((history (car(cddddr game))))
    history))



;; RF13
; Nombre: TDAgame-is-draw
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.
(define (game-is-draw? game)
  (let* ((board (list-ref game 2))
         (vertical (board-check-vertical-win board))
         (horizontal (board-check-horizontal-win board))
         (diagonal (board-check-diagonal-win board))
         (player1 (get-game-player1 game))
         (player2 (get-game-player2 game))
         (fichas-p1 (get-player-remaining-pieces player1))
         (fichas-p2 (get-player-remaining-pieces player2))
         (tablero-lleno? (not (board-can-play? board))))  ; Cambia esto para reflejar correctamente si está lleno.
    
    (if (or (not (= vertical 0)) (not (= horizontal 0)) (not (= diagonal 0)))
        #f  ; Hay un ganador, no es un empate.
        (if (or tablero-lleno?                            ; El tablero está lleno.
                (and (= fichas-p1 0) (= fichas-p2 0)))  ; Ambos jugadores sin fichas.
            #t  ; Es un empate.
            #f))))  ; No es un empate.


;; RF14
; Nombre: TDAboard player-update-stats
; Descripción: 
; Dom: 
; Rec: 
; Tipo recursión: No aplica.
(define player-update-stats
  (lambda (player result)
    (cond
      ((equal? result 'win) (increment-player-wins player))
       ((equal? result 'loss) (increment-player-losses player))
       ((equal? result 'draw) (increment-player-draw player)))))
       
;; RF15
; Nombre: TDAgame-get-current-player
; Descripción: obtener el jugador cuyo turno esta en curso. 
; Dom: game(game).
; Rec: player.
; Tipo recursión: No aplica.
(define (game-get-current-player game)
  (if (= (cadddr game) 1)
      (car game)
      (cadr game)))



;; RF16
; Nombre: TDAgame-get-board
; Descripción: funcion que entrega el estado actual del tablero en el juego
; Dom: game
; Rec: board
; Tipo recursión: No aplica.
(define (game-get-board game)
  (list-ref game 2))


;; RF17
; Nombre: TDAgame-set-end
; Descripción: funcion que finaliza el juego actualizazndo las estadisticas
; Dom: game(game)
; Rec: game
; Tipo recursión: No aplica.
(define (game-set-end game)
  (let* ((existe-ganador? (board-who-is-winner (game-get-board game)))
         (historial (game-history game))
         (tablero (game-get-board game))
         (turno-actual (get-game-current-turn game))
         (empate? (game-is-draw? game))
         (p1 (get-game-player1 game))
         (p2 (get-game-player2 game))
         (bandera (cadr (cddddr game)))
         (actualizar-p1 (cond
                          ((equal? existe-ganador? 1) (player-update-stats p1 'win))
                          ((equal? existe-ganador? 2) (player-update-stats p1 'loss))
                          ((equal? empate? #t) (player-update-stats p1 'draw))
                          (else p1)))
         (actualizar-p2 (cond
                          ((equal? existe-ganador? 2) (player-update-stats p2 'win))
                          ((equal? existe-ganador? 1) (player-update-stats p2 'loss))
                          ((equal? empate? #t) (player-update-stats p2 'draw))
                          (else p2)))
        
         (game-actualizado (list actualizar-p1 actualizar-p2 tablero turno-actual historial))
         (game-sin-act (list p1 p2 tablero turno-actual historial)))
    (if (eq? bandera #t)
        game-sin-act
        game-actualizado)))

;; RF18
; Nombre: TDAgame-player-set-move
; Descripción: funcion que realiza un movimiento
; Dom: game(game) X player(player) X column(int)
; Rec: game
; Tipo recursión: No aplica.

(define (game-player-set-move game player column)
  (let* ((p1 (car game))
         (p2 (cadr game))
         (turno-actual (cadddr game))
         (historial (get-game-history game))
         (tablero (game-get-board game))
         (validar-turno (if (= turno-actual 1)
                            p1
                            p2))
         (piezas-restantes (if (= turno-actual 1)
                               (get-player-remaining-pieces p1)
                               (get-player-remaining-pieces p2))))
    (if (not (eq? (get-player-id player) (get-player-id validar-turno)))
        (error "no es el turno del judador")
        (if (= piezas-restantes 0)
            (error "el jugador no tiene fichas para jugar")
            (let* ((nuevo-tablero (board-set-play-piece tablero column (get-player-color player)))
                   (actualizar-turno (if (= turno-actual 1) 2 1))
                   (actualizar-historial (cons (cons column (get-player-color player)) historial))
                   (ganador? (board-who-is-winner nuevo-tablero))
                   (es-empate? (game-is-draw? game))          
                   ;; Solo disminuimos las piezas del jugador actual
                   (actualizar-p1 (cond
                                     ((equal? ganador? 1) (player-update-stats p1 'win))
                                     ((equal? ganador? 2) (player-update-stats p1 'loss))
                                     ((equal? es-empate? #t) (player-update-stats p1 'draw))
                                     (else p1)))
                   (actualizar-p2 (cond
                                    ((equal? ganador? 2) (player-update-stats p2 'win))
                                    ((equal? ganador? 1) (player-update-stats p2 'loss))
                                    ((equal? es-empate? #t) (player-update-stats p2 'draw))
                                    (else p2)))
                   ;; Solo disminuimos las piezas del jugador actual
                   (actualizar-p-1 (if (equal?(get-player-id player) (get-player-id p1))
                                      (decrease-player-pieces actualizar-p1)
                                      actualizar-p1))
                   (actualizar-p-2 (if (equal? (get-player-id player) (get-player-id p2))
                                      (decrease-player-pieces actualizar-p2)
                                      actualizar-p2))
                   (game-aux (list actualizar-p-1 actualizar-p-2 nuevo-tablero actualizar-turno actualizar-historial (if (> ganador? 0)
                                                                                                                       #t
                                                                                                                       (if (eq? es-empate? #t)
                                                                                                                           #t
                                                                                                                           #f)))))    
              game-aux)))))

       
         
              