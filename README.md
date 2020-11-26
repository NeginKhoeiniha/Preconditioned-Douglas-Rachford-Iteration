# Preconditioned-Douglas-Rachford-Iteration
Implemented PDR method on TV-Inpainting problem in Matlab

The TV-inpainting problem considered here is based on the following paper:

Bredies K, Sun HP. Preconditioned Douglas–Rachford algorithms for TV-and TGV-regularized variational imaging problems. Journal of Mathematical Imaging and Vision. 2015 Jul 1;52(3):317-44.

# main.m

You need to run the main.m file. In the first section of the main file, two images are read. u_0 is the destroyed image and O is the loss region. The tested images are downloadable here, you just have to change the diretory.


In the second section, the parameters are defined. The number of the iterations can be changed. 

The algorithm section: namings and the order of this part are close to the algorithm in Readme.pdf 

The function section: two forms of image gradient are defined in the end of the main file. The mathematical base of this part is mentioned in Readme.pdf

# SRBGS.m
This function is the implementation of equation (6) in Readme.pdf. Use of the parameters Lambda, Mu and n can be changed in this function. They are defined in main.m.

# S.m P.m
These two functions are implementations of equations (4) and (5) in Readme.pdf respectively.(No change needed!)

# RedBleck.m
This function take the image as the input and devides it into two domains.(No change needed!)
