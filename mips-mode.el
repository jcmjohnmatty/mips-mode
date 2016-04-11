;; major mode for editing mips assembly
;; note that in order for this mode to be entered when you begin editing a
;; file, the file must have the extension .mips
;; I know that the standard file extensions for assembly files are .S or .asm,
;; however requiring files to have the extension .mips to enter this mode made
;; life easier, so there you go

;; allow the user to run their own code in mips-mode
(defvar mips-mode-hook nil)

;; assosiate files with the .mips suffix with mips-mode
;; this seems to be the best way to enable the syntax highlighting
(add-to-list 'auto-mode-alist '("\\.mips\\'" . mips-mode))

(defconst mips-font-lock-keywords
  (list
   '("^add\\|^addi\\|^addiu\\|^addu\\|^clo\\|^clz\\|^la\\|^li\\|^liu\\|^move\\|^negu\\|^seb\\|^seh\\|^sub\\|^subu\\|^rotr\\|^rotrv\\|^sll\\|^sllv\\|^sra\\|^srav\\|^srl\\|^srlv\\|^and\\|^andi\\|^ext\\|^ins\\|^nop\\|^nor\\|^not\\|^or\\|^ori\\|^wsbh\\|^xor\\|^xori\\|^movn\\|^movz\\|^slt\\|^slti\\|^sltiu\\|^sltu\\|^div\\|^divu\\|^madd\\|^maddu\\|^msub\\|^msubu\\|^mul\\|^mult\\|^multu\\|^mfhi\\|^mflo\\|^mthi\\|^mtlo\\|^b\\|^bal\\|^beq\\|^beqz\\|^bgez\\|^bgezal\\|^bgtz\\|^blez\\|^bltz\\|^bltzal\\|^bne\\|^bnez\\|^j\\|^jal\\|^jalr\\|^jr\\|^lb\\|^lbu\\|^lh\\|^lhu\\|^lw\\|^lwl\\|^lwr\\|^sb\\|^sh\\|^sw\\|^swl\\|^swr\\|^ulw\\|^usw\\|^ll\\|^sc\\|^abs\\.d\\|^abs\\.s\\|^add\\.d\\|^add\\.s\\|^c\\.eq\\.d\\|^c\\.eq\\.s\\|^c\\.le\\.d\\|^c\\.le\\.s\\|^c\\.lt\\.d\\|^c\\.lt\\.s\\|^cvt\\.d\\.s\\|^cvt\\.d\\.w\\|^cvt\\.s\\.d\\|^cvt\\.s\\.w\\|^cvt\\.w\\.d\\|^cvt\\.w\\.s\\|^div\\.d\\|^div\\.s\\|^l\\.d\\|^l\\.s\\|^mov.d\\|^mov.s\\|^mul.d\\|^mul.s\\|^neg.d\\|^neg.s\\|^s\\.d\\|^s\\.s\\|^sub\\.d\\|^sub\\.s" . font-lock-builtin-face)
   '("\\($\*\\)" . font-lock-variable-name-face)
   '("\".*\"" . font-lock-string-face)
   '("((0b|0B|0)[:digit:] | [:xdigit:])" . font-lock-constant-face)
   '("\\#\.\*" . font-lock-comment-face)
   '("\\.align\$\\|\\.ascii\$\\|\\.asciiz\$\\|\\.byte\$\\|\\.data\$\\|\\.double\$\\|\\.extern\$\\|\\.float\$\\|\\.global\$\\|\\.half\$\\|\\.kdata\$\\|\\.ktext\$\\|\\.space\$\\|\\.text\$\\|\\.word\$" . font-lock-preprocessor-face))
  "Syntax highlighting for mips assembly code")

;; syntax table
(defvar mips-mode-syntax-table nil)
  ;; (let ((mips-mode-syntax-table (make-syntax-table)))

  ;;   ; This is added so entity names with underscores can be more easily parsed
  ;;   (modify-syntax-entry ?_ "w" mips-mode-syntax-table)

  ;;   ; Comment styles are same as C++
  ;;   (modify-syntax-entry ?# ". 1b" mips-mode-syntax-table))
  ;;   "Syntax table for mips-mode")

(defun mips-mode ()
  "Major mode for editing mips assembly files"
  (interactive)
  (kill-all-local-variables)
;;   (set-syntax-table mips-mode-syntax-table)
  (set (make-local-variable 'font-lock-defaults) '(mips-font-lock-keywords))
  (setq major-mode 'mips-mode)
  (setq mode-name "MIPS")
  (run-hooks 'mips-mode-hook))

;; actually provide mips-mode
(provide 'mips-mode)
