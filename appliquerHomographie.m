% Calcul des coordonnees (xy2) des points (xy1)
% apres application d'une homographique H

function [xy2] = appliquerHomographie(H,xy1)

% Entrees :
%
% H   : matrice (3x3) de l'homographie
% xy1 :  matrice (nbPoints x 2) representant les coordonnees 
%       (colonne 1 : les x, colonne 2 : les y) 
%       des nbPoints points auxquels H est appliquee
%
% Sortie :
% xy2 : coordonnees des points apres application de l'homographie

% Nombre de points
nb_points = size(xy1,1);

% Construction des coordonnees homogenes pour appliquer l'homographie
coord_homogenes = [xy1, ones(nb_points,1)];

% Application de l'homographie
coord_homographie = H*coord_homogenes';
coord_homographie = coord_homographie';
% On retourne les coordonnees homogenes (x,y,1)
% Pour cela, il faut diviser par z
% Attention il ne faut garder que les deux premieres coordonnees
coord_homographie = coord_homographie./coord_homographie(:,3);
xy2 = coord_homographie(:,1:2);
