(define (my-sum x)
  (if (zero? x)
      0
      (+ x (my-sum (- x 1)))))

(define (mysum n)
    (let loop ((m 0)
               (s 0))
      (cond
        [(> m n) s]
        [else (loop (add1 m) 
                    (+ s m))])))
