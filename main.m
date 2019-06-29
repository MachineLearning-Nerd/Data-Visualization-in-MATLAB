clear all 
close all
if isdir('./Outputs')==1
else
mkdir('./Outputs');
end
arraymax = [];
arraymin = [];
data.x = [];
data.y = [];
data.z = [];
data_length = 10000;
range = 10;
for i = 1:1:1
    data.x = [data.x [zeros(data_length/2, 1); (-1)*range + (range+range)*rand(data_length,1); zeros(data_length/2, 1)]];
    data.y = [data.y [zeros(data_length/2, 1); (-1)*range + (range+range)*rand(data_length,1); zeros(data_length/2, 1)]];
    data.z = exp(sin(data.x)+sin(data.y));
    
    arraymax = [arraymax max(data.z)];
    arraymin = [arraymin min(data.z)];
end
globalmax = max(arraymax);
globalmin = min(arraymin);
% globalmax = 0.5;
% globalmin = -0.07;
figure;
% light;
% lighting phong;
% camlight('left');
for i=1:1:1


X = data.x(:,i);
Y = data.y(:,i);
Z = data.z(:,i);
[xq,yq] = meshgrid((-1)*range:.02:range, (-1)*range:.02:range);
zq = griddata(X,Y,Z,xq,yq);
for j = 1:180
out_file = ['./Outputs/finalimages', num2str(i),num2str(j)];
az=j ; el=70;
surf(xq,yq,zq)
view([az el]); 

xlabel('Distance to the Trench (km)')
ylabel('Along Strike (km)')
zlabel('Depth (km)')
ax = gca;
ax.Visible = 'off';

% axis equal
axis tight



light;
lighting phong;
camlight('left');
shading interp;
xlim([(-1)*range range])
ylim([(-1)*range range])
zlim([globalmin,globalmax])
load('MyColormap.mat')
colormap(c)
% colormap(flipud(jet(64)));
caxis([globalmin,globalmax]);
colorbar('vertical');
saveas(gcf,out_file, 'png')
end
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);


% colormapeditor
% ax = gca;
% c = colormap(ax);
% save('MyColormap','c')

%% 
% hold on
% plot3(Y,Z,Vz,'o')
% xlim([-40 40])
% ylim([-40 40])


end