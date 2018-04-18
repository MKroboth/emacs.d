(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (flycheck-mode)
	    (rainbow-delimiters-mode)
	    
	    (show-paren-mode)))
