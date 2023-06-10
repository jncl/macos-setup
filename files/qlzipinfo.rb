cask "qlzipinfo" do
  version "1.1.11"
  sha256 "97ef0a6d60a2c87ec034cba1bff9ea1f368cbd8c9307247cb8f3428e0c4c5018"

  url "https://github.com/srirangav/qlZipInfo/releases/download/v.#{version}/qlZipInfo-#{version}.dmg"
  name "qlZipInfo"
  desc "QuickLook Generator for multiple archive types"
  homepage "https://github.com/srirangav/qlZipInfo"

  qlplugin "qlZipInfo.qlgenerator"
end
