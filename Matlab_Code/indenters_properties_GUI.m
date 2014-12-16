%% Copyright 2014 MERCIER David
function indenters_properties_GUI
%% Function used to get properties of the selected indenter
gui = guidata(gcf);

%% Properties of the Berkovich tip
gui.handles.title_indenterberk_prop_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0 0.65 0.35 0.35],...
	'HorizontalAlignment', 'left',...
	'String', 'Tip defect :',...
	'Visible', 'on');

gui.handles.value_indenterberk_prop_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position', [0.35 0.8 0.1 0.2],...
	'String', 1,...
	'Visible', 'on',...
	'Callback', 'clean_data');

gui.handles.unit_indenterberk_prop_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.45 0.65 0.08 0.35],...
	'String', 'nm',...
	'HorizontalAlignment', 'center',...
	'Visible', 'on');

% Coefficients of area function
gui.handles.title_area_function_GUI=uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0 0.325 0.9 0.325],...
	'String', 'Coefficients Ci of the area function :',...
	'HorizontalAlignment', 'left');

gui.handles.title_C1_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0 0.1 0.08 0.2],...
	'String', 'C1 :',...
	'HorizontalAlignment', 'left');

gui.handles.value_C1_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position', [0.05 0.1 0.1 0.2],...
	'String', 24.56,...
	'Callback', 'clean_data');

gui.handles.title_C2_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.2 0.1 0.08 0.2],...
	'String', 'C2 :',...
	'HorizontalAlignment', 'left');

gui.handles.value_C2_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position',[0.25 0.1 0.1 0.2],...
	'String', 0,...
	'Callback', 'clean_data');

gui.handles.title_C3_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.4 0.1 0.08 0.2],...
	'String', 'C3 :',...
	'HorizontalAlignment', 'left');

gui.handles.value_C3_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position', [0.45 0.1 0.1 0.2],...
	'String', 0,...
	'Callback', 'clean_data');

gui.handles.title_C4_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.6 0.1 0.08 0.2],...
	'String', 'C4 :',...
	'HorizontalAlignment', 'left');

gui.handles.value_C4_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position', [0.65 0.1 0.1 0.2],...
	'String', 0,...
	'Callback', 'clean_data');

gui.handles.title_C5_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.8 0.1 0.08 0.2],...
	'String', 'C5 :',...
	'HorizontalAlignment', 'left');

gui.handles.value_C5_GUI = uicontrol('Parent', gui.handles.bg_Berkovich_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'String', 0,...
	'Position', [0.85 0.1 0.1 0.2],...
	'Callback', 'clean_data');

%% Properties of the Vickers tip
gui.handles.title_indentervickers_prop_GUI = uicontrol('Parent', gui.handles.bg_Vickers_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0 0.65 0.35 0.35],...
	'String', 'Tip defect :',...
	'HorizontalAlignment', 'left',...
	'Visible', 'on');

gui.handles.value_indentervickers_prop_GUI = uicontrol('Parent', gui.handles.bg_Vickers_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position', [0.35 0.8 0.1 0.2],...
	'String', 1,...
	'Visible', 'on',...
	'Callback', 'clean_data');

gui.handles.unit_indentervickers_prop_GUI = uicontrol('Parent', gui.handles.bg_Vickers_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.45 0.65 0.08 0.35],...
	'String', 'nm',...
	'HorizontalAlignment', 'center',...
	'Visible', 'on');
	
%% Properties of the Conical tip
gui.handles.title_indentercon_ang_prop_GUI = uicontrol('Parent', gui.handles.bg_conical_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0. 0.3 0.35 0.35],...
    'String', 'Angle of the conical tip :',...
	'HorizontalAlignment', 'left',...
	'Visible', 'on');

gui.handles.value_indentercon_ang_prop_GUI = uicontrol('Parent', gui.handles.bg_conical_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position', [0.35 0.45 0.1 0.2],...
	'String', 45,...
	'Visible', 'on',...
	'Callback', 'clean_data');

gui.handles.unit_indentercon_ang_prop_GUI = uicontrol('Parent', gui.handles.bg_conical_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.45 0.3 0.04 0.35],...
	'String', '�',...
	'HorizontalAlignment', 'center',...
	'Visible', 'on');

gui.handles.title_indentercon_def_prop_GUI = uicontrol('Parent', gui.handles.bg_conical_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0 0.65 0.35 0.35],...
	'String', 'Tip defect :',...
	'HorizontalAlignment', 'left',...
	'Visible', 'on');

gui.handles.value_indentercon_def_prop_GUI = uicontrol('Parent', gui.handles.bg_conical_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'edit',...
	'Position', [0.35 0.8 0.1 0.2],...
	'String', 1,....
	'Visible', 'on',...
	'Callback', 'clean_data');

gui.handles.unit_indentercon_def_prop_GUI = uicontrol('Parent', gui.handles.bg_conical_tip_GUI,...
	'Units', 'normalized',...
    'Style', 'text',...
	'Position', [0.45 0.65 0.08 0.35],...
	'String', 'nm',...
	'HorizontalAlignment','center',...
	'Visible', 'on');

guidata(gcf, gui);

end