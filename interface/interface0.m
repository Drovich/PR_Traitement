function varargout = interface0(varargin)
% INTERFACE0 MATLAB code for interface0.fig
%      INTERFACE0, by itself, creates a new INTERFACE0 or raises the existing
%      singleton*.
%
%      H = INTERFACE0 returns the handle to a new INTERFACE0 or the handle to
%      the existing singleton*.
%
%      INTERFACE0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE0.M with the given input arguments.
%
%      INTERFACE0('Property','Value',...) creates a new INTERFACE0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface0

% Last Modified by GUIDE v2.5 11-Dec-2018 13:46:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface0_OpeningFcn, ...
                   'gui_OutputFcn',  @interface0_OutputFcn, ...
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


% --- Executes just before interface0 is made visible.
function interface0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface0 (see VARARGIN)

% Choose default command line output for interface0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in aleatory_launch.
function aleatory_launch_Callback(hObject, eventdata, handles)
% hObject    handle to aleatory_launch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
aleatory(handles.image);
catch
end
% Hint: get(hObject,'Value') returns toggle state of aleatory_launch


% --- Executes on button press in method2points.
function method2points_Callback(hObject, eventdata, handles)
% hObject    handle to method2points (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
firstmethod(handles.image);
catch
end
% Hint: get(hObject,'Value') returns toggle state of method2points


% --- Executes on button press in loadingimage.
function loadingimage_Callback(hObject, eventdata, handles)
% hObject    handle to loadingimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.jpg', 'rt');
image = imread(fullfile(path, file));
handles.image = image;
% % handles.Fs = signal.Fs;
% handles.N = size(handles.data,2);
% handles.time_axis = (1:handles.N)/handles.Fs;
imshow(image); grid on;
% % xlabel('Time (s)');
% % ylabel('Magnitude');
% textLabel = sprintf('Time evolution of the loaded signal');
% set(handles.text_main, 'String', textLabel);
guidata(hObject, handles);
