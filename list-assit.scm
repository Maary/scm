(define (make-list length object)
  (if (= length 0)
      (list)
      (cons object (make-list (- length 1) object))))
 
(define (list-fill! list object)
  (if (not (null? list))
      (begin (set-car! list object) (list-fill! (cdr list) object))))
 
(define (list-set! list element object)
  (if (= element 1)
      (set-car! list object)
      (list-set! (cdr list) (- element 1) object)))
 
(define (list-get list element)
  (if (= element 1)
      (car list)
      (list-get (cdr list) (- element 1))))

(define (make-image columns rows)
  (if (= rows 0)
      (list)
      (cons (make-list columns (list)) (make-image columns (- rows 1)))))
 
(define (image-fill! image colour)
  (if (not (null? image))
      (begin (list-fill! (car image) colour) (image-fill! (cdr image) colour))))
 
(define (image-set! image column row colour)
  (list-set! (list-get image row) column colour))
 
(define (image-get image column row)
  (list-get (list-get image row) column))


(define (write-ppm image file)
  (define (write-image image)
    (define (write-row row)
      (define (write-colour colour)
        (if (not (null? colour))
            (begin (write-char (integer->char (car colour)))
                   (write-colour (cdr colour)))))
      (if (not (null? row))
          (begin (write-colour (car row)) (write-row (cdr row)))))
    (if (not (null? image))
        (begin (write-row (car image)) (write-image (cdr image)))))
  (with-output-to-file file
    (lambda ()
      (begin (display "P6")
             (newline)
             (display (length (car image)))
             (display " ")
             (display (length image))
             (newline)
             (display 255)
             (newline)
             (write-image image)))))

(define *black* (list   0   0   0))
(define *white* (list 255 255 255))
(define *red*   (list 255   0   0))
(define *green* (list   0 255   0))
(define *blue*  (list   0   0 255))

(define-syntax (while stx)
  (syntax-case stx ()
      ((_ condition expression ...)
       #`(do ()
           ((not condition))
           expression
           ...))))