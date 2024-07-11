% Hydraulic Moment
function hmoment = theory_hmoment(ref,parameters)
% if ~isfield(parameters,'assumption')
%     parameters.assumption.liftforce = 1;
% else
%     if ~isfield(parameters.assumption,'liftforce')
%         parameters.assumption.liftforce = 1; 
%     end %if
% end %if
if (parameters.assumption.liftforce == 1)
    Fl = parameters.Fl;
else
    Fl = 0;
end %if
if (parameters.assumption.gravityforce == 1)
    [ Fmgl, Fmgd ] = theory_gravity(parameters);
else
    Fmgl = 0;
    Fmgd = 0;
end %if
switch ref
    case 'Smooth'
        Dp = parameters.Dp;
        a = parameters.a;
        Fd = parameters.Fd;
%         Fl = parameters.Fl;
        M = parameters.M;
%         alpha0 = Dp/2 - sqrt((Dp/2)^2 - a^2);
        alpha0 = 0;
        hmoment = M + (Fd-Fmgd)*(Dp/2 - alpha0) + Fl*a;
        return
    case 'Rough'
        Dp = parameters.Dp;
        a = parameters.a;
        Fd = parameters.Fd;
%         Fl = parameters.Fl;
        M = parameters.M;
        L = parameters.L;
        hmoment = M + (Fd-Fmgd)*L + Fl*a;
        return
end %switch

