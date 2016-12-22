load "style.gnuplot"

set xlabel "ヒット数"
set ylabel "　実行時間（秒）\n（低いほど速い）"

set label 1 \
          "データ：日本語版Wikipedia\n（大量で大きなテキスト）" \
          at first 0,2.875 left
set label 2 \
          "レコード数：約90万\n平均テキストサイズ：6.7KiB" \
          at first 0,2.375 left
set label 3 \
          "遅い" \
          textcolor "#ef2929" \
          at first 15306,1.3 left
set label 4 \
          "遅い" \
          textcolor "#ef2929" \
          at first 19889,2.8 right
set label 5 \
          "速い" \
          textcolor "#ef2929" \
          at first 14709,0.25 center
set label 6 \
          "速い" \
          textcolor "#ef2929" \
          at first 20189,0.25 center
set output "search-pgroonga-pg-bigm.pdf"
plot [0:20389] \
     "search-ja.tsv" using 3:($2/1000) \
       title columnheader \
       with linespoints \
       linestyle 5, \
     "search-ja.tsv" using 7:($6/1000):xtic(7) \
       title columnheader \
       with linespoints \
       linestyle 1
