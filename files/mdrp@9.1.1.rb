cask "mdrp@9.1.1" do
  version "9.1.1"
  sha256 "931306d13355baae03e5ff646dd6d7e2fbee40c7d79f093aa6340911900dd588"

  url "https://www.macdvdripperpro.com/MDRP_v#{version.no_dots}.zip"
  name "Mac DVDRipper Pro"
  desc "Utility to rip and copy DVD content"
  homepage "https://www.macdvdripperpro.com/"

  app "MDRP.app"
end
