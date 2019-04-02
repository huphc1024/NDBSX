function varargout = NCKHGV(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NCKHGV_OpeningFcn, ...
                   'gui_OutputFcn',  @NCKHGV_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function NCKHGV_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = NCKHGV_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
%hien thi so luong xe vao ra truoc do, khi bi cup dien
slxv = xlsread('bienso.xls', 1,'I1' );
slxv=num2str(slxv);
set(handles.slxevao, 'string', slxv);
slxr=xlsread('bienso.xls', 1,'J1' );
slxr=num2str(slxr);
set(handles.slxera, 'string', slxr);
mstr=['Jan';'Feb';'Mar';'Apr';
      'May';'Jun';'Jul';'Aug';
      'Sep';'Oct';'Nov';'Dec'];

while (find(get(0,'children')==handles.figure))
    now=fix(clock);
    datestr=sprintf('%2d : %s : %4d',now(3),mstr(now(2),:),now(1));
    timestr=[num2str(now(4)) ' : ', sprintf('%02d : %02d',now(5),now(6))];%lay thoi gian he thong
    suffix='';
    if now(4)>12,
        suffix='  PM';
        thoigian=rem(now(4),12);
        timestr=[num2str(thoigian) ' : ', sprintf('%02d : %02d',now(5),now(6))];%lay thoi gian he thong
        timestr=[timestr, suffix];
        set(handles.text_date,'string',datestr);
        set(handles.text_time,'string',timestr);%hien thi thoi gian
        pause(1)           
    else
        suffix='  AM';
        timestr=[num2str(now(4)) ' : ', sprintf('%02d : %02d',now(5),now(6))];%lay thoi gian he thong
        timestr=[timestr, suffix];
        set(handles.text_date,'string',datestr);
        set(handles.text_time,'string',timestr);%hien thi thoi gian
        pause(1)  
    end

end

function edit1_CreateFcn(hObject, eventdata, handles)
text=findobj(gcf,'tag','edit1');
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function edit1_Callback(hObject, eventdata, handles)

function edit_hang1_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function edit_hang1_Callback(hObject, eventdata, handles)

function edit_hang2_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function edit_hang2_Callback(hObject, eventdata, handles)

function pushbutton_chonhinh_Callback(hObject, eventdata, handles)
    axes(handles.axes1);
    ChonHinh=findobj(gcf,'tag','edit1');
    [ten,duongdan]=uigetfile('*.jpg','chon file de doc');
    image=[duongdan,ten];
    set( ChonHinh,'string',image);
    imshow(image);
return

function pushbutton_thoat_Callback(hObject, eventdata, handles)
if isdeployed
    close all
    quit force
else
    close all;
end
return;
function pushbutton_TachBienSo_Callback(hObject, eventdata, handles)
d=findobj(gcf,'tag','edit1');
%b=findobj(gcf,'tag','edit2');
%c=findobj(gcf,'tag','edit3');
pic1=get(d,'string');
pic1=imread(pic1);
[bienso, biensomau] = laybiensohoanchinh(pic1);
[hang1,hang2]=phanvungchu(bienso);
seg1 = character_segmentation(hang1);
seg2 = character_segmentation(hang2);
return

function pushbutton_phanvung_Callback(hObject, eventdata, handles)
h1=findobj(gcf,'tag','edit1'); %gcf: get handles to current figure
pic1=get(h1,'string');
image=imread(pic1);
[bienso, biensomau] = laybiensohoanchinh(image); %lay ra dung kich thuoc bso hoan chinh tu 3:48,11:140 dang trang den
save 'dulieubienso1.mat';
load 'dulieubienso1.mat';
[hang1,hang2]=phanvungchu(bienso); 
seg1 = character_segmentation(hang1); %lay dien tich cua chu va so
seg2 = character_segmentation(hang2); 
ketquaphanvung(hang1,hang2,seg1,seg2); %hien thi tung chu va so cach khoang nhau nhung co dien tich khac nhau
save 'dulieubienso1.mat';
return

function pushbutton_nhandang_Callback(hObject, eventdata, handles)
    hinh=findobj(gcf,'tag','edit1'); %tim doi tuong anh (gcf) trong tag edit1, gcf: get handles to current figure
    picture=get(hinh,'string');%lay handles cua anh duoi dang chuoi
    
    image=imread(picture);%Doc anh vao
    [bienso, biensomau] = laybiensohoanchinh(image); %lay ra dung kich thuoc bso hoan chinh tu 3:48,11:140 dang trang den
    save 'dulieubienso.mat';
    load 'dulieubienso.mat';
    %phan vung chu va so
    [hang1,hang2]=phanvungchu(bienso); 
    seg1 = character_segmentation(hang1); %lay dien tich cua chu va so
    seg2 = character_segmentation(hang2); 
    ketquaphanvung(hang1,hang2,seg1,seg2); %hien thi tung chu va so cach khoang nhau nhung co dien tich khac nhau
    save 'dulieubienso.mat';
    %nhan dang
    b=findobj(gcf,'tag','edit_hang1'); %gcf: get handles to current figure
    c=findobj(gcf,'tag','edit_hang2');
    load 'dulieubienso.mat';
    load 'netso.mat'; %tai sao netsot.mat co de load len xu lu
    load 'netchu.mat';%tai sao netchu.mat co de load len xu ly
    number1 = nhandangsonoron1(hang1, seg1, netso);%, netchu);
    set(b,'string',number1);
    number2 = nhandangsonoron2(hang2, seg2, netso); 
    set(c,'string',number2);
