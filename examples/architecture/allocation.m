%ALLOCATION Optimal allocation of multibeam HTS user beam centers
close all
clear

%% Path
% Add mfs3 and required libraries to the path
addpath('../../src')

%% Inputs
% Satellite coordinates
lonS = 20;    % [deg]
altS = 36000; % [km]
% User beam radius
radius = 100; % [km]
% Grid axial tilt
tilt = 5; 	  % [deg]
% Coverage limits [deg]
latLimit = [32.2 59];
lonLimit = [-9 20];

%% Allocate beams
tblBeams = mfs3.allocate(lonS,altS,radius,latLimit,lonLimit,tilt);

%% Generate map
MapA = mfs3.map.MultibeamMap(radius,tilt,tblBeams);
MapA.draw()

%% Remove beams outside regions of interest
MapA.show()
MapA.hide([1,2,3,8:12,15:20])
MapA.hide([21,27:31,34:37])
MapA.hide([44:48,52:55,63:66,70:73,80:82,91,98:100])
MapA.hide([108,125,126, 141:144, 158:162, 175:180, 193:198, 212:216, 230:231, 248:250])
MapA.hide([343,360,361,377,378,379,380,381,394,395,396])

%% Save changes to beam allocation table
% Does not clear previous values from an existing table, remove/rename
% the spreadsheet manually or use a different filename
[fileB,pathB] = uiputfile('*.xlsx','Save beam allocation table as');

% Find beams that have not been hidden
hB = MapA.tblBeams.Handle;
iB = strcmp(get(hB(:,1),'Visible'),'on');

% Write to spreadsheet
writetable(tblBeams(iB,:),fullfile(pathB,fileB))