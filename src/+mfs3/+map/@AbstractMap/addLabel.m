function [ hobj ] = addLabel(this,lat0,lon0,label,color)
%ADDLABEL Add a text label at coordinates (lat0,lon0)
% Input parameters:
%   lat0,lon0   : Label center position [deg]
%   label       : Label text
% 	color 		: Text color
% Output parameters:
%   hobj        : Graphical object handle

set(0,'CurrentFigure',this.hF)
set(this.hF,'CurrentAxes',this.hA)

%% Add text label
hobj = textm(lat0,lon0,label,...
    'Color',color,'FontSize',1,'HorizontalAlignment','center');

if isempty(hobj)
    warning('Object is outside axes projection limits')
end