#lang racket

(define (game-player-set-move game player column)
  (let* ((player1 (car game))                             ; Jugador 1
         (player2 (cadr game))                            ; Jugador 2
         (board (caddr game))                             ; Tablero actual
         (current-turn (cadddr game))                     ; Turno actual
         (history (cddddr game))                          ; Historial de movimientos
         ;; Verificar que sea el turno correcto
         (valid-turn (if (= current-turn 1) player1 player2))
         ;; Verificar si es el turno del jugador correcto
         (is-player-turn (equal? player valid-turn))
         (remaining-pieces (player-remaining-pieces player)))  ; Fichas restantes del jugador
    ;; Si no es el turno del jugador, error
    (if (not is-player-turn)
        (error "No es el turno de este jugador.")
        ;; Proceder si es el turno correcto y el jugador tiene fichas
        (if (= remaining-pieces 0)
            (error "El jugador no tiene fichas restantes.")
            ;; Actualizar el tablero colocando la pieza en la columna
            (let* ((new-board (place-piece board column (player-color player)))
                   (new-turn (if (= current-turn 1) 2 1))  ; Cambiar turno
                   ;; Actualizar el historial con el nuevo movimiento
                   (new-history (cons (cons column (player-color player)) history))
                   ;; Verificar si el jugador ha ganado
                   (winner (or (check-horizontal-win new-board)
                               (check-vertical-win new-board)
                               (check-diagonal-win new-board)))
                   ;; Verificar si es empate
                   (is-draw (check-draw new-board))
                   ;; Actualizar las estadísticas si el juego ha terminado
                   (updated-players (if (or winner is-draw)
                                        (update-stats player1 player2 winner is-draw)
                                        (list player1 player2))))
              ;; Si el juego ha terminado, actualizar las estadísticas y retornar el nuevo juego
              (list (car updated-players) (cadr updated-players) new-board new-turn new-history))))))