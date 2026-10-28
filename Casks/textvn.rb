# SPDX-License-Identifier: GPL-3.0-or-later
# Casks/textvn.rb — Homebrew Cask cho TextVN trên tap hunglinhpt/homebrew-tap.
#
# Nguồn sự thật của version + sha256: GitHub Release của hunglinhpt/TextVN
# (SHA256SUMS.txt clearsign — file này được workflow sync-cask.yml tự cập nhật
# mỗi 6 giờ / chạy tay; hash lấy từ bản đã verify chữ ký GPG, không tự tính).
# File bản mẫu trong repo chính: packaging/homebrew/textvn.rb (B7b).
cask "textvn" do
  version "0.2.52"
  sha256 "0000b9cba11385edf47f3a2a5dd38b0cccf44763b9dee0e489cc43ad88641e64"

  url "https://github.com/hunglinhpt/TextVN/releases/download/v#{version}/TextVN-macos-universal-v#{version}.zip"
  name "TextVN"
  desc "Open-source Vietnamese input method editor (Telex, VNI, VIQR) powered by Rust"
  homepage "https://github.com/hunglinhpt/TextVN"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # macOS 13 Ventura trở lên (như yêu cầu cài đặt .pkg trong README).
  depends_on macos: ">= :ventura"

  # Đặc thù bộ gõ (IME): bundle IMK vào ~/Library/Input Methods (per-user,
  # không cần admin — đúng mô hình đăng ký của TextVN); app menu bar (cài đặt,
  # IPC server) vào /Applications. Zip release chứa cả hai .app ở thư mục gốc.
  input_method "TextVN-IM.app"
  app "TextVN.app"

  caveats <<~EOS
    Sau khi cài, làm 1 lần để bật bộ gõ:
      1. Mở TextVN.app (menu bar) — app tự đăng ký bộ gõ.
      2. System Settings → Keyboard → Input Sources → "+" → Vietnamese → TextVN.
    Gỡ bộ gõ khỏi danh sách nguồn nhập trước khi `brew uninstall --cask textvn`.
  EOS

  # `brew uninstall` giữ nguyên cấu hình (Rule S9); `brew uninstall --zap`
  # xoá sạch kể cả cấu hình — bundle ID: vn.textvn.im (bộ gõ), vn.textvn.app
  # (app menu bar).
  zap trash: [
    "~/Library/Input Methods/TextVN-IM.app",
    "~/Library/Preferences/vn.textvn.im.plist",
    "~/Library/Preferences/vn.textvn.app.plist",
    "~/Library/Saved Application State/vn.textvn.im.savedState",
    "~/Library/Saved Application State/vn.textvn.app.savedState",
    "~/Library/Logs/TextVN",
    "~/Library/Caches/vn.textvn.app",
    "~/Library/Application Support/TextVN",
  ]
end
