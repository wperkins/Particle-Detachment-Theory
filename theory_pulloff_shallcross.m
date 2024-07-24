function Fpo = theory_pulloff_shallcross(model, parameters)
    Dp = parameters.Dp;
    Wa = parameters.Wa;
    K = parameters.K;

    H = parameters.shallcross.H
    sigma_a_1 = parameters.shallcross.sigma_a_1
    beta_a_1 = parameters.shallcross.beta_a_1
    sigma_1 = sigma_a_1*(Dp/beta_a_1)^H;

    sigma_a_2 = parameters.shallcross.sigma_a_2
    beta_a_2 = parameters.shallcross.beta_a_2
    sigma_2 = sigma_a_2*(Dp/beta_a_2)^H;
    
    sigma = sqrt(sigma_1*sigma_1 + sigma_2*sigma_2);

    rprime = 1.485*sigma;
    dem = sqrt(2.0)*sigma;
    hmin = 2.7*dem;
    del1 = (2*pi*rprime*rprime*Wa/K)^(2/3)/rprime;

    C = 0.5*(erf((del1-hmin1)/dem) - erf(-hmin/dem));

    a = theory_cradius('DMT-Rough-Shallcross', parameters)

    Fpo = 4*a*a*a*Wa*C^(1.5)/Dp
    
end

