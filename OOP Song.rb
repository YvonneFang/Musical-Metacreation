# Alina and Yvonne
# CSCI 3725
# PQ5
# Nov 9, 2019
# This file represents a way to produce song that follow the OOP style

use_bpm = 200
define :melody do |root, quality|
  use_synth :blade
  play_pattern_timed scale(root, quality), 0.5, release: 0.1
end

define :chords do |root, quality|
  4.times do
    play chord(root, quality)
    sleep 1
  end
end

define :bass do |root|
  2.times do
    use_synth :tech_saws
    play root, amp :2
    sleep 0.5
  end
  sleep 3.5
end

define :beatz do
  sample :ambi_lunar_land
end

live_loop :song do
  # change root and quality to change the chord of the song
  root = :C6
  quality = :minor
  in_thread do
    melody(root, quality)
  end
  in_thread do
    bass(root - 24)
  end
  in_thread do
    beatz
  end
  chords(root, quality)
end
