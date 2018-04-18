(let ((hookf (lambda () (progn
			  (setq flycheck-clang-language-standard "c11")
			  (flycheck-mode)
			  (irony-mode)
			  (company-mode)
			  (rainbow-identifiers-mode)
			  (page-break-lines-mode)
			  ))))

  (add-hook 'c-mode-hook hookf))
