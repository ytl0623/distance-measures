% X = multibandread('..\HW2\f130410t01p00r09rdn_e\f130410t01p00r09rdn_e_sc01_ort_img', [1293 743 224], 'int16', 0, 'bip', 'ieee-be');
% 580, 885
% 590, 890
bandLength = 224;
% X = [1 3; 5 7];
% X(:, :, 2)=[2 4; 6 8];
[h, w] = size(X(:, :, 1));


si = reshape(X(885, 580, :), [bandLength, 1]);
sj = reshape(X(890, 590, :), [bandLength, 1]);

% SAM OK
% sisj = sum(si .* sj);
% siSqrt = sqrt(sum(si.^2));
% sjSqrt = sqrt(sum(sj.^2));
% 
% SAM = acos(sisj/(siSqrt*sjSqrt));
% 
% score = sam(si, sj);

% SID
% sumSi = sum(si);
% sumSj = sum(sj);
% pi = si ./ sumSi;
% pj = sj ./ sumSj;
% pipj = pi./pj;
% pjpi = pj./pi;
% Di = -log(pipj);
% Dj = -log(pjpi);
% 
% DDi = sum(pi.*Di);
% DDj = sum(pj.*Dj);
% SID = DDi+DDj;
% score = sid(si,sj);


% OPD
% I = eye(224);
% siSharp = (transpose(si) * si)\transpose(si);
% Psi = I*(-si)*siSharp;
% sjSharp = (transpose(sj) * sj)\transpose(sj);
% Psj = I*(-sj)*sjSharp;
% OPD = sqrt(transpose(si)*Psj*si + transpose(sj)*Psi*sj);

% ED
% ED = sqrt(sum((si-sj) .^ 2));

% CMD RMD CMFD RMFD
% 每個band各自相加 然後reshape成(h*w) x 1矩陣
% sum_ = reshape(sum(X, [1, 2]), [bandLength 1]);
% mean_ = sum_ / (h*w);
% mm = mean_ * transpose(mean_);
% bands = zeros(h, w, bandLength);
% for i = 1:bandLength
%     bands(:, :, i) = X(:, :, i) - mean_(i);
% end
% 
% xi = transpose(reshape(bands, [h*w bandLength]));
% 
% K = xi * transpose(xi)/(h*w) - mm;
% R = K - mm;

CMD = transpose(si - sj) /K * (si - sj);
RMD = transpose(si - sj) /R * (si - sj);

CMFD = transpose(si - mean_) /K * (sj - mean_);
RMFD = transpose(si) /R * (sj);
