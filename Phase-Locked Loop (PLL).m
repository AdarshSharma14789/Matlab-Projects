% Phase-Locked Loop (PLL) in Simulink
% Create a new Simulink model programmatically

model = 'PLL_Model';
open_system(new_system(model));
open_system(model);

% Add blocks
add_block('simulink/Sources/Sine Wave', [model '/Sine Wave'], 'Position', [30, 30, 60, 60]);
add_block('simrf_v2/VCO', [model '/VCO'], 'Position', [150, 30, 180, 60]);
add_block('simulink/Math Operations/Product', [model '/Product'], 'Position', [90, 30, 120, 60]);
add_block('dsp/Spectrum Analyzer', [model '/Low-Pass Filter'], 'Position', [210, 30, 240, 60]);
add_block('simulink/Commonly Used Blocks/Scope', [model '/Scope'], 'Position', [270, 30, 300, 60]);

% Connect blocks
add_line(model, 'Sine Wave/1', 'Product/1');
add_line(model, 'VCO/1', 'Product/2');
add_line(model, 'Product/1', 'Low-Pass Filter/1');
add_line(model, 'Low-Pass Filter/1', 'VCO/2');
add_line(model, 'VCO/1', 'Scope/1');

% Configure blocks
set_param([model '/Sine Wave'], 'Amplitude', '1', 'Frequency', '10');
set_param([model '/VCO'], 'InitialFrequency', '20', 'Sensitivity', '1');
set_param([model '/Low-Pass Filter'], 'FilterType', 'Butterworth', 'FilterOrder', '2', 'PassbandFrequency', '5');

% Run the simulation
set_param(model, 'StopTime', '10');
sim(model);

% Close the model
close_system(model, 0);
