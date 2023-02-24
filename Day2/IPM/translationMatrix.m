function T = translationMatrix(vector)

T = eye(4);
T(1:3,4) = vector(1:3);

end

