(defun lsp-sep-import (newname)
  "Duplicate a definition"
  (interactive "sNew definition name: ")
  (lsp--cur-workspace-check)
  (lsp--send-execute-command
   "hsimport:import"
   (vector `(:file ,(concat "file://" buffer-file-name)
             :moduleToImport ,newname))))
