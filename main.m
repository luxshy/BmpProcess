clear
clc
screen=get(0,'ScreenSize');
W=screen(3);H=screen(4);
hf=figure('Color',[1,1,1],'Position',[0.32*H,0.2*H,0.6*W,0.4*H],...
'Name','���ּ������׳���','NumberTitle','off','MenuBar','none');
%����һ���˵���
hphoto=uimenu(hf,'Label','&�ļ�');
uimenu(hphoto,'Label','&��','callback','Open');
uimenu(hphoto,'Label','&�˳�','callback','close');
uimenu(hphoto,'Label','&��ɫ','callback','separate');
uimenu(hphoto,'Label','&�ϳ�','callback','combine');
%��ͼƬ
hphoto=uimenu(hf,'Label','&��������');
uimenu(hphoto,'Label','&0�����','callback','screening_0');
uimenu(hphoto,'Label','&15�����','callback','screening_15');
uimenu(hphoto,'Label','&45�����','callback','screening_45');
uimenu(hphoto,'Label','&75�����','callback','screening_75');
%��������
hphoto=uimenu(hf,'Label','&��Ƶ����');
uimenu(hphoto,'Label','&D8Bayer����','callback','D8Bayer');
uimenu(hphoto,'Label','&CoarseFatting����','callback','CoarseFatting');
uimenu(hphoto,'Label','&Halftone����','callback','Halftone');
uimenu(hphoto,'Label','&Screw����','callback','Screw');
%��Ƶ����
hphoto=uimenu(hf,'Label','&����');
uimenu(hphoto,'Label','&�򿪶Ա�ͼ��','callback','open1');
uimenu(hphoto,'Label','&ָ�����','callback','value');



