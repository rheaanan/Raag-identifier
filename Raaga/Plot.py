import wave
import numpy as np

wr = wave.open('input.wav', 'r')
sz = 44100 # Read and process 1 second at a time.
da = np.fromstring(wr.readframes(sz), dtype=np.int16)
wr.close()
left, right = da[0::2], da[1::2]
print("left",left)
lf, rf = np.fft.rfft(left), np.fft.rfft(right)
import matplotlib.pyplot as plt

plt.figure(1)
a = plt.subplot(211)
r = 2**16/2
a.set_ylim([-r, r])
a.set_xlabel('time [s]')
a.set_ylabel('sample value [-]')
x = np.arange(44100)/44100
print("x",x)
plt.plot(right, left)
b = plt.subplot(212)
b.set_xscale('log')
b.set_xlabel('frequency [Hz]')
b.set_ylabel('|amplitude|')
plt.plot(abs(lf))
plt.savefig('sample-graph.png')