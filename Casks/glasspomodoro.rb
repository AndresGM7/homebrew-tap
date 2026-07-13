cask "glasspomodoro" do
  version "1.1.0"
  sha256 "2d4b38795fb0976c45cdf34ea82690153d9b96c94ec7ec7828040fb5f9c6b54c"

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
