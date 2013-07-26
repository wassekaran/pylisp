(defun n-queens (n)
  (defun bitfree? (L x)
    (= 0 (logand (ash 1 x) L)))

  (defun bitset (L x)
    (logior (ash 1 x) L))

  (defun place (i sol cols diags cdiags)
    (if (= i n)
        (print sol)
        (dotimes (j n)
          (let ((diag (+ i j))
                (cdiag (+ i (- (- n 1) j))))
            (when (and (bitfree? cols j)
                       (bitfree? diags diag)
                       (bitfree? cdiags cdiag))
              (place (+ 1 i)
                     (+ (list j) sol)
                     (bitset cols j)
                     (bitset diags diag)
                     (bitset cdiags cdiag)))))))

  (place 0 (list) 0 0 0))

(n-queens 8)
