function varargout = AppGuideTaller(varargin)
% APPGUIDETALLER MATLAB code for AppGuideTaller.fig
%      APPGUIDETALLER, by itself, creates a new APPGUIDETALLER or raises the existing
%      singleton*.
%
%      H = APPGUIDETALLER returns the handle to a new APPGUIDETALLER or the handle to
%      the existing singleton*.
%
%      APPGUIDETALLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPGUIDETALLER.M with the given input arguments.
%
%      APPGUIDETALLER('Property','Value',...) creates a new APPGUIDETALLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppGuideTaller_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppGuideTaller_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppGuideTaller

% Last Modified by GUIDE v2.5 05-Apr-2019 09:55:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppGuideTaller_OpeningFcn, ...
                   'gui_OutputFcn',  @AppGuideTaller_OutputFcn, ...
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


% --- Executes just before AppGuideTaller is made visible.
function AppGuideTaller_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppGuideTaller (see VARARGIN)

% Choose default command line output for AppGuideTaller
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AppGuideTaller wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AppGuideTaller_OutputFcn(hObject, eventdata, handles) 
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
Fs = 44100;
t = 3;
v = audiorecorder(Fs, 16, 1);

%v.StartFcn = 'disp(''   iniciando grabación'')';
%v.StopFcn = 'disp(''   terminando grabación'')';

%input ('Grabe su voz durante 3 segundos (Luego de presionar la tecla "ENTER")'); 
recordblocking(v, t)
y = v.getaudiodata()
audiowrite ('test1.wav',y,Fs); 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[y,Fs]=audioread('test1.wav');
sound(y, Fs);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delay=zeros(100000,1)
[y,Fs]=audioread('test1.wav');
izq=[y;delay]
der=[delay;y]

y1=[izq der]

tam=size(der,1)/Fs;

reprod=audioplayer(y1,Fs);
audiowrite ('test2.wav',y1,Fs); 
[y1,Fs]=audioread('test2.wav');
sound(y1,Fs);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ret1=zeros(1000000,1)
[y,Fs]=audioread('test1.wav');

izq1=[y;ret1]
der1=[ret1;y]

y2=[izq1 der1]

tam1=size(der1,1)/Fs;

reprod1=audioplayer(y2,Fs);
audiowrite ('test3.wav',y2,Fs); 
[y2,Fs]=audioread('test3.wav');
sound(y2,Fs);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ret2=zeros(10000,1)
[y,Fs]=audioread('test1.wav');

izq2=[y;ret2]
der2=[ret2;y]

y3=[izq2 der2]

tam2=size(der2,1)/Fs;

reprod2=audioplayer(y3,Fs);
audiowrite ('test3.wav',y3,Fs); 
[y3,Fs]=audioread('test3.wav');
sound(y3,Fs);




% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
im=imread('mia.jpeg');
imshow(im)
% Hint: place code in OpeningFcn to populate axes1



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
