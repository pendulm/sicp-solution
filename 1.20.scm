;(define (gcd a b)
;  (if (= b 0)
;      a
;      (gcd b (remainder a b))))

(gcd 206 40)
->
(if (= 40 0) 206 (gcd 40 (remainder 206 40)));0 time
==
(gcd 40 (remainder 206 40))
->
(if (= (remainder 206 40) 0);1 time
    40
    (gcd (remainder 206 40)
	 (remainder 40 (remainder 206 40))))
==
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
->
(if (= (remainder 40 (remainder 206 40)) 0);2 times
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
	 (remainder (remainder 206 40)
		    (remainder 40 (remainder 206 40)))))
==
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
		(remainder 40 (remainder 206 40))))
->
(if (= (remainder (remainder 206 40)
		  (remainder 40 (remainder 206 40))) 0);4 times
    (remainder 40 (remainder 206 40));a
    (gcd (remainder (remainder 206 40)
		    (remainder 40 (remainder 206 40)));b
	 (remainder (remainder 40 (remainder 206 40));a
		    (remainder (remainder 206 40);b
			       (remainder 40 (remainder 206 40))))))
==
(gcd (remainder (remainder 206 40)
		(remainder 40 (remainder 206 40)));a
     (remainder (remainder 40 (remainder 206 40))
		(remainder (remainder 206 40)
			   (remainder 40 (remainder 206 40)))));b
->
(if (= (remainder (remainder 40 (remainder 206 40))
		  (remainder (remainder 206 40)
			     (remainder 40 (remainder 206 40)))) 0);7 times
    (remainder (remainder 206 40)
	       (remainder 40 (remainder 206 40)));a 4 times
    (...));b
;over all 18 times