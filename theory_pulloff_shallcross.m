% -------------------------------------------------------------
% theory_pulloff_shallcross
%
% Adhesion force based on You and Wan 2013, 2014 as presented by
%
% Shallcross, Gregory S., William A. Hoey, John R. Anderson, Carlos
% Soares, and Moogega Cooper. 2024. "Modeling Adhesion and Aerodynamic
% Removal of Particles and Spores from Substrates." Journal of Aerosol
% Science 176 (February):106294. https://doi.org/10.1016/j.jaerosci.2023.106294.
% -------------------------------------------------------------
function Fpo = theory_pulloff_shallcross(parameters)
    Dp = parameters.Dp;
    Wa = parameters.Wa;
    K = parameters.K;
    H = parameters.shallcross.H;
    a = theory_cradius('DMT-Rough-Shallcross', parameters);

    sigma_a_1 = parameters.shallcross.sigma_a_1;
    beta_a_1 = parameters.shallcross.beta_a_1;

    sigma_a_2 = parameters.shallcross.sigma_a_2;
    beta_a_2 = parameters.shallcross.beta_a_2;

    sigma_1 = sigma_a_1*(a/beta_a_1)^H; % equation 9
    sigma_2 = sigma_a_2*(a/beta_a_2)^H;
    sigma = sqrt(sigma_1*sigma_1 + sigma_2*sigma_2);

    rprime = 1.485*sigma;               % equation 8
    dem = sqrt(2.0)*sigma;
    hmin = 2.7*dem;           
    del1 = (2*pi*rprime*rprime*Wa/K)^(2/3)/rprime; % 

    C = 0.5*(erf((del1-hmin)/dem) - erf(-hmin/dem)); % equation 12

    Fpo = 4*a*a*a*K*C^(1.5)/Dp;         % equation 16
    
end

