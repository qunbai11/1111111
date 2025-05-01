@0
D=!M         // Load the value from RAM[0] and invert it

@5
M=D          // Save D for later use

@1
D=D&M        // Perform AND with RAM[1] and store the result in D

@6
M=D          // Record the current result in RAM[6]

@2
M=D          // Store the result into RAM[2]

@1
D=!M         // Load the value from RAM[1] and invert it

@7
M=D          // Save the inverted value

@0
D=D&M        // Perform AND with RAM[0] again

@2
M=D|M        // Combine with the previous result using OR and store into RAM[2]

@8
M=0          // Clear RAM[8] to keep memory clean