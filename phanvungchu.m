function [hang1,hang2] = phanvungchu(bienso);
bit_cuoi=50;
bit_giua=bit_cuoi/2;
hang1 = bienso(1:bit_giua,:);
hang2 = bienso((bit_giua+1):bit_cuoi,:);
return