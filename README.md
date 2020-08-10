# Seven-Segment LED Messages

This project will display a sequence of "characters" in memory across an FPGA's seven-segment display LED bank. In this case, the FPGA used is the DE-10 LITE.

The speed at which the message is "played back" is just determined by the slow clock frequency constant in the top-level file. Each character is shifted over to the next LED every clock cycle, so a slow clock frequency of 1 MHz, for example will cause the message to move once a second.

I had originally made this for Father's Day, so the message stored in memory for this program is relevant to that.
