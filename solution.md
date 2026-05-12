# 🎬 TMDB Movies — Data Processing Report

---

## 📌 Task 1: Chuyển Định Dạng Ngày & Sắp Xếp

**Mô tả:** Chuyển cột `release_date` từ định dạng `M/D/YY` sang `YYYY/MM/DD`, sau đó sắp xếp giảm dần theo ngày.

**Kết quả:** File `sortedDate.csv` đã được tạo.

| Thông tin | Giá trị |
|-----------|---------|
| File output | `sortedDate.csv` |
| Phim mới nhất | [Tên phim] — [YYYY/MM/DD] |
| Phim cũ nhất | [Tên phim] — [YYYY/MM/DD] |

---

## 📌 Task 2: Lọc Phim Có Rating > 7.5

**Mô tả:** Lọc ra các phim có `vote_average` lớn hơn 7.5.

**Kết quả:** File `rating7.5.csv` đã được tạo.

| Thông tin | Giá trị |
|-----------|---------|
| Tổng số phim lọc được | [số phim] phim |
| File output | `rating7.5.csv` |

**Ví dụ một số phim:**

| Tên phim | Rating |
|----------|--------|
| [Tên phim 1] | [x.x] |
| [Tên phim 2] | [x.x] |
| [Tên phim 3] | [x.x] |

---

## 📌 Task 3: Phim Có Doanh Thu Cao Nhất & Thấp Nhất

### 📈 Cao Nhất (Highest Revenue)

- **Phim:** [Tên phim]
- **Doanh thu:** [X,XXX,XXX,XXX] USD

### 📉 Thấp Nhất (Lowest Revenue)

- **Phim:** [Tên phim]
- **Doanh thu:** [X] USD

---

## 📌 Task 4: Tổng Doanh Thu

- **Tổng doanh thu:** [XXX,XXX,XXX,XXX] USD
- **Tổng số phim có dữ liệu:** [X,XXX] phim

---

## 📌 Task 5: Top 10 Phim Lợi Nhuận Cao Nhất

**Công thức:** Lợi nhuận = Revenue - Budget

| # | Tên phim | Lợi nhuận (USD) |
|---|----------|-----------------|
| 1 | [Tên phim] | [X,XXX,XXX,XXX] |
| 2 | [Tên phim] | [X,XXX,XXX,XXX] |
| 3 | [Tên phim] | [X,XXX,XXX,XXX] |
| 4 | [Tên phim] | [X,XXX,XXX,XXX] |
| 5 | [Tên phim] | [X,XXX,XXX,XXX] |
| 6 | [Tên phim] | [X,XXX,XXX,XXX] |
| 7 | [Tên phim] | [X,XXX,XXX,XXX] |
| 8 | [Tên phim] | [X,XXX,XXX,XXX] |
| 9 | [Tên phim] | [X,XXX,XXX,XXX] |
| 10 | [Tên phim] | [X,XXX,XXX,XXX] |

**File output:** `profit.csv`
