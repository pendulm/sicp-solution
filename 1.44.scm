(define dx 0.00001)

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))


(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
	  (f x)
	  (f (+ x dx)))
       3)))(define (compose f g)
  (lambda (x)
    (f (g x))))

;((repeated smooth n) f)