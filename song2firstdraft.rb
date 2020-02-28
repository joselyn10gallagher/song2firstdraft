use_bpm 92
scream1 = "C:/Users/joselyn_gallagher/Desktop/samples/scream1.wav"
scream2 = "C:/Users/joselyn_gallagher/Desktop/samples/scream2.wav"
pan = 1
s = 1
a = 1
i = 0
q = 0

notes = [:g5, :e5, :d5, :b, :a4, :a4, :g4]
notes_2 = [:gs2, :a2, :as2, :b2]

define :acdc_array do
  play notes[q], amp: 3
  q = q + 1
  sleep 0.25
  if q == 6
    q = 0
  end
end

define :acdc_array_2 do
  play :b, amp: 3
  sleep 0.25
  play notes_2[i], amp: 3
  i = i + 1
  sleep 0.5
  if i == 3
    i = 0
  end
end

define :acdc_base do |n, s, a|
  play n, amp: a
  sleep s
end

define :acdc_repeatcodes do
  acdc_base :e2, 1.5, 3
  acdc_base :d3, 0.25, 3
  acdc_base :d3, 0.25, 3
  acdc_base :d3, 1.5, 3
  
  acdc_base :cs3, 0.25, 3
  acdc_base :cs3, 0.25, 3
end

#sleep 24
live_loop :beat do
  4.times do
    sample "C:/Users/joselyn_gallagher/Desktop/samples/acdcbeat.wav", amp: s
    s = s + 2
    sleep 8
  end
  stop
end

#sleep 8
live_loop :black do
  2.times do
    sample "C:/Users/joselyn_gallagher/Desktop/samples/black_black.wav", amp: a
    a = a + 5
    sleep 16
  end
  stop
end

sleep 8
use_synth :fm
acdc_repeatcodes
acdc_base :cs3, 4, 3
acdc_repeatcodes
acdc_base :cs3, 1, 3

4.times do
  acdc_array_2
end

use_synth :prophet
acdc_repeatcodes
acdc_base :cs3, 2.25, 3
7.times do
  acdc_array
end
play :e4, amp: 3
acdc_repeatcodes
acdc_base :cs3, 1, 3
4.times do
  acdc_array_2
end

#Song 2
live_loop :acdc_guitar do
  2.times do
    sample "C:/Users/joselyn_gallagher/Desktop/samples/acdcguitar.wav", amp: 3
    sleep 16.25
  end
  stop
end
sleep 0.25
sample "C:/Users/joselyn_gallagher/Desktop/samples/acdc_vocals1.wav", amp: 3
sleep 30.65

sample "C:/Users/joselyn_gallagher/Desktop/samples/acdc_vocals3.wav", amp: 3
#add drum loop
sleep 1.6
sample "C:/Users/joselyn_gallagher/Desktop/samples/acdcguitar2.wav", amp: 3
sleep 30

#Outro
2.times do
  sample scream1, pan: pan
  sleep 0.5
  pan = pan - 1
end
sample scream2
sample :vinyl_rewind, amp: 5
sleep 3
sample "C:/Users/joselyn_gallagher/Desktop/samples/outro3.wav", amp: 3


