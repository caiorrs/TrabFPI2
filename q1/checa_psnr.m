coins = imread('coins original.png');
coins_20 = imread('coins resultado qualidade-20.jpg');
coins_50 = imread('coins resultado qualidade-50.jpg');
coins_90 = imread('coins resultado qualidade-90.jpg');

cameraman = imread('cameraman original.png');
cameraman_20 = imread('cameraman resultado qualidade-20.jpg');
cameraman_50 = imread('cameraman resultado qualidade-50.jpg');
cameraman_90 = imread('cameraman resultado qualidade-90.jpg');

psnr_coins_20 = psnr(coins, coins_20);
psnr_coins_50 = psnr(coins, coins_50);
psnr_coins_90 = psnr(coins, coins_90);

psnr_cameraman_20 = psnr(cameraman, cameraman_20);
psnr_cameraman_50 = psnr(cameraman, cameraman_50);
psnr_cameraman_90 = psnr(cameraman, cameraman_90);

fprintf(['\n Coins:\n',...
'PSNR @ 20%% : %.5g\n',...
'PSNR @ 50%% : %.5g\n',...
'PSNR @ 90%% : %.5g\n',...
'\n Cameraman:\n',...
'PSNR @ 20%% : %.5g\n',...
'PSNR @ 50%% : %.5g\n',...
'PSNR @ 90%% : %.5g\n'], psnr_coins_20, psnr_coins_50, psnr_coins_90,...
psnr_cameraman_20, psnr_cameraman_50, psnr_cameraman_90);