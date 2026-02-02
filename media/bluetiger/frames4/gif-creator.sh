# tweak these:
FR=7        # frames per second
SCALE=10      # integer scaling factor (2, 3, 4 ...). Use 1 for no scaling.

# make animated gif (two-step palette method)
ffmpeg -y -framerate "$FR" -start_number 1 -i bt%d.png \
  -filter_complex "[0:v] scale=iw*${SCALE}:ih*${SCALE}:flags=neighbor,split [a][b]; \
                   [a] palettegen=stats_mode=diff [p]; \
                   [b][p] paletteuse" \
  -loop 0 out.gif
