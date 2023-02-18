echo create html
if exist output (
  rd /s /q output
)
md output
make4ht -f html5+join_colors -s main.tex "mathjax" -d output/ -c config.cfg
echo create pdf
pdflatex -shell-escape main.tex
set filename=main
move %filename%.pdf output
for %%a in (%filename%.html.bak %filename%.4ct %filename%.sta %filename%.aux %filename%.4tc %filename%.dvi %filename%.out %filename%.idv %filename%.igv %filename%.lg %filename%.tmp %filename%.xref %filename%.log %filename%.html %filename%.css) do if exist "%%a" del "%%a"
del config.log
rmdir /s /q "_minted-%filename%"