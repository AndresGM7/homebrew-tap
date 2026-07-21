cask "glasspomodoro" do
  version "1.4.0"
  sha256 "2e63fe6f2f30debeff3d5512be99d5a929da5277cf01f5bddee88fd6c8b43133"

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
