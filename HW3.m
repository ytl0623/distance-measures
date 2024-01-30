clear ;
clc ;

X = multibandread( 'C:\Users\User\Downloads\»»´ú¼v¹³\radiance\f170203t01p00r19rdn_e\f170203t01p00r19rdn_e_sc01_ort_img', [1114 733 224], 'int16', 0, 'bip', 'ieee-be' ) ;

bandLength = 224 ;

[h, w] = size(X(:, :, 1)) ;
h = 1114 ;
w = 733 ;

si = reshape( X( 800, 500, : ), [bandLength, 1] ) ;
sj = reshape( X( 820, 550, : ), [bandLength, 1] ) ;

disp( "1. SAM value = " + SAM( si, sj ) ) ;

disp( "2. SID value = " + SID( si, sj ) ) ;

disp( "3. OPD value = " + OPD( si, sj ) ) ;

disp( "4. ED value = " + ED( si, sj ) ) ;

sum_ = reshape( sum( X, [1, 2] ), [bandLength 1] ) ;
mu = sum_ / ( h * w ) ;
mm = mu * transpose( mu ) ;
bands = zeros( h, w, bandLength ) ;
for i = 1 : bandLength
    bands( :, :, i ) = X( :, :, i ) - mu( i ) ;
end

xi = transpose( reshape( bands, [h * w bandLength] ) ) ;
K = xi * transpose( xi ) / ( h * w ) - mm ;
R = K - mm ;

disp( "5. CMD value = " + CMD( K, si, sj ) ) ;

disp( "6. RMD value = " + RMD( R, si, sj ) ) ;

disp( "7. CMFD value = " + CMFD( K, mu, si, sj ) ) ;

disp( "8. RMFD value = " + RMFD( R, si, sj ) ) ;

disp( "9. Bhattacharyya Distance = " + BDist( si, sj ) ) ;

SAMNoiseList = [] ;
SIDNoiseList = [] ;
OPDNoiseList = [] ;
EDNoiseList = [] ;
CMDNoiseList = [] ;
RMDNoiseList = [] ;
CMFDNoiseList = [] ;
RMFDNoiseList = [] ;
BDistNoiseList = [] ;

for noise = 1 : 1000
    siNoise = awgn( si, noise, 'measured' ) ;
    sjNoise = awgn( sj, noise, 'measured' ) ;
    
    SAMNoiseList( end + 1 ) = SAM( siNoise, sjNoise ) ;
    disp( "10. SAM Noise value = " + SAMNoiseList( end ) ) ;
    
    SIDNoiseList( end + 1 ) = SID( siNoise, sjNoise ) ;
    disp( "11. SID Noise value = " + SIDNoiseList( end ) ) ;
    
    OPDNoiseList( end + 1 ) = OPD( siNoise, sjNoise ) ;
    disp( "12. OPD Noise value = " + OPDNoiseList( end ) ) ;
    
    EDNoiseList( end + 1 ) = ED( siNoise, sjNoise ) ;
    disp( "13. ED Noise value = " + EDNoiseList( end ) ) ;
    
    CMDNoiseList( end + 1 ) = CMD( K, siNoise, sjNoise ) ;
    disp( "14. CMD Noise value = " + CMDNoiseList( end ) ) ;
    
    RMDNoiseList( end + 1 ) = RMD( R, siNoise, sjNoise ) ;
    disp( "15. RMD Noise value = " + RMDNoiseList( end ) ) ;
    
    CMFDNoiseList( end + 1 ) = CMFD( K, mu, siNoise, sjNoise ) ;
    disp( "16. CMFD Noise value = " + CMFDNoiseList( end ) ) ;
    
    RMFDNoiseList( end + 1 ) = RMFD( R, siNoise, sjNoise ) ;
    disp( "17. RMFD Noise value = " + RMFDNoiseList( end ) ) ;
    
    BDistNoiseList( end + 1 ) = BDist( siNoise, sjNoise ) ;
    disp( "18. Bhattacharyya Distance = " + BDistNoiseList( end ) ) ;
end

SAMNoise = CoefficientOfVariation( SAMNoiseList ) ;
SIDNoise = CoefficientOfVariation( SIDNoiseList ) ;
OPDNoise = CoefficientOfVariation( OPDNoiseList ) ;
EDNoise = CoefficientOfVariation( EDNoiseList ) ;
CMDNoise = CoefficientOfVariation( CMDNoiseList ) ;
RMDNoise = CoefficientOfVariation( RMDNoiseList ) ;
CMFDNoise = CoefficientOfVariation( CMFDNoiseList ) ;
RMFDNoise = CoefficientOfVariation( RMFDNoiseList ) ;
BDistNoise = CoefficientOfVariation( BDistNoiseList ) ;






