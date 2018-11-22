
library(tuneR)
sound_dist <- function(duration, samplingrate) {
  #Speed of sound is 1125 ft/sec
  return((duration/samplingrate)*1125/2)
}

snap <- readWave("/home/anand/Raaga/input.wav")
content <- readMidi(system.file("example_files", "song.mid", package="tuneR"))
getMidiNotes(content)


