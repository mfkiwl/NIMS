%% Copyright 2014 MERCIER David
function model_hay(OPTIONS)
%% Function used to calculate Young's modulus in bilayer system with
% the model of Hay et al. (2011) and see also Gao et al. (1992)

% N.B. : Errors for phigao0 in Fischer-Cripps "Nanoindentation 2nd Ed.".

gui = guidata(gcf);

x = gui.results.t_corr./gui.results.ac;
x = checkValues(x);

gui.data.phigao1 = phi_gao_1(x);

% Poisson's coefficient of the composite (film + substrate)
gui.data.nuc = composite_poissons_ratio(gui.data.nus, gui.data.nuf, ...
    gui.data.phigao1);

gui.data.phigao0 = phi_gao_0(x, gui.data.nuc);

bilayer_model = @(Ef_red_sol, x) ...
    ((1e-9*((2.*(1+gui.data.nuc)))./(((1-gui.data.phigao0) .* ...
    (1./((gui.data.Es./(2.*(1+gui.data.nus)))))) + ...
    (gui.data.phigao0.*(1./(1e9*(Ef_red_sol.*(1-gui.data.nuf.^2)) ./ ...
    (2.*(1+gui.data.nuf)))))))./(1-gui.data.nuc.^2));

% Make a starting guess
gui.results.A0 = gui.data.Ef_red;

[gui.results.Ef_red_sol_fit, ...
    gui.results.resnorm, ...
    gui.results.residual, ...
    gui.results.exitflag, ...
    gui.results.output, ...
    gui.results.lambda, ...
    gui.results.jacobian] =...
    lsqcurvefit(bilayer_model, gui.results.A0, x, ...
    gui.results.Esample_red, ...
    gui.config.numerics.Min_YoungModulus, ...
    gui.config.numerics.Max_YoungModulus, ...
    OPTIONS);

gui.results.Em_red =((1e-9 * ((2.*(1+gui.data.nuc)))./(((1-gui.data.phigao0) ...
    .* (1./((gui.data.Es./(2.*(1+gui.data.nus)))))) + ...
    (gui.data.phigao0.*(1./(1e9*(gui.results.Ef_red_sol_fit.*(1-gui.data.nuf.^2)) ...
    ./(2.*(1+gui.data.nuf))))))))./(1-gui.data.nuc.^2);

F      = gui.config.numerics.F_Hay;
mueq   = gui.results.Esample./(2.*(1+gui.data.nuc));
mus    = 1e-9.*gui.data.Es./(2.*(1+gui.data.nus));
A_Hay  = F.*gui.data.phigao0;
B_Hay  = mus - (((F.*gui.data.phigao0.^2) - ...
    gui.data.phigao0+1).*mueq);
C_Hay  = -gui.data.phigao0.*mueq.*mus;
muf    = (-B_Hay+(B_Hay.^2-(4.*A_Hay.*C_Hay)).^0.5) ./ ...
    (2.*A_Hay);
Ef     = (2.*muf.*(1+gui.data.nuf));

gui.results.Ef_red = reduced_YM(Ef, gui.data.nuf^2);

guidata(gcf, gui);

end