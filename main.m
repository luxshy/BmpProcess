clear
clc
screen=get(0,'ScreenSize');
W=screen(3);H=screen(4);
hf=figure('Color',[1,1,1],'Position',[0.32*H,0.2*H,0.6*W,0.4*H],...
'Name','数字加网简易程序','NumberTitle','off','MenuBar','none');
%构造一个菜单栏
hphoto=uimenu(hf,'Label','&文件');
uimenu(hphoto,'Label','&打开','callback','Open');
uimenu(hphoto,'Label','&退出','callback','close');
uimenu(hphoto,'Label','&分色','callback','separate');
uimenu(hphoto,'Label','&合成','callback','combine');
%打开图片
hphoto=uimenu(hf,'Label','&调幅加网');
uimenu(hphoto,'Label','&0°加网','callback','screening_0');
uimenu(hphoto,'Label','&15°加网','callback','screening_15');
uimenu(hphoto,'Label','&45°加网','callback','screening_45');
uimenu(hphoto,'Label','&75°加网','callback','screening_75');
%调幅加网
hphoto=uimenu(hf,'Label','&调频加网');
uimenu(hphoto,'Label','&D8Bayer抖动','callback','D8Bayer');
uimenu(hphoto,'Label','&CoarseFatting抖动','callback','CoarseFatting');
uimenu(hphoto,'Label','&Halftone抖动','callback','Halftone');
uimenu(hphoto,'Label','&Screw抖动','callback','Screw');
%调频加网
hphoto=uimenu(hf,'Label','&评价');
uimenu(hphoto,'Label','&打开对比图像','callback','open1');
uimenu(hphoto,'Label','&指标计算','callback','value');



