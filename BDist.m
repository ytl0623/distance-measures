function value = BDist( si, sj )
    mu1 = mean( si ) ;
    C1 = cov( si ) ;
    mu2 = mean( sj ) ;
    C2 = cov( sj ) ;
    C = ( C1 + C2 ) / 2 ;
    dmu = ( mu1 - mu2 ) / chol(C) ;
    value = ( 1 / 8 ) * dmu * transpose( dmu ) + ( 1 / 2 ) * log( det( C /chol( C1 * C2 ) ) ) ;
end