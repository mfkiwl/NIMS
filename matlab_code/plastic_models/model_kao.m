%% Copyright 2014 MERCIER David
function model_kao(OPTIONS)
%% Function used to calculate the hardness in bilayer sample with
% the model of Kao and Byrne (1981).

gui = guidata(gcf);

x = 1./gui.results.hc;
x = checkValues(x);
t = gui.results.t_corr;

% A(1) = Hf

bilayer_model = @(Hf, x) ...
    1e-9*(1e9.*gui.data.Hs + (2 .* gui.config.numerics.k_Kao .* t .* ...
    (1e9.*Hf - 1e9.*gui.data.Hs)) .* x);

% Make a starting guess
gui.results.A0 = gui.data.Hf0;

resultToolbox = isToolboxAvailable('Optimization Toolbox');

if resultToolbox
    [gui.results.Hf_fit, ...
        gui.results.resnorm, ...
        gui.results.residual, ...
        gui.results.exitflag, ...
        gui.results.output, ...
        gui.results.lambda, ...
        gui.results.jacobian] =...
        lsqcurvefit(bilayer_model, gui.results.A0, x, ...
        gui.results.H, ...
        gui.config.numerics.Min_Hardness, ...
        gui.config.numerics.Max_Hardness, ...
        OPTIONS);
else
    model = @LMS;
    gui.results.Hf_fit = fminsearch(model, gui.results.A0);
    warning('No Optimization toolbox availble !');
end

    function [sse, FittedCurve] = LMS(params)
        Hf(1) = params(1);
        FittedCurve = 1e-9*(1e9.*gui.data.Hs + (2 .* gui.config.numerics.k_Kao .* t .* ...
            (1e9.*Hf - 1e9.*gui.data.Hs)) .* x);
        ErrorVector = FittedCurve - gui.results.Esample_red;
        sse = sum(ErrorVector .^ 2);
    end

% gui.results.Hm = 1e-9*(...
%     1e9.*gui.data.Hs + (2 .* gui.config.numerics.k_Kao .* t .* ...
%     (1e9.*gui.results.Hf_fit - 1e9.*gui.data.Hs)) .* x);

gui.results.Hf = 1e-9*(...
    1e9.*gui.data.Hs + (1./x .* (1e9.*gui.results.Hf_fit - 1e9.*gui.data.Hs) ./ ...
    (2 .* gui.config.numerics.k_Kao .* t)));

guidata(gcf, gui);

end