return


function text_date_Callback(hObject, eventdata, handles)

function text_date_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_time_Callback(hObject, eventdata, handles)

function text_time_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function slxevao_Callback(hObject, eventdata, handles)

function slxevao_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function slxera_Callback(hObject, eventdata, handles)

function slxera_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function opencamera1_Callback(hObject, eventdata, handles)
axes(handles.axes1);
obj1 = videoinput('winvideo', 1,'YUY2_640x480');
set(obj1,'ReturnedColorSpace','rgb');
src_obj1 = getselectedsource(obj1);
get(src_obj1);
vidRes = get(obj1, 'VideoResolution');  
    nBands = get(obj1, 'NumberOfBands');
    hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
preview(obj1, hImage);
return
function capture_xevao_Callback(hObject, eventdata, handles)
%dem so luong xe vao
    slxv = xlsread('bienso.xls', 1,'I1' );
    slxv=slxv+1;
    xlswrite('bienso.xls', slxv, 1, 'I1')
    set(handles.slxevao, 'string', slxv);
%chup anh BSX vao
    obj1 = videoinput('winvideo', 1,'YUY2_640x480');
    set(obj1,'ReturnedColorSpace','rgb');
    src_obj1 = getselectedsource(obj1);
    get(src_obj1);
    vidRes = get(obj1, 'VideoResolution');  
    nBands = get(obj1, 'NumberOfBands');
    hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
    preview(obj1, hImage);
    pause(2);
    hinh1=getsnapshot(obj1); 
    hinh1=imresize(hinh1,[480 640]);
    imwrite(hinh1,'hinh1.jpg','Quality', 100);
    image1 = imread('hinh1.jpg');
    
    [bienso, biensomau] = laybiensohoanchinh(image1); %lay ra dung kich thuoc bso hoan chinh tu 3:48,11:140 dang trang den
    save 'dulieubienso.mat';
    load 'dulieubienso.mat';
    %phan vung
    [hang1,hang2]=phanvungchu(bienso); 
    seg1 = character_segmentation(hang1); %lay dien tich cua chu va so
    seg2 = character_segmentation(hang2); 
    ketquaphanvung(hang1,hang2,seg1,seg2); %hien thi tung chu va so cach khoang nhau nhung co dien tich khac nhau
    save 'dulieubienso.mat';
    %nhan dang
    b=findobj(gcf,'tag','edit_hang1'); %gcf: get handles to current figure
    c=findobj(gcf,'tag','edit_hang2');
    load 'dulieubienso.mat';
    load 'netso.mat'; %tai sao netsot.mat co de load len xu lu
    load 'netchu.mat';%tai sao netchu.mat co de load len xu ly
    number1 = nhandangsonoron1(hang1, seg1, netso);%, netchu);
    set(b,'string',number1);
    number2 = nhandangsonoron2(hang2, seg2, netso); 
    set(c,'string',number2);
    xlswrite('bienso.xls', [b c], 1, 'B1:C1');
    %xlswrite('bienso.xls', c, 1, 'B1');
return
% --- Executes on button press in capture_xera.
function opencamera2_Callback(hObject, eventdata, handles)

axes(handles.axes2);
obj2 = videoinput('winvideo', 2,'YUY2_640x480');
set(obj2,'ReturnedColorSpace','rgb');
src_obj2 = getselectedsource(obj2);
get(src_obj2);
vidRes = get(obj2, 'VideoResolution');  
    nBands = get(obj2, 'NumberOfBands');
    hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
preview(obj2, hImage);
return

function capture_xera_Callback(hObject, eventdata, handles)
%khi co 1 xe ra thi giam so luong xe vao 1 don vi
    slxv = xlsread('bienso.xls', 1,'I1' );
    slxv=slxv-1;
    xlswrite('bienso.xls', slxv, 1, 'I1');
    set(handles.slxevao, 'string', slxv);
