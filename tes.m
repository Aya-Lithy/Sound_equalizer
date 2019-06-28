function varargout = tes(varargin)
% TES MATLAB code for tes.fig
%      TES, by itself, creates a new TES or raises the existing
%      singleton*.
%
%      H = TES returns the handle to a new TES or the handle to
%      the existing singleton*.
%
%      TES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TES.M with the given input arguments.
%
%      TES('Property','Value',...) creates a new TES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tes

% Last Modified by GUIDE v2.5 28-Feb-2019 11:29:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tes_OpeningFcn, ...
                   'gui_OutputFcn',  @tes_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tes is made visible.
function tes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tes (see VARARGIN)

% Choose default command line output for tes
%vol = 10;
%set(handles.slider34,'value',vol);
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes tes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
[filename pathname] = uigetfile({'*.wav'},'File Selector');
handles.fullpathname = strcat(pathname, filename);
[handles.y,handles.Fs] = audioread(handles.fullpathname);
axes(handles.axes8);
plot (handles.y);
title('Original Audio')
p =audioplayer(handles.y,handles.Fs);

set(handles.text3, 'String',handles.fullpathname); %showing fullpathname

handles.Volume=get(handles.slider34,'value');

guidata(hObject,handles);

function play_equalizer(hObject, handles)
global player;
%handling volume    
handles.Volume=get(handles.slider34,'value');



handles.g1=get(handles.slider3,'value');
handles.g2=get(handles.slider19,'value');
handles.g3=get(handles.slider21,'value');
handles.g4=get(handles.slider26,'value');
handles.g5=get(handles.slider25,'value');
handles.g6=get(handles.slider27,'value');
handles.g7=get(handles.slider24,'value');
handles.g8=get(handles.slider29,'value');
handles.g9=get(handles.slider22,'value');
handles.g10=get(handles.slider30,'value');
handles.g11=get(handles.slider28,'value');
handles.g12=get(handles.slider31,'value');
handles.g13=get(handles.slider17,'value');
handles.g14=get(handles.slider32,'value');
handles.g15=get(handles.slider23,'value');
handles.g16=get(handles.slider20,'value');
handles.g17=get(handles.slider18,'value');
handles.g18=get(handles.slider16,'value');
handles.g19=get(handles.slider35,'value');


%handling 
set(handles.text16, 'String',handles.g1);
set(handles.text31, 'String',handles.g2);
set(handles.text32, 'String',handles.g3);
set(handles.text33, 'String',handles.g4);
set(handles.text34, 'String',handles.g5);
set(handles.text35, 'String',handles.g6);
set(handles.text36, 'String',handles.g7);
set(handles.text37, 'String',handles.g8);
set(handles.text38, 'String',handles.g9);
set(handles.text39, 'String',handles.g10);
set(handles.text40, 'String',handles.g11);
set(handles.text41, 'String',handles.g12);
set(handles.text42, 'String',handles.g13);
set(handles.text43, 'String',handles.g14);
set(handles.text44, 'String',handles.g15);
set(handles.text45, 'String',handles.g16);
set(handles.text46, 'String',handles.g17);
set(handles.text47, 'String',handles.g18);


%low pass filter 
cut_off=31; %cut off low pass dalama Hz (frequency constraints )
orde=40 ;
a=fir1(orde,cut_off/(handles.Fs/2),'low'); %fir1 design the filter
y1=handles.g1*filter(a,1,handles.y); % a= num , 1 den , y = audio data 

