/*
This is a saw-wave oscillator. The method .play() starts the oscillator. There
are several setters like .amp(), .freq(), .pan() and .add(). If you want to set all of them at
the same time use .set(float freq, float amp, float add, float pan)
*/

import processing.sound.*;

Sound stream;
TriOsc tri;

void setup() {
    size(350,350);
    background(255);
    
    // Create and start the sound renderer and the sine oscillator.
    // Second and Third arguments are optional, default is 44100 / 512 
    // for Sample Rate and Buffer Size
    stream = new Sound(this, 44100, 256);
    tri = new TriOsc(this);
    
    //Start the Sine Oscillator. There will be no sound in the beginning
    //unless the mouse enters the   
    tri.play();
}

void draw() {
    // Map mouseY from 0.0 to 1.0 for amplitude
    tri.amp(map(mouseY, 0, height, 1.0, 0.0));

    // Map mouseX from 20Hz to 1000Hz for frequency  
    tri.freq(map(mouseX, 0, width, 80.0, 1000.0));
  
    // Map mouseX from -1.0 to 1.0 for left to right 
    tri.pan(map(mouseX, 0, width, -1.0, 1.0));
}
