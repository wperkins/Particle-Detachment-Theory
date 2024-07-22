% Resistance Moment
function rmoment = theory_rmoment(ref,parameters)
% if ~isfield(parameters,'assumption')
%     parameters.assumption.gravityforce = 0;
% else
%     if ~isfield(parameters.assumption,'gravityforce')
%         parameters.assumption.gravityforce = 0;
%     end %if
% end %if
if (parameters.assumption.gravityforce == 1)
    [ Fmgl, Fmgd ] = theory_gravity(parameters);
else
    Fmgl = 0;
    Fmgd = 0;
end %if
Dp = parameters.Dp;
a = parameters.a;
switch ref
    case 'Detached moment-Smooth'
        Fpo = parameters.Fpo;
        rmoment = (Fpo + Fmgl)*a + Fmgd*Dp/2.0; 
        return
    case 'Detached moment-No gravitational force-Smooth'
        Fpo = parameters.Fpo;
        Fmg = 0;
        rmoment = (Fpo + Fmgl)*a + Fmgd*Dp/2.0;
        return
    case 'MmaxJKR-Smooth'
        Wa = parameters.Wa;
        K = parameters.K;
        Mmax = 2.70716 * Wa^(4/3)*Dp^(5/3)/K^(1/3);
        rmoment = Mmax + Fmgl*a + Fmgd*Dp/2.0;
        return
    case 'MmaxDMT-Smooth'
        Wa = parameters.Wa;
        K = parameters.K;
        Mmax = 1.7254 * Wa^(4/3)*Dp^(5/3)/K^(1/3);
        rmoment = Mmax + Fmgl*a + Fmgd*Dp/2.0;
        return
    case 'Detached moment-Rough'
        FM = parameters.FM;
        L = parameters.L;
        rmoment = (FM + Fmgl)*a + Fmgd*L;
        return
end %switch