% %bandpass1
f1=32;
f2=63;
b1=fir1(orde,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.g2*filter(b1,1,handles.y);
% 
% %bandpass2
f3=64;
f4=87;
b2=fir1(orde,[f3/(handles.Fs/2) f4/(handles.Fs/2)],'bandpass');
y3=handles.g3*filter(b2,1,handles.y);
% 
% %bandpass3
 f4=88;
f5=125;
 b3=fir1(orde,[f4/(handles.Fs/2) f5/(handles.Fs/2)],'bandpass');
 y4=handles.g4*filter(b3,1,handles.y);
% 
% %bandpass4
 f5=126;
f6=175;
 b4=fir1(orde,[f5/(handles.Fs/2) f6/(handles.Fs/2)],'bandpass');
 y5=handles.g5*filter(b4,1,handles.y);
% 
% %bandpass5
  f7=176;
f8=250;
  b5=fir1(orde,[f7/(handles.Fs/2) f8/(handles.Fs/2)],'bandpass');
  y6=handles.g6*filter(b5,1,handles.y);
% 
% %bandpass6
  f9=251;
f10=350;
  b6=fir1(orde,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
  y7=handles.g7*filter(b6,1,handles.y);
% 
% %bandpass7
  f11=351;
f12=500;
  b7=fir1(orde,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
  y8=handles.g8*filter(b7,1,handles.y);
% 
 % %bandpass8
f13=501;
f14=700;
b8=fir1(orde,[f13/(handles.Fs/2) f14/(handles.Fs/2)],'bandpass');
y9=handles.g9*filter(b8,1,handles.y);
% 

%bandpass9 
f15=701;
f16=1000;
b9=fir1(orde, [f15/handles.Fs/2 f16/(handles.Fs/2)],'bandpass');
y10 =handles.g10*filter(b9,1,handles.y);

%bandpass10

f17=1001;
f18=1400;
b10=fir1(orde, [f17/handles.Fs/2 f18/(handles.Fs/2)],'bandpass');
y11 =handles.g11*filter(b10,1,handles.y);

%bandpass11
f19=1401;
f20=2000;
b11=fir1(orde, [f19/handles.Fs/2 f20/(handles.Fs/2)],'bandpass');
y12 =handles.g12*filter(b11,1,handles.y);

%bandpass12
f21=2001;
f22=2800;
b12=fir1(orde, [f21/handles.Fs/2 f22/(handles.Fs/2)],'bandpass');
y13 =handles.g13*filter(b12,1,handles.y);
%bandpass13
f23=2801;
f24=4000;
b13=fir1(orde, [f23/handles.Fs/2 f24/(handles.Fs/2)],'bandpass');
y14 =handles.g14*filter(b13,1,handles.y);
%bandpass14
f25=4001;
f26=5600;
b14=fir1(orde, [f25/handles.Fs/2 f26/(handles.Fs/2)],'bandpass');
y15 =handles.g15*filter(b14,1,handles.y);

%bandpass15
f27=5601;
f28=8000;
b15=fir1(orde, [f27/handles.Fs/2 f28/(handles.Fs/2)],'bandpass');
y16 =handles.g16*filter(b15,1,handles.y);
%bandpass16
f29=8001;
f30=11200;
b16=fir1(orde, [f29/handles.Fs/2 f30/(handles.Fs/2)],'bandpass');
y17=handles.g17*filter(b16,1,handles.y);

%pandpass17

f31=11201;
f32=16000;
b17=fir1(orde, [f31/handles.Fs/2 f32/(handles.Fs/2)],'bandpass');
y18=handles.g18*filter(b17,1,handles.y);
 %highpass18
cut_off2=16000;
c=fir1(orde,cut_off2/(handles.Fs/2),'high');
y19=handles.g19*filter(c,1,handles.y);

%handles.yT=Sum of y;
 handles.yT=y1+y2+y3+y4+y5+y6+y7+y8+y9+y10+y11+y12+y13+y14+y15+y16+y17+y18+y19;
 
 player = audioplayer(handles.Volume*handles.yT, handles.Fs);

axes(handles.axes7);
title('Filtered Audio')
plot(handles.yT);

guidata(hObject,handles)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global player;
global p ;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%equalizer_play();
play_equalizer(hObject, handles); 
play(player);
play (p);
guidata(hObject,handles)

%t=0:1/handles.Fs:(length(handles.player)-1)/handles.Fs;
%plot(handles.yT,handles.axes2);
%set(handles.axes2);
%handles.yT(handles.axes2);


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;

play_equalizer(hObject, handles); 
pause(player);

guidata(hObject,handles)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
global p ;
play_equalizer(hObject, handles); 
stop(player);
stop (p ) ;
guidata(hObject,handles)



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
global p;
play_equalizer(hObject, handles); 
resume(player);
resume(p) ;
guidata(hObject,handles)



% --- Executes on slider movement.
function slider12_Callback(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider15_Callback(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Pop.
function Pop_Callback(hObject, eventdata, handles)
% hObject    handle to Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = -1.5;
g2 = -0.6;
g3 = 3.9;
g4 = 4.5;
g5 = 5.4;
g6 = 4.5;
g7 = 2.1;
g8= 0.9;
g9 = -0.6;
g10 = -1.5;
g11=-1.5;
g12=-1.8;
g13=-2.1;
g14=-2.1;
g15=-2.7;
g16=-2.1;
g17=-2.1;
g18=-0.3;
g19=+0.0;
set(handles.slider3,'value',g1);
set(handles.slider19,'value',g2);
set(handles.slider21,'value',g3);
set(handles.slider26,'value',g4);
set(handles.slider25,'value',g5);
set(handles.slider27,'value',g6);
set(handles.slider24,'value',g7);
set(handles.slider29,'value',g8);
set(handles.slider22,'value',g9);
set(handles.slider30,'value',g10);
set(handles.slider28,'value',g11);
set(handles.slider31,'value',g12);
set(handles.slider17,'value',g13);
set(handles.slider32,'value',g14);
set(handles.slider23,'value',g15);
set(handles.slider20,'value',g16);
set(handles.slider18,'value',g17);
set(handles.slider16,'value',g18);
set(handles.slider35,'value',g19);

%set handling texts 
set(handles.text16, 'String',g1);
set(handles.text31, 'String',g2);
set(handles.text32, 'String',g3);
set(handles.text33, 'String',g4);
set(handles.text34, 'String',g5);
set(handles.text35, 'String',g6);
set(handles.text36, 'String',g7);
set(handles.text37, 'String',g8);
set(handles.text38, 'String',g9);
set(handles.text39, 'String',g10);
set(handles.text40, 'String',g11);
set(handles.text41, 'String',g12);
set(handles.text42, 'String',g13);
set(handles.text43, 'String',g14);
set(handles.text44, 'String',g15);
set(handles.text45, 'String',g16);
set(handles.text46, 'String',g17);
set(handles.text47, 'String',g18);




% --- Executes on button press in Rock.
function Rock_Callback(hObject, eventdata, handles)
% hObject    handle to Rock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 5.4;
g2 = 4.5;
g3 = 3.6;
g4 = -3.6;
g5 = -6.3;
g6 = -6.6;
g7 = -3.6;
g8= -2.7;
g9 = -0.3;
g10 = 2.1;
g11=4.5;
g12=6.0;
g13=9.6;
g14=7.5;
g15=7.8;
g16=7.8;
g17=7.8;
g18=8.1;
g19=+0.0;
set(handles.slider3,'value',g1);
set(handles.slider19,'value',g2);
set(handles.slider21,'value',g3);
set(handles.slider26,'value',g4);
set(handles.slider25,'value',g5);
set(handles.slider27,'value',g6);
set(handles.slider24,'value',g7);
set(handles.slider29,'value',g8);
set(handles.slider22,'value',g9);
set(handles.slider30,'value',g10);
set(handles.slider28,'value',g11);
set(handles.slider31,'value',g12);
set(handles.slider17,'value',g13);
set(handles.slider32,'value',g14);
set(handles.slider23,'value',g15);
set(handles.slider20,'value',g16);
set(handles.slider18,'value',g17);
set(handles.slider16,'value',g18);
set(handles.slider35,'value',g19);

%set handling texts 
set(handles.text16, 'String',g1);
set(handles.text31, 'String',g2);
set(handles.text32, 'String',g3);
set(handles.text33, 'String',g4);
set(handles.text34, 'String',g5);
set(handles.text35, 'String',g6);
set(handles.text36, 'String',g7);
set(handles.text37, 'String',g8);
set(handles.text38, 'String',g9);
set(handles.text39, 'String',g10);
set(handles.text40, 'String',g11);
set(handles.text41, 'String',g12);
set(handles.text42, 'String',g13);
set(handles.text43, 'String',g14);
set(handles.text44, 'String',g15);
set(handles.text45, 'String',g16);
set(handles.text46, 'String',g17);
set(handles.text47, 'String',g18);

function Party_Callback(hObject, eventdata, handles)
% hObject    handle to Party (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 5.4;
g2 = 5.4;
g3 = 5.4;
g4 = 0.0;
g5 = 0.0;
g6 = 0.0;
g7 = 0.0;
g8= 0.0;
g9 = 0.0;
g10 =0.0;
g11=0.0;
g12=0.0;
g13=0.0;
g14=0.0;
g15=-0.0;
g16=0.0;
g17=5.4;
g18=5.4;
g19=+0.0;
set(handles.slider3,'value',g1);
set(handles.slider19,'value',g2);
set(handles.slider21,'value',g3);
set(handles.slider26,'value',g4);
set(handles.slider25,'value',g5);
set(handles.slider27,'value',g6);
set(handles.slider24,'value',g7);
set(handles.slider29,'value',g8);
set(handles.slider22,'value',g9);
set(handles.slider30,'value',g10);
set(handles.slider28,'value',g11);
set(handles.slider31,'value',g12);
set(handles.slider17,'value',g13);
set(handles.slider32,'value',g14);
set(handles.slider23,'value',g15);
set(handles.slider20,'value',g16);
set(handles.slider18,'value',g17);
set(handles.slider16,'value',g18);
set(handles.slider35,'value',g19);

%set handling texts 
set(handles.text16, 'String',g1);
set(handles.text31, 'String',g2);
set(handles.text32, 'String',g3);
set(handles.text33, 'String',g4);
set(handles.text34, 'String',g5);
set(handles.text35, 'String',g6);
set(handles.text36, 'String',g7);
set(handles.text37, 'String',g8);
set(handles.text38, 'String',g9);
set(handles.text39, 'String',g10);
set(handles.text40, 'String',g11);
set(handles.text41, 'String',g12);
set(handles.text42, 'String',g13);
set(handles.text43, 'String',g14);
set(handles.text44, 'String',g15);
set(handles.text45, 'String',g16);
set(handles.text46, 'String',g17);
set(handles.text47, 'String',g18);




% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function slider16_Callback(hObject, eventdata, handles)
% hObject    handle to slider16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider17_Callback(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider18_Callback(hObject, eventdata, handles)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider19_Callback(hObject, eventdata, handles)
% hObject    handle to slider19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider20_Callback(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider21_Callback(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider22_Callback(hObject, eventdata, handles)
% hObject    handle to slider22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider23_Callback(hObject, eventdata, handles)
% hObject    handle to slider23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider24_Callback(hObject, eventdata, handles)
% hObject    handle to slider24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider25_Callback(hObject, eventdata, handles)
% hObject    handle to slider25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider26_Callback(hObject, eventdata, handles)
% hObject    handle to slider26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider27_Callback(hObject, eventdata, handles)
% hObject    handle to slider27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider28_Callback(hObject, eventdata, handles)
% hObject    handle to slider28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider29_Callback(hObject, eventdata, handles)
% hObject    handle to slider29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider30_Callback(hObject, eventdata, handles)
% hObject    handle to slider30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider31_Callback(hObject, eventdata, handles)
% hObject    handle to slider31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider32_Callback(hObject, eventdata, handles)
% hObject    handle to slider32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes during object creation, after setting all properties.
function slider33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider34_Callback(hObject, eventdata, handles)
% hObject    handle to slider34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider35_Callback(hObject, eventdata, handles)
% hObject    handle to slider35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end








% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 3.0;
g2 = 6.3;
g3 = 5.1;
g4 = 3.6;
g5 = 1.8;
g6 = -3.9;
g7 = -4.8;
g8= -5.1;
g9 = -2.1;
g10 = 1.2;
g11=4.5;
g12=9.0;
g13=3.0;
g14=-1.8;
g15=-4.5;
g16=-2.4;
g17=-0.6;
g18=-2.4;
g19=+0.0;
set(handles.slider3,'value',g1);
set(handles.slider19,'value',g2);
set(handles.slider21,'value',g3);
set(handles.slider26,'value',g4);
set(handles.slider25,'value',g5);
set(handles.slider27,'value',g6);
set(handles.slider24,'value',g7);
set(handles.slider29,'value',g8);
set(handles.slider22,'value',g9);
set(handles.slider30,'value',g10);
set(handles.slider28,'value',g11);
set(handles.slider31,'value',g12);
set(handles.slider17,'value',g13);
set(handles.slider32,'value',g14);
set(handles.slider23,'value',g15);
set(handles.slider20,'value',g16);
set(handles.slider18,'value',g17);
set(handles.slider16,'value',g18);
set(handles.slider35,'value',g19);

%set handling texts 
set(handles.text16, 'String',g1);
set(handles.text31, 'String',g2);
set(handles.text32, 'String',g3);
set(handles.text33, 'String',g4);
set(handles.text34, 'String',g5);
set(handles.text35, 'String',g6);
set(handles.text36, 'String',g7);
set(handles.text37, 'String',g8);
set(handles.text38, 'String',g9);
set(handles.text39, 'String',g10);
set(handles.text40, 'String',g11);
set(handles.text41, 'String',g12);
set(handles.text42, 'String',g13);
set(handles.text43, 'String',g14);
set(handles.text44, 'String',g15);
set(handles.text45, 'String',g16);
set(handles.text46, 'String',g17);
set(handles.text47, 'String',g18);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = -1.5;
g2 = -0.6;
g3 = 3.9;
g4 = 4.5;
g5 = 5.4;
g6 = 4.5;
g7 = 2.1;
g8= 0.9;
g9 = -0.6;
g10 = -1.5;
g11=-1.5;
g12=-1.8;
g13=-2.1;
g14=-2.1;
g15=-2.7;
g16=-2.1;
g17=-2.1;
g18=-0.3;
g19=+0.0;
set(handles.slider3,'value',g1);
set(handles.slider19,'value',g2);
set(handles.slider21,'value',g3);
set(handles.slider26,'value',g4);
set(handles.slider25,'value',g5);
set(handles.slider27,'value',g6);
set(handles.slider24,'value',g7);
set(handles.slider29,'value',g8);
set(handles.slider22,'value',g9);
set(handles.slider30,'value',g10);
set(handles.slider28,'value',g11);
set(handles.slider31,'value',g12);
set(handles.slider17,'value',g13);
set(handles.slider32,'value',g14);
set(handles.slider23,'value',g15);
set(handles.slider20,'value',g16);
set(handles.slider18,'value',g17);
set(handles.slider16,'value',g18);
set(handles.slider35,'value',g19);

%set handling texts 
set(handles.text16, 'String',g1);
set(handles.text31, 'String',g2);
set(handles.text32, 'String',g3);
set(handles.text33, 'String',g4);
set(handles.text34, 'String',g5);
set(handles.text35, 'String',g6);
set(handles.text36, 'String',g7);
set(handles.text37, 'String',g8);
set(handles.text38, 'String',g9);
set(handles.text39, 'String',g10);
set(handles.text40, 'String',g11);
set(handles.text41, 'String',g12);
set(handles.text42, 'String',g13);
set(handles.text43, 'String',g14);
set(handles.text44, 'String',g15);
set(handles.text45, 'String',g16);
set(handles.text46, 'String',g17);
set(handles.text47, 'String',g18);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 0.0;
g2 = 0.0;
g3 = 0.0;
g4 = 0.0;
g5 = 0.0;
g6 = 0.0;
g7 = 0.0;
g8= 0.0;
g9 = 0.0;
g10 = 0.0;
g11=0.0;
g12=0.0;
g13=0.0;
g14=-3.0;
g15=5.7;
g16=-5.7;
g17=-6.0;
g18=-8.1;
g19=+0.0;
set(handles.slider3,'value',g1);
set(handles.slider19,'value',g2);
set(handles.slider21,'value',g3);
set(handles.slider26,'value',g4);
set(handles.slider25,'value',g5);
set(handles.slider27,'value',g6);
set(handles.slider24,'value',g7);
set(handles.slider29,'value',g8);
set(handles.slider22,'value',g9);
set(handles.slider30,'value',g10);
set(handles.slider28,'value',g11);
set(handles.slider31,'value',g12);
set(handles.slider17,'value',g13);
set(handles.slider32,'value',g14);
set(handles.slider23,'value',g15);
set(handles.slider20,'value',g16);
set(handles.slider18,'value',g17);
set(handles.slider16,'value',g18);
set(handles.slider35,'value',g19);

%set handling texts 
set(handles.text16, 'String',g1);
set(handles.text31, 'String',g2);
set(handles.text32, 'String',g3);
set(handles.text33, 'String',g4);
set(handles.text34, 'String',g5);
set(handles.text35, 'String',g6);
set(handles.text36, 'String',g7);
set(handles.text37, 'String',g8);
set(handles.text38, 'String',g9);
set(handles.text39, 'String',g10);
set(handles.text40, 'String',g11);
set(handles.text41, 'String',g12);
set(handles.text42, 'String',g13);
set(handles.text43, 'String',g14);
set(handles.text44, 'String',g15);
set(handles.text45, 'String',g16);
set(handles.text46, 'String',g17);
set(handles.text47, 'String',g18);


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 0.0;
g2 = 0.0;
g3 = 0.0;
g4 = 0.0;
g5 = 0.0;
g6 = 0.0;
g7 = 0.0;
g8= 0.0;
g9 = 0.0;
g10 = 0.0;
g11=0.0;
g12=0.0;
g13=0.0;
g14=0.0;
g15=0.0;
g16=0.0;
g17=0.0;
g18=0.0;
g19=0.0;
set(handles.slider3,'value',g1);
set(handles.slider19,'value',g2);
set(handles.slider21,'value',g3);
set(handles.slider26,'value',g4);
set(handles.slider25,'value',g5);
set(handles.slider27,'value',g6);
set(handles.slider24,'value',g7);
set(handles.slider29,'value',g8);
set(handles.slider22,'value',g9);
set(handles.slider30,'value',g10);
set(handles.slider28,'value',g11);
set(handles.slider31,'value',g12);
set(handles.slider17,'value',g13);
set(handles.slider32,'value',g14);
set(handles.slider23,'value',g15);
set(handles.slider20,'value',g16);
set(handles.slider18,'value',g17);
set(handles.slider16,'value',g18);
set(handles.slider35,'value',g19);

%set handling texts 
set(handles.text16, 'String',g1);
set(handles.text31, 'String',g2);
set(handles.text32, 'String',g3);
set(handles.text33, 'String',g4);
set(handles.text34, 'String',g5);
set(handles.text35, 'String',g6);
set(handles.text36, 'String',g7);
set(handles.text37, 'String',g8);
set(handles.text38, 'String',g9);
set(handles.text39, 'String',g10);
set(handles.text40, 'String',g11);
set(handles.text41, 'String',g12);
set(handles.text42, 'String',g13);
set(handles.text43, 'String',g14);
set(handles.text44, 'String',g15);
set(handles.text45, 'String',g16);
set(handles.text46, 'String',g17);
set(handles.text47, 'String',g18);
