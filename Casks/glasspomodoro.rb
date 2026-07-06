cask "glasspomodoro" do
  version "1.0.0"
  sha256 "b8dce73e7d5cb3600720a98a1191a7f576a8b602c45a001e625f7fd3f4b398e0"

  url "https://github.com/AndresGM7/GlassPomodoro/releases/download/v#{version}/GlassPomodoro.zip"
  name "GlassPomodoro"
  desc "Pomodoro glassmorphism para macOS — GroovinApps"
  homepage "https://github.com/AndresGM7/GlassPomodoro"

  depends_on macos: ">= :sonoma"

  app "GlassPomodoro.app"

  # La app está firmada ad-hoc (sin notarización Apple).
  # Esto le quita la quarantine flag para que abra sin fricción:
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GlassPomodoro.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.andresgm.glasspomodoro.plist",
  ]
end
