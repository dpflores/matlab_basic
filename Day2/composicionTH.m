syms alpha b d th;

Trotx =@(x) [[ 1,      0,       0, 0];
             [ 0, cos(x), -sin(x), 0];
             [ 0, sin(x),  cos(x), 0];
             [ 0,      0,       0, 1]];

Troty =@(y) [[  cos(y), 0, sin(y), 0];
             [       0, 1,      0, 0];
             [ -sin(y), 0, cos(y), 0];
             [       0, 0,      0, 1]];
         
Trotz =@(z) [[ cos(z), -sin(z), 0, 0];
             [ sin(z),  cos(z), 0, 0];
             [      0,       0, 1, 0];
             [      0,       0, 0, 1]];
       
Traslx =@(x) [[ 1, 0, 0, x];
              [ 0, 1, 0, 0];
              [ 0, 0, 1, 0];
              [ 0, 0, 0, 1]];
       
Trasly =@(y) [[ 1, 0, 0, 0];
              [ 0, 1, 0, y];
              [ 0, 0, 1, 0];
              [ 0, 0, 0, 1]];
       
Traslz =@(z) [[ 1, 0, 0, 0];
              [ 0, 1, 0, 0];
              [ 0, 0, 1, z];
              [ 0, 0, 0, 1]];
          
ATB = Trotz(alpha)*Trasly(b)*Traslz(d)*Troty(th)
