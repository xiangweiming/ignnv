# IGNNV (Information-Guided Neural Network Verifier) (in development)
This MATLAB tool (in development) provides reachability-analysis-based verification for neural networks. The verification process is under the guidance of available information, e.g., specifications, simulations, etc, in order to enhance scalability. 
# Related tools and software
The model-based reachability analysis for plants is based on The COntinuous Reachability Analyzer ([CORA] https://tumcps.github.io/CORA/)
# Installation:
  1) Install MATLAB.
  2) Clone or download IGNNV from (https://github.com/xiangweiming/ignnv).
  3) Run examples.
# Features
  1) This tool use specification-guided method to significantly enhance the scalability in safety verification. 

<figure>
    <img src="/images/pic_1.png" width="400"> <figcaption>Specification-guided partition for input space.</figcaption>
</figure>

<figure>
    <img src="/images/pic_2.png" width="400"> <figcaption>Specification-guided output set estimation.</figcaption>
</figure>

<figure>
    <img src="/images/pic_3.png" width="400"> <figcaption>Specification-guided verification for image recogination. It can verify that the neural networ is safe under any 3*3 attack at the left-above corner </figcaption>
</figure>
  
  2) This tool can do backward computation guided by specification for falsification.

<figure>
    <img src="/images/pic_12.png" width="400"> <figcaption>Specification-guided falsification. Red area is the unsafe input set.</figcaption>
</figure>
  
  3) This tool use simulation-guided method to significantly enhance the scalability in reachable set computation.

<figure>
    <img src="/images/pic_10.png" width="200"> <figcaption>Learning forward kinematics of a robotic arm
model with two joints.</figcaption>
</figure>
 

<figure>
    <img src="/images/pic_4.png" width="400"> <figcaption>Uniform partition method generates 16384 intervals.</figcaption>
</figure>

<figure>
    <img src="/images/pic_6.png" width="400"> <figcaption>Simulation-guided partition method generates only 397 intervals.</figcaption>
</figure>

<figure>
    <img src="/images/pic_7.png" width="400"> <figcaption>Simulation-guided partition of input space.</figcaption>
</figure>
  
  
  4) This tool can compute the reachable set of learning-enabled control systems. 

<figure>
    <img src="/images/pic_13.png" width="400"> <figcaption>Adaptive cruise control system.</figcaption>
</figure>

<figure>
    <img src="/images/pic_8.png" width="400"> <figcaption>Reachable set computation adaptive cruise control system.</figcaption>
</figure>

<figure>
    <img src="/images/pic_9.png" width="400"> <figcaption>Reachablilty-based safety verification for adaptive cruise control system.</figcaption>
</figure>

<figure>
    <img src="/images/pic_14.png" width="400"> <figcaption>Magnetic levitation (Maglev) model.</figcaption>
</figure>

<figure>
    <img src="/images/pic_11.png" width="400"> <figcaption>Reachablilty-based safety verification for Maglev model.</figcaption>
</figure>
  
# Publications

