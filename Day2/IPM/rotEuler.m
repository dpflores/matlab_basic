function R = rotEuler(roll, pitch, yaw)


si = sin(roll); sj = sin(pitch); sk = sin(yaw);
ci = cos(roll); cj = cos(pitch); ck = cos(yaw);

cc = ci*ck; cs = ci*sk;
sc = si*ck; ss = si*sk;

R = eye(4);
R(1,1) = cj*ck; R(1,2) = sj*sc - cs; R(1,3) = sj*cc - sc;
R(2,1) = cj*sk; R(2,2) = sj*ss + cc; R(2,3) = sj*cs - sc;
R(3,1) = -sj; R(3,2) = cj*si; R(3,3) = cj*ci;
 
end