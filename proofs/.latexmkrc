$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape %O %S';
END { system('convert -density 600 -background white -flatten output.pdf pages.png'); }
