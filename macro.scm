(define-syntax when
  (syntax-rules ()
    ((_ pred b1 ...)
     (if pred (begin b1 ...)))))



;;test
(let ((i 0))
  (when (= i 0)
    (display "i==0")
    (newline)))


(define-syntax while
  (syntax-rules ()
    ((_ pred b1 ...)
       (let loop() (when pred b1 ... (loop))))))

(define-syntax for
  (syntax-rules ()
    ((_ (i from to) b1 ...)
     (let loop ((i from))
       (when (< i to)
         b1 ...
         (loop (1+ i)))))))

;;test
(let ((i 0))
  (while (< i 10)
         (display i)
         (display #\Space)
         (set! i (+ i 1))))

(for (i 0 10)
     (display i)
     (display #\Space))
