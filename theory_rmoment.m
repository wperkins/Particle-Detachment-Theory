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
switch ref
    case 'Detached moment-Smooth'
        a = parameters.a;
        Fpo = parameters.Fpo;
        rmoment = (Fpo + Fmgl)*a;
        return
    case 'Detached moment-No gravitational force-Smooth'
        a = parameters.a;
        Fpo = parameters.Fpo;
        Fmg = 0;
        rmoment = (Fpo + Fmgl)*a;
        return
    case 'MmaxJKR-Smooth'
        Dp = parameters.Dp;
        Wa = parameters.Wa;
        K = parameters.K;
        a = parameters.a;
        Mmax = 2.70716 * Wa^(4/3)*Dp^(5/3)/K^(1/3);
        rmoment = Mmax + Fmgl*a;
        return
    case 'MmaxDMT-Smooth'
        Dp = parameters.Dp;
        Wa = parameters.Wa;
        K = parameters.K;
        a = parameters.a;
        Mmax = 1.7254 * Wa^(4/3)*Dp^(5/3)/K^(1/3);
        rmoment = Mmax + Fmgl*a;
        return
    case 'Detached moment-Rough'
        a = parameters.a;
        FM = parameters.FM;
        rmoment = (FM + Fmgl)*a;
        return
end %switch

