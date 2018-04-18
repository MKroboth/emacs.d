(eval-after-load 'flycheck
  '(progn (require 'flycheck-clang-analyzer)
	  '(add-hook 'flycheck-mode-hook (progn
					   (flycheck-clang-analyzer-setup)
					   (flycheck-clang-tidy-setup)))))
