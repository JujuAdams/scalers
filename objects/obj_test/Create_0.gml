spriteArray = [sTest0, sTest1, sTest2, sTest3, sTest4, sTest5];
spriteIndex = 0;
sprite_index = spriteArray[spriteIndex];

shaderArray = [-1, //Neareset neighbour
               -1, //Bilinear
               ShaderBicubic,
               ShaderScale2x,
               Shader2xSal,
               ShaderSuperEagle,
               ShaderHQ4x,
               Shader5xBRRound,
               Shader5xBRSemiRound,
               Shader5xBRSquare];

shaderIndex = 3;