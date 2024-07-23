% Fmgl = gravity in the direction of opposite to lift
% Fmgt = gravity in the direction of opposite to drag
function [ Fmgl, Fmgd ] = theory_gravity(parameters)
    
Dp = parameters.Dp;
rho_p = parameters.rho_p;

Fmgl = rho_p * 4/3*pi*(Dp/2)^3 * 9.81;
Fmgd = 0.0;

if isfield(parameters, 'theta')
    % Angle of substrate incline (CCW), degrees
    theta = deg2rad(parameters.theta);
    Fmgd = Fmgl*sin(theta);
    Fmgl = Fmgl*cos(theta);
    % [ theta, Fmgl, Fmgd ]
end

end
      

