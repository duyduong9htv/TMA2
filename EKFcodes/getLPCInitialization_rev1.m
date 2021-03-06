function [stateVectorLPC,errorCovarMatrixLPC] = getLPCInitialization_rev1(stateVectorCartesian,errorCovarMatrixCartesian)

stateVectorLPC(1) = (stateVectorCartesian(3)*stateVectorCartesian(2)-stateVectorCartesian(4)*stateVectorCartesian(1))/ ...
                    ((stateVectorCartesian(1))^2+(stateVectorCartesian(2))^2);
stateVectorLPC(2) = (stateVectorCartesian(3)*stateVectorCartesian(1)+stateVectorCartesian(4)*stateVectorCartesian(2))/ ...
                    ((stateVectorCartesian(1))^2+(stateVectorCartesian(2))^2);
stateVectorLPC(3) = atan2(stateVectorCartesian(1),stateVectorCartesian(2));
stateVectorLPC(4) = 1/2*log(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);

F(1,1) = -stateVectorCartesian(4)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)- ...
    2*stateVectorCartesian(1)*(stateVectorCartesian(2)*stateVectorCartesian(3)-stateVectorCartesian(1)*stateVectorCartesian(4))/ ...
    (stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)^2;
F(1,2) = stateVectorCartesian(3)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)- ...
    2*stateVectorCartesian(2)*(stateVectorCartesian(2)*stateVectorCartesian(3)-stateVectorCartesian(1)*stateVectorCartesian(4))/ ...
    (stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)^2;
F(1,3) = stateVectorCartesian(2)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(1,4) = -stateVectorCartesian(1)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(2,1) = stateVectorCartesian(3)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)- ...
    2*stateVectorCartesian(1)*(stateVectorCartesian(1)*stateVectorCartesian(3)+stateVectorCartesian(2)*stateVectorCartesian(4))/ ...
    (stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)^2;
F(2,2) = stateVectorCartesian(4)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)- ...
    2*stateVectorCartesian(2)*(stateVectorCartesian(1)*stateVectorCartesian(3)+stateVectorCartesian(2)*stateVectorCartesian(4))/ ...
    (stateVectorCartesian(1)^2+stateVectorCartesian(2)^2)^2;
F(2,3) = stateVectorCartesian(1)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(2,4) = stateVectorCartesian(2)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(3,1) = stateVectorCartesian(2)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(3,2) = -stateVectorCartesian(1)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(3,3) = 0;
F(3,4) = 0;
F(4,1) = stateVectorCartesian(1)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(4,2) = stateVectorCartesian(2)/(stateVectorCartesian(1)^2+stateVectorCartesian(2)^2);
F(4,3) = 0;
F(4,4) = 0;

errorCovarMatrixLPC = F*errorCovarMatrixCartesian*transpose(F);


