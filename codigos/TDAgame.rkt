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
  (let ((board (list-ref game 2)))
    (cond
      ((equal? (board-check-vertical-win board) 0)
       (cond
         ((eq? (board-can-play? board) #f) #t)
         ((eq? (board-can-play? board) #t) #f)))   
      ((equal? (board-check-vertical-win board) 2) #f)
      ((equal? (board-check-vertical-win board) 1) #f)
      
      ((equal? (board-check-horizontal-win board) 0)
       (cond
         ((eq? (board-can-play? board) #f) #t)
         ((eq? (board-can-play? board) #t) #f)))   
      ((equal? (board-check-horizontal-win board) 2) #f)
      ((equal? (board-check-horizontal-win board) 1) #f)
      
      ((equal? (board-check-diagonal-win board) 0)
       (cond
         ((eq? (board-can-play? board) #f) #t)
         ((eq? (board-can-play? board) #t) #f)))   
      ((equal? (board-check-diagonal-win board) 2) #f)
      ((equal? (board-check-diagonal-win board) 1) #f))))
       

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
; Dom: 
; Rec: 
; Tipo recursión: No aplica.
(define (game-get-board game)
  (caddr game))

;; RF17
; Nombre:
; Descripción: 
; Dom: 
; Rec: 
; Tipo recursión: No aplica.

;; RF18
; Nombre: TDAgame-player-set-move
; Descripción: funcion que realiza un movimiento
; Dom: game(game) X player(player) X column(int)
; Rec: game
; Tipo recursión: No aplica.
#|
(define (game-player-set-move game player column)
  (let* ((p1 (car game))
        (p2 (cadr game))
        (turno-actual (cadddr game))
        (historial (get-game-history game))
        (tablero (caddr game))
        (validar-turno (if (= turno-actual 1)
                           p1
                           p2))
        (piezas-restantes (if (= turno-actual 1)
                              (get-player-remaining-pieces p1)
                              (get-player-remaining-pieces p2))))
    (if (not (equal? player validar-turno))
        (error "no es el turno del jugador")
        (if (= piezas-restantes 0)
            (error "el jugador no tiene fichas para jugar")
            (let* ((nuevo-tablero (board-set-play-piece tablero column (get-player-color player)))
                  (actualizar-turno (if (= turno-actual 1)
                                        2
                                        1))
                  (actualizar-historial (cons (cons column (get-player-color player)) historial))
                  (ganador? (board-who-is-winner nuevo-tablero))
                  (es-empate? (board-who-is-winner nuevo-tablero))
                  (actualizar-p1 (if (= ganador? 1)
                                     (player-update-stats p1 'win)
                                     (if (= es-empate? 0)
                                         (player-update-stats p1 'draw)
                                         (player-update-stats p1 'loss))))
                  (actualizar-p2 (if (= ganador? 2)
                                     (player-update-stats p2 'win)
                                     (if (= es-empate? 0)
                                         (player-update-stats p2 'draw)
                                         (player-update-stats p2 'loss))))
                  (player1 (if (equal? player validar-turno)
                               (decrease-player-pieces actualizar-p1)
                               actualizar-p1))
                  (display player1)
                  
                  (player2 (if (equal? player validar-turno)
                               (decrease-player-pieces actualizar-p2)
                               actualizar-p2)))
              (list player1 player2 nuevo-tablero actualizar-turno))))))
    
           |# 

(define (game-player-set-move game player column)
  (let* ((p1 (car game))
         (p2 (cadr game))
         (turno-actual (cadddr game))
         (historial (get-game-history game))
         (tablero (caddr game))
         (validar-turno (if (= turno-actual 1)
                            p1
                            p2))
         (piezas-restantes (if (= turno-actual 1)
                               (get-player-remaining-pieces p1)
                               (get-player-remaining-pieces p2))))
    (display validar-turno)
    (display player)
    (if (not (eq? player validar-turno))
        (error "no es el turno del judador")
        (if (= piezas-restantes 0)
            (error "el jugador no tiene fichas para jugar")
            (let* ((nuevo-tablero (board-set-play-piece tablero column (get-player-color player)))
                   (actualizar-turno (if (= turno-actual 1) 2 1))
                   (actualizar-historial (cons (cons column (get-player-color player)) historial))
                   (ganador? (board-who-is-winner nuevo-tablero))
                   (es-empate? (board-who-is-winner nuevo-tablero))
                   ;; Actualizamos los jugadores en función del resultado
                   (actualizar-p1 (if (= ganador? 1)
                                      (player-update-stats p1 'win)
                                      (if (= es-empate? 110)
                                          (player-update-stats p1 'draw)
                                          (if (= ganador? 2)
                                              (player-update-stats p1 'loss)
                                              p1))))
                   (actualizar-p2 (if (= ganador? 2)
                                      (player-update-stats p2 'win)
                                      (if (= es-empate? 110)
                                          (player-update-stats p2 'draw)
                                          (if (= ganador? 1)
                                              (player-update-stats p2 'loss)
                                              p2))))
                   ;; Solo disminuimos las piezas del jugador actual
                   (actualizar-p1 (if (equal? player p1)
                                      (decrease-player-pieces actualizar-p1)
                                      actualizar-p1))
                   (actualizar-p2 (if (equal? player p2)
                                      (decrease-player-pieces actualizar-p2)
                                      actualizar-p2)))
              ;; Devolvemos el nuevo estado del juego
              (list actualizar-p1 actualizar-p2 nuevo-tablero actualizar-turno actualizar-historial))))))

#|
(define (game-player-set-move game player column)
  (let* ((p1 (car game))                          ;; Primer jugador
         (p2 (cadr game))                         ;; Segundo jugador
         (tablero (caddr game))                   ;; Tablero actual
         (turno-actual (cadddr game))             ;; Turno actual (1 o 2)
         (historial (get-game-history game))      ;; Historial de jugadas
         (jugador-actual (if (= turno-actual 1) p1 p2))  ;; Jugador que tiene el turno actual
         (piezas-restantes (get-player-remaining-pieces jugador-actual))) ;; Fichas restantes del jugador actual
    ;; Validamos si el jugador que intenta jugar es el que tiene el turno
    (if (not (equal? player jugador-actual))
        (error "no es el turno del jugador")
        ;; Verificamos si el jugador tiene fichas disponibles para jugar
        (if (= piezas-restantes 0)
            (error "el jugador no tiene fichas para jugar")
            ;; Procesamos la jugada
            (let* ((nuevo-tablero (board-set-play-piece tablero column (get-player-color player)))
                   (actualizar-turno (if (= turno-actual 1) 2 1)) ;; Cambia el turno
                   (nuevo-historial (cons (cons column (get-player-color player)) historial))
                   ;; Verificamos si hay un ganador
                   (ganador? (board-who-is-winner nuevo-tablero))
                   (es-empate? (board-who-is-winner nuevo-tablero))
                   ;; Actualizamos estadísticas de los jugadores en función del resultado
                   (actualizar-p1 (if (and ganador? (= ganador? 1))
                                      (player-update-stats p1 'win)
                                      (if es-empate?
                                          (player-update-stats p1 'draw)
                                          (player-update-stats p1 'loss))))
                   (actualizar-p2 (if (and ganador? (= ganador? 2))
                                      (player-update-stats p2 'win)
                                      (if es-empate?
                                          (player-update-stats p2 'draw)
                                          (player-update-stats p2 'loss))))
                   ;; Disminuimos las piezas del jugador actual
                   (jugador-actualizado (decrease-player-pieces jugador-actual)))
              ;; Devolvemos el nuevo estado del juego
              (list (if (= turno-actual 1) jugador-actualizado actualizar-p1)
                    (if (= turno-actual 2) jugador-actualizado actualizar-p2)
                    nuevo-tablero
                    actualizar-turno))))))

|#
       
         
              