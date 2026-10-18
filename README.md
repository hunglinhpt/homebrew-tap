# homebrew-tap của TextVN

Tap Homebrew chính thức của [TextVN](https://github.com/hunglinhpt/TextVN) —
bộ gõ tiếng Việt mã nguồn mở (Telex, VNI, VIQR) cho macOS 13+ (Apple Silicon
và Intel), engine Rust, dùng chung cấu hình với bản Windows/Linux.

## Cài đặt

```bash
brew install --cask hunglinhpt/tap/textvn
```

Homebrew sẽ:

1. Tải `TextVN-macos-universal-v<ver>.zip` từ GitHub Release (có chữ ký GPG +
   Sigstore; cask pin sha256 lấy từ `SHA256SUMS.txt` đã verify).
2. Đặt `TextVN-IM.app` (bộ gõ) vào `~/Library/Input Methods` và `TextVN.app`
   (app menu bar — cài đặt) vào `/Applications`.

Sau khi cài, làm **1 lần** để bật bộ gõ:

1. Mở `TextVN.app` (menu bar) — app tự đăng ký bộ gõ.
2. System Settings → Keyboard → Input Sources → **+** → Vietnamese → **TextVN**.

Gỡ: `brew uninstall --cask textvn` (giữ cấu hình) hoặc thêm `--zap`
(xoá sạch kể cả `~/Library/Application Support/TextVN`).

## Cập nhật

Cask được workflow `sync-cask.yml` trong repo này **tự cập nhật mỗi 6 giờ**
(kéo release mới nhất của TextVN, verify chữ ký GPG của `SHA256SUMS.txt` rồi
ghi `version` + `sha256`). Cũng chạy tay: Actions → **Sync cask** → Run
workflow (chọn tag cụ thể nếu cần). Kiểm tra bản đang có:

```bash
brew info --cask hunglinhpt/tap/textvn
```
