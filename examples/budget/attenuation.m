%ATTENUATION Multibeam HTS attenuation map
close all
clear

%% Path
% Add mfs3 and required libraries to the path
addpath('../../src','../../lib/tropos/src')

%% Inputs
% Satellite coordinates
lonS = 20;    % [deg]
altS = 36000; % [km]
% Frequency
freq = 20.2;  % [GHz]
% Spreadsheet name
sheet = 'Ka band';

%% Grid
% Step size
step = 0.5;   % [deg]
% Region
latLimit = [25 65];  % [deg]
lonLimit = [-30 50]; % [deg]

tblGrid = mfs3.geogrid(lonS,altS,step,latLimit,lonLimit);

%% Attenuation
MapA = mfs3.map.AttenuationMap(lonS,altS,freq,tblGrid);
MapA.draw()