%dong thoi tang so luong xe ra 1 don vi
    slxr=xlsread('bienso.xls', 1,'J1' );
    slxr=slxr+1;
    xlswrite('bienso.xls', slxr, 1, 'J1');
    set(handles.slxera, 'string', slxr);
%chup anh BSX ra
    obj2 = videoinput('winvideo', 2,'YUY2_640x480');
    set(obj2,'ReturnedColorSpace','rgb');
    src_obj2 = getselectedsource(obj2);
    get(src_obj2);
    vidRes = get(obj2, 'VideoResolution');  
    nBands = get(obj2, 'NumberOfBands');
    hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
    preview(obj2, hImage);
        pause(2);
    hinh2=getsnapshot(obj2); 
    hinh2=imresize(hinh2,[480 640]);
    imwrite(hinh2,'hinh2.jpg','Quality', 100);
    image2 = imread('hinh2.jpg');

    [bienso, biensomau] = laybiensohoanchinh(image2); %lay ra dung kich thuoc bso hoan chinh tu 3:48,11:140 dang trang den
    save 'dulieubienso.mat';
    load 'dulieubienso.mat';
    %ph?n v?ng ch? v? s?
    [hang1,hang2]=phanvungchu(bienso); 
    seg1 = character_segmentation(hang1); %lay dien tich cua chu va so
    seg2 = character_segmentation(hang2); 
    ketquaphanvung(hang1,hang2,seg1,seg2); %hien thi tung chu va so cach khoang nhau nhung co dien tich khac nhau
    save 'dulieubienso.mat';
    %nh?n d?ng
    d=findobj(gcf,'tag','edit_hang3');
    e=findobj(gcf,'tag','edit_hang4');
    load 'dulieubienso.mat';
    load 'netso.mat'; 
    load 'netchu.mat';
    number1 = nhandangsonoron1(hang1, seg1, netso);% netchu
    set(d,'string',number1);
    number2 = nhandangsonoron2(hang2, seg2, netso); 
    set(e,'string',number2);
    xlswrite('bienso.xls', [d e], 1, 'D1:E1');
  %so sanh bien so xe vao va ra
    b=findobj(gcf,'tag','edit_hang1'); %gcf: get handles to current figure
    c=findobj(gcf,'tag','edit_hang2');
    d=findobj(gcf,'tag','edit_hang3'); %gcf: get handles to current figure
    e=findobj(gcf,'tag','edit_hang4');
    set(e,'string',number2);
    bienso = xlsread('bienso.xls', 1,'E1');
    doisokhongthanhchuoi=num2str(0);
    if bienso < 999
        a=num2str(bienso);
        bienso = strcat(doisokhongthanhchuoi,a);
    end
    set(e,'string',bienso);
    ss1=get(c,'string');
    ss2=get(e,'string');
%mo cong COM de giao tiep dieu khien Barie
    global s tx
    s=serial('COM8');
    set(s,'BaudRate',9600);
    set(s,'DataBits',8);
    set(s,'Parity','none');
    set(s,'StopBits',1);
    set(s,'FlowControl','none');
    fopen(s);
      if ss1==ss2
            disp('ok');
            fprintf(s,'A');
            pause(1);
        else
            disp('oh no');
            fprintf(s,'B');
            pause(1);
      end  
    fclose(s);
return

% --- Executes on button press in turnoff.
function turnoff_Callback(hObject, eventdata, handles)
    closepreview
return
function turnoff2_Callback(hObject, eventdata, handles)
    closepreview
return
function clear_Callback(hObject, eventdata, handles)
    slxv = xlsread('bienso.xls', 1,'I1:J1' );
    slxv=0;
    slxr=0;
    xlswrite('bienso.xls', slxv, 1, 'I1:J1');
    set(handles.slxevao, 'string', slxv);
    set(handles.slxera, 'string', slxr);
    set(handles.edit_hang1,'string','');
    set(handles.edit_hang2,'string','');
    set(handles.edit_hang3,'string','');
    set(handles.edit_hang4,'string','');
return



function edit_hang3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_hang3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_hang3 as text
%        str2double(get(hObject,'String')) returns contents of edit_hang3 as a double


% --- Executes during object creation, after setting all properties.
function edit_hang3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_hang3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_hang4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_hang4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_hang4 as text
%        str2double(get(hObject,'String')) returns contents of edit_hang4 as a double


% --- Executes during object creation, after setting all properties.
function edit_hang4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_hang4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes10_CreateFcn(hObject, eventdata, handles)
    chuky=imread('signalquan.bmp');
    imshow(chuky);
% hObject    handle to axes10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes10


