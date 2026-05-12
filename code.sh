#!/bin/bash

FILE="tmdb-movies.csv"
DELIM="~"
CLEAN="final.csv"

echo "=========== PREPARE DATA ==========="

csvformat -D "$DELIM" "$FILE" > "$CLEAN"
echo "Created: $CLEAN"
echo

# ==========================================
# TASK 1
# ==========================================

echo "=========== TASK 1 ==========="
# Chuyển date từ M/D/YY thành dạng YYYY/MM/DD rồi sort giảm dần

awk -F"$DELIM" -v OFS="$DELIM" '
  NR==1 { print; next }
  {
    split($16, d, "/")
    year = (d[3]+0 < 60 ? 2000 + d[3]+0 : 1900 + d[3]+0)
    $16 = sprintf("%04d/%02d/%02d", year, d[1]+0, d[2]+0)
    print
  }
' "$CLEAN" > sortedDate.csv

(head -1 sortedDate.csv; tail -n +2 sortedDate.csv | sort -t"$DELIM" -k16,16r) \
  > tmp_sort.csv && mv tmp_sort.csv sortedDate.csv

echo "Created: sortedDate.csv"
echo

# ==========================================
# TASK 2
# ==========================================

echo "=========== TASK 2 ==========="
# Lọc các phim có rating > 7.5

(head -1 "$CLEAN"; tail -n +2 "$CLEAN" | awk -F"$DELIM" '$18+0 > 7.5') \
  > rating7.5.csv

echo "Created: rating7.5.csv"
awk -F"$DELIM" 'END { print "Total movies with rating > 7.5: " NR-1 }' rating7.5.csv
echo

# ==========================================
# TASK 3
# ==========================================

echo "=========== TASK 3 ==========="
# Tìm phim có doanh thu cao nhất và thấp nhất (loại bỏ revenue = 0)

awk -F"$DELIM" '
  NR>1 && $5+0 > 0 {
    if ($5+0 > max) { max=$5+0; title_max=$6 }
    if (min=="" || $5+0 < min) { min=$5+0; title_min=$6 }
  }
  END {
    printf "Cao nhất : %s — $%'"'"'d\n", title_max, max
    printf "Thấp nhất: %s — $%'"'"'d\n", title_min, min
  }
' "$CLEAN"
echo

# ==========================================
# TASK 4
# ==========================================

echo "=========== TASK 4 ==========="
# Tổng doanh thu tất cả phim

awk -F"$DELIM" '
  NR>1 { total += $5 }
  END { printf "Tổng doanh thu: $%'"'"'.0f\n", total }
' "$CLEAN"
echo

# ==========================================
# TASK 5
# ==========================================

echo "=========== TASK 5 ==========="
# Top 10 phim có lợi nhuận cao nhất (revenue - budget), loại bỏ dữ liệu thiếu

awk -F"$DELIM" '
  NR>1 && $5+0 > 0 && $4+0 > 0 {
    profit = $5 - $4
    print profit "\t" $6
  }
' "$CLEAN" \
  | sort -rn \
  | head -10 \
  > profit.csv

echo "Created: profit.csv"
echo "Top 10 movies by profit:"
cat profit.csv
echo
