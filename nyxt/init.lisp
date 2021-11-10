(define-configuration (buffer web-buffer)
  ((default-modes (append '(vi-normal-mode) %slot-default))))

(define-configuration (web-buffer)
  ((default-modes
     (append '(blocker-mode reduce-tracking-mode) %slot-default))))
