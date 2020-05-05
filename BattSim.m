function varargout = BattSim(varargin)
% BATTSIM MATLAB code for BattSim.fig
%      BATTSIM, by itself, creates a new BATTSIM or raises the existing
%      singleton*.
%
%      H = BATTSIM returns the handle to a new BATTSIM or the handle to
%      the existing singleton*.
%
%      BATTSIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BATTSIM.M with the given input arguments.
%
%      BATTSIM('Property','Value',...) creates a new BATTSIM or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BattSim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BattSim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BattSim

% Last Modified by GUIDE v2.5 04-May-2020 19:55:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BattSim_OpeningFcn, ...
                   'gui_OutputFcn',  @BattSim_OutputFcn, ...
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

% --- Executes just before BattSim is made visible.
function BattSim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BattSim (see VARARGIN)

% Choose default command line output for BattSim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes BattSim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BattSim_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function cell_cap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cell_cap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cell_cap_Callback(hObject, eventdata, handles)
% hObject    handle to cell_cap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cell_cap as text
%        str2double(get(hObject,'String')) returns contents of cell_cap as a double
cell_cap = str2double(get(hObject, 'String'));
if isnan(cell_cap)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new cell_cap value
handles.metricdata.cell_cap = cell_cap;
guidata(hObject,handles)
assignin('base','cell_capacity',cell_cap);

% --- Executes during object creation, after setting all properties.
function no_of_cells_CreateFcn(hObject, eventdata, handles)
% hObject    handle to no_of_cells (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function no_of_cells_Callback(hObject, eventdata, handles)
% hObject    handle to no_of_cells (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of no_of_cells as text
%        str2double(get(hObject,'String')) returns contents of no_of_cells as a double
no_of_cells = str2double(get(hObject, 'String'));
if isnan(no_of_cells)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new no_of_cells value
handles.metricdata.no_of_cells = no_of_cells;
guidata(hObject,handles)
assignin('base','series_cells',no_of_cells);

function parallel_rows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parallel_rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function parallel_rows_Callback(hObject, eventdata, handles)
% hObject    handle to parallel_rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of parallel_rows as text
%        str2double(get(hObject,'String')) returns contents of parallel_rows as a double
parallel_rows = str2double(get(hObject, 'String'));
if isnan(parallel_rows)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new no_of_cells value
handles.metricdata.parallel_rows = parallel_rows;
guidata(hObject,handles)
assignin('base','parallel_cells',parallel_rows);

% --- Executes during object creation, after setting all properties.
function init_soc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to init_soc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function init_soc_Callback(hObject, eventdata, handles)
% hObject    handle to init_soc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of init_soc as text
%        str2double(get(hObject,'String')) returns contents of init_soc as a double
% % --- Executes on button press in CityDriveCycle.
init_soc = str2double(get(hObject, 'String'));
if isnan(init_soc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new no_of_cells value
handles.metricdata.init_soc = init_soc;
guidata(hObject,handles)
assignin('base','init_soc',init_soc);

function SimpleResistive_Callback(hObject, eventdata, handles)
% hObject    handle to CityDriveCycle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CityDriveCycle
assignin('base','Mode',1);
guidata(hObject,handles);

function TheveninFirstOrder_Callback(hObject, eventdata, handles)
% hObject    handle to CityDriveCycle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CityDriveCycle
assignin('base','Mode',2);
guidata(hObject,handles);

% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Option = get(hObject,'Tag');
    
    if(strcmp(Option,'SimpleResistance'))
     assignin('base','Mode',1);
        
    
    elseif(strcmp(Option,'TheveninFirstOrder'))
        assignin('base','Mode',2);
    
   end
% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Batt_init;
figure(1);

subplot(3,1,1);
evalin('base','plot(NEDC(:,1),NEDC(:,2))');
ylabel('Power_Demand(W)','fontWeight','bold','fontSize',12);
title('Power Demand of Battery','fontWeight','bold','fontSize',12);
set(gca,'fontSize',12,'fontWeight','bold');

subplot(3,1,2);
evalin('base','plot(V_terminal)');
ylabel('Terminal Voltage(V)','fontWeight','bold','fontSize',12);

if (evalin('base','Mode')== 1)
    title('Simple Resistive Terminal Voltage ','fontWeight','bold','fontSize',12);

else
    title('Thevenin First Order Terminal Voltage','fontWeight','bold','fontSize',12);

end

set(gca,'fontSize',12,'fontWeight','bold');

subplot(3,1,3);
evalin('base','plot(Batt_SOC)');
xlabel('time (sec)','fontWeight','bold','fontSize',12);
ylabel('SOC','fontWeight','bold','fontSize',12);
title('SOC','fontWeight','bold','fontSize',12);
set(gca,'fontSize',12,'fontWeight','bold');

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
handles.metricdata.cell_cap = 60;          % cell capacity in A-hr
handles.metricdata.no_of_cells = 96;      % no.of.cells in series
handles.metricdata.parallel_rows = 3;    % no. of cells in parallel
handles.metricdata.init_soc = 0.6;     % Initial SOC


set(handles.cell_cap, 'String', handles.metricdata.cell_cap);

set(handles.no_of_cells,  'String', handles.metricdata.no_of_cells);

set(handles.parallel_rows,  'String', handles.metricdata.parallel_rows);

set(handles.init_soc,'String', handles.metricdata.init_soc);

set(handles.SimpleResistance,'value', 0);
set(handles.TheveninFirstOrder,'value',0);

assignin('base','cell_capacity',60);
assignin('base','series_cells',96);
assignin('base','parallel_cells',3);
assignin('base','init_soc',0.6);

% Update handles structure
guidata(handles.figure1, handles);





% --- Executes during object creation, after setting all properties.
