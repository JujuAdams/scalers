spriteArray = [sTest0, sTest1, sTest2, sTest3, sTest4];
spriteIndex = 0;

shaderArray = [-1, //Neareset neighbour
               -1, //Bilinear
               ShaderBicubic,
               Shader2xSal,
               ShaderSuperEagle,
               ShaderHQ4x,
               Shader5xBRRound,
               Shader5xBRSemiRound,
               Shader5xBRSquare];

shaderIndex = 0;