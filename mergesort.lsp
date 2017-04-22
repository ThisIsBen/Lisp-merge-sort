
(defun small (list)
  (or (eq (length list) 0) (eq (length list) 1))
)
  
;get right half
(defun right_half (list)
  (last list (ceiling (/ (length list) 2)))
)

;get left half
(defun left_half (list)
  (ldiff list (right_half list))
)


;include macro of while function   
(defmacro while (test &rest body)
  `(do ()
       ((not ,test))
     ,@body
	)
)



  
(defun merge_list (left right)
	(setq result nil);setup an empty list as result
	(setq temp nil);setup an empty list as temp storage.
	( 
		while( and (< 0 (length left)) (< 0 (length right)))
		;(when (> a 7) (return a)))
		(cond 
			( ;if
			 ( or( < (car left) (car right) )   ( = (car left) (car right) )  ); if first(left) ≤ first(right)
			  ;then
				(setq temp (list (car left)))
				(setq result (append result temp))
				;,then append first(left) to result.
				(setq left (cdr left)); set left = rest(left)
			   
			)
			
			
			(;else
			 t 
			 ;then
			    
				(setq temp (list (car right)));,then append first(right) to result.
				(setq result (append result temp))
				(setq right (cdr right)); set right = rest(right)
			    
			
			
			 )
		)
	)
	
	(cond 
      
		(;if
			(< 0 (length left));if length(left) > 0
		 ;then
			(setq result(append result left));,then append rest(left) to result
			
			
			
		)
		
		(;if
			(< 0 (length right));if length(right) > 0
		 ;then
			(setq result(append result right));,then append rest(right) to result
		
		)
	
	)
	
    ;result
)		 
	  



(defun mergesort (list)
  (if (small list) 
	   list ;then
	 
	  ;else
	  (merge_list
		(mergesort (left_half list))
		(mergesort (right_half list))
	   )
	)
)



; main function
(let ((n (read))
	  (numbers))
(setf numbers
	(do ((i 0 (+ i 1))
		(tmp nil))
      ((>= i n)
       (reverse tmp))
      (setf tmp (cons (read) tmp))))
(format t "~{~A ~}~%" (mergesort numbers